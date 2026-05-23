# Generate DDL for module tables
$ErrorActionPreference = "Continue"
$projectRoot = "D:\opencodeproject\ruoyi-vue-pro"
$bt = [char]0x60  # backtick

$typeMap = @{
    "String"="VARCHAR(500)"; "Long"="BIGINT"; "Integer"="INT"; "Boolean"="TINYINT(1)"
    "LocalDateTime"="DATETIME"; "LocalDate"="DATE"; "BigDecimal"="DECIMAL(24,6)"
    "Double"="DOUBLE"; "Float"="FLOAT"; "Byte"="TINYINT"; "Short"="SMALLINT"
}
$largeFieldPatterns = @('content','description','remark','message','config','ext$','json','data','error_info','stack_trace','text','prompt','answer','payload','reasoning','sql$','script','template','html$','css$','input','output','result$','response','request','comment','note','intro','avatar','logo','pic_url','image_url','icon','img_url','cover_url','configure','setting','options','params','feature')

$modulesToScan = @("yudao-module-pay","yudao-module-bpm","yudao-module-member","yudao-module-mp","yudao-module-crm","yudao-module-erp","yudao-module-ai","yudao-module-report","yudao-module-mall\yudao-module-product","yudao-module-mall\yudao-module-promotion","yudao-module-mall\yudao-module-trade","yudao-module-mall\yudao-module-statistics","yudao-module-iot\yudao-module-iot-biz")

$out = New-Object System.Text.StringBuilder
$null = $out.AppendLine("-- Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n")

$count = 0
foreach ($module in $modulesToScan) {
    $searchPath = Join-Path $projectRoot $module
    if (-not (Test-Path $searchPath)) { continue }

    Get-ChildItem -Path $searchPath -Filter "*.java" -Recurse -ErrorAction SilentlyContinue | Where-Object {
        $_.FullName -match "\\dal\\dataobject\\" -and $_.FullName -notmatch "\\test\\" -and $_.FullName -notmatch "\\target\\"
    } | ForEach-Object {
        $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue; if (-not $content) { return }
        $tblName = $null
        if ($content -match '@TableName\(value\s*=\s*"([^"]+)"[^)]*\)') { $tblName = $Matches[1] }
        elseif ($content -match '@TableName\("([^"]+)"\)') { $tblName = $Matches[1] }
        elseif ($content -match '@TableName\(value\s*=\s*"([^"]+)"\)') { $tblName = $Matches[1] }
        if (-not $tblName) { return }

        $className = ""; if ($content -match 'class\s+(\w+DO)\s+') { $className = $Matches[1] }
        $moduleName = ""; if ($_.FullName -match 'yudao-module-(\w+)\\') { $moduleName = $Matches[1] } elseif ($_.FullName -match 'yudao-module-mall\\yudao-module-(\w+)') { $moduleName = "mall-$($Matches[1])" }
        $extendsTenant = ($content -match 'extends\s+\w*(?:Tenant)?BaseDO')

        Write-Output "Found: $tblName"

        $fieldDefs = @(); $buf = ""
        foreach ($line in ($content -split "`r`n|`n")) {
            $t = $line.Trim()
            if ($t -match '^\s*class\s+') { continue }
            if ($t -match '^\s*\}\s*$') { continue }
            if ($t -match '^\s*$') { continue }
            if ($t -match '^\s*(?:private|public|protected)\s+(\S+)\s+(\w+)\s*[=;]') {
                $j=$Matches[1]; $f=$Matches[2]
                if ($f -match '^(serialVersionUID|transMap)$') { continue }
                $fieldDefs += @{type=$j;name=$f;annotation=$buf}; $buf=''
            } elseif ($t -match '^\s*@\w+') { if ($buf) { $buf+=" $t" } else { $buf=$t } }
        }

        $count++
        $null = $out.AppendLine("`n-- Table: $tblName ($className, $moduleName)")
        $null = $out.Append(('CREATE TABLE IF NOT EXISTS {0}{1}{0} (' -f $bt, $tblName))

        $cols = New-Object System.Collections.ArrayList
        $null = $cols.Add(('  {0}id{0} BIGINT NOT NULL AUTO_INCREMENT' -f $bt))

        $seen = @{'id'=$true;'createTime'=$true;'updateTime'=$true;'creator'=$true;'updater'=$true;'deleted'=$true}
        $hasTenantField = $false

        foreach ($fd in $fieldDefs) {
            $jType=$fd.type; $fName=$fd.name; $annot=$fd.annotation
            if ($seen.ContainsKey($fName)) { continue }; $seen[$fName]=$true
            $colName = ($fName -creplace '[A-Z]','_$&').ToLower().TrimStart('_')
            if ($fName -eq 'tenantId') { $hasTenantField=$true }

            $mysqlType = $typeMap[$jType]
            if (-not $mysqlType) { if ($jType -match '^List<|^Set<') { $mysqlType='TEXT' } else { $mysqlType='VARCHAR(500)' } }
            foreach ($pat in $largeFieldPatterns) { if ($fName -match $pat) { $mysqlType='TEXT'; if ($fName -match 'content|json|config|payload|template|html') { $mysqlType='LONGTEXT' }; break } }
            if ($jType -eq 'String') { if ($fName -match 'phone|mobile|email|url|ip|host') { $mysqlType='VARCHAR(50)' } elseif ($fName -match 'name|title|subject|captcha|code') { $mysqlType='VARCHAR(100)' } elseif ($fName -match 'nickname|username|real_name|password|token') { $mysqlType='VARCHAR(255)' } elseif ($fName -match 'remark|description|memo|note') { $mysqlType='TEXT' } elseif ($fName -match '^type|^status|^state') { $mysqlType='TINYINT(1)' } }
            if ($jType -eq 'BigDecimal' -and $fName -match 'price|amount|money|fee|charge|total|cost|balance|budget') { $mysqlType='DECIMAL(24,2)' }
            if ($annot -match '@Size\(max\s*=\s*(\d+)\)') { $n=[int]$Matches[1]; if ($n -le 65535) { $mysqlType="VARCHAR($n)" } }
            $notNull=''; if ($annot -match '@NotNull|@NotBlank|@NotEmpty') { $notNull=' NOT NULL' }
            if ($fName -match '^(createTime|updateTime|creator|updater|deleted)\b') { continue }

            $null = $cols.Add(('  {0}{1}{0} {2}{3}' -f $bt, $colName, $mysqlType, $notNull))
        }
        $null = $cols.Add(('  {0}create_time{0} DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP' -f $bt))
        $null = $cols.Add(('  {0}update_time{0} DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP' -f $bt))
        $null = $cols.Add(('  {0}creator{0} VARCHAR(64) NULL' -f $bt))
        $null = $cols.Add(('  {0}updater{0} VARCHAR(64) NULL' -f $bt))
        $null = $cols.Add(('  {0}deleted{0} TINYINT(1) NOT NULL DEFAULT 0' -f $bt))
        if ($extendsTenant -and -not $hasTenantField) {
            $null = $cols.Add(('  {0}tenant_id{0} BIGINT NOT NULL DEFAULT 0' -f $bt))
        }
        $null = $cols.Add(('  PRIMARY KEY ({0}id{0}) USING BTREE' -f $bt))

        $null = $out.AppendLine(($cols -join ",`n"))
        $null = $out.AppendLine(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;")
    }
}

$outputFile = "$projectRoot\sql\module_tables_ddl.sql"
$out.ToString() | Out-File -FilePath $outputFile -Encoding utf8
$fileSize = (Get-Item $outputFile).Length
Write-Output "Generated: $outputFile ($count tables, $fileSize bytes)"
