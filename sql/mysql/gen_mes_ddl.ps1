$SourceDir = "D:\opencodeproject\ruoyi-vue-pro\yudao-module-mes\src\main\java\cn\iocoder\yudao\module\mes\dal\dataobject"
$OutputFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_all_tables.sql"
$ExistingFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_create_tables.sql"

function ConvertTo-SnakeCase {
    param([string]$s)
    if ([string]::IsNullOrEmpty($s)) { return $s }
    $sb = [System.Text.StringBuilder]::new()
    for ($i = 0; $i -lt $s.Length; $i++) {
        $c = $s[$i]
        if ($c -ge 'A' -and $c -le 'Z') {
            if ($i -gt 0) {
                $prev = $s[$i-1]
                $next = if ($i -lt $s.Length - 1) { $s[$i+1] } else { 'x' }
                if (($prev -ge 'a' -and $prev -le 'z') -or ($next -ge 'a' -and $next -le 'z')) {
                    [void]$sb.Append('_')
                }
            }
            [void]$sb.Append([char]($c + 32))
        } else {
            [void]$sb.Append($c)
        }
    }
    return $sb.ToString()
}

$typeMap = [ordered]@{}
$typeMap['Long']='bigint'
$typeMap['long']='bigint'
$typeMap['Integer']='int'
$typeMap['int']='int'
$typeMap['String']='varchar(500)'
$typeMap['Boolean']='bit(1)'
$typeMap['boolean']='bit(1)'
$typeMap['BigDecimal']='decimal(19,2)'
$typeMap['LocalDateTime']='datetime'
$typeMap['LocalDate']='date'
$typeMap['LocalTime']='time'
$typeMap['Byte']='tinyint'
$typeMap['byte']='tinyint'
$typeMap['Short']='smallint'
$typeMap['short']='smallint'
$typeMap['Double']='double'
$typeMap['double']='double'
$typeMap['Float']='float'
$typeMap['float']='float'
$typeMap['Date']='datetime'

# Collect existing table names
$existing = @{}
if (Test-Path $ExistingFile) {
    Get-Content $ExistingFile | Select-String '"mes_' | ForEach-Object {
        if ($_ -match '"mes_\w+"') { $existing[$matches[0].Trim('"')] = $true }
    }
}

# Also add tables from previous DDLs
"mes_pro_work_order,mes_dv_machinery,mes_pro_andon_record,mes_dv_repair,mes_dv_repair_line,mes_dv_mainten_record,mes_dv_check_record,mes_dv_check_plan".Split(',') | ForEach-Object { $existing[$_] = $true }

$output = New-Object System.Collections.ArrayList

# Find all DO files  
$files = Get-ChildItem -Recurse -Filter "*.java" -Path $SourceDir

$total = 0
$created = 0

foreach ($f in $files) {
    $total++
    $content = [System.IO.File]::ReadAllText($f.FullName)
    
    $tableName = ""
    if ($content -match '@TableName\("([^"]+)"\)') {
        $tableName = $matches[1]
    } else { continue }
    
    if ($existing.ContainsKey($tableName)) { continue }
    
    $created++
    
    # Extract field lines - simple line-by-line approach
    $lines = $content -split "`n"
    $cols = @()
    
    $i = 0
    while ($i -lt $lines.Count) {
        $line = $lines[$i].Trim()
        
        # Match field declarations: private Type name;
        if ($line -match '^private\s+(static\s+)?(final\s+)?(\w[\w.]*)\s+(\w+)\s*;') {
            $type = $matches[3]
            $name = $matches[4]
            
            # Skip BaseDO fields
            if ($name -in @('creator','createTime','updater','updateTime','deleted','tenantId','serialVersionUID')) { continue }
            
            $colName = ConvertTo-SnakeCase $name
            $mySqlType = $typeMap[$type]
            if (-not $mySqlType) { 
                # Skip generic types like List<...>
                if ($type -match '<') { $i++; continue }
                $mySqlType = "varchar(255)"
            }
            
            # Check if @TableId is on this or previous line
            $isId = $false
            if ($line -match '@TableId') { $isId = $true }
            if ($i -gt 0) {
                $prevLine = $lines[$i-1].Trim()
                if ($prevLine -match '@TableId') { $isId = $true }
            }
            
            $cols += @{
                ColName = $colName
                Type = $mySqlType
                IsPk = $isId
            }
        }
        $i++
    }
    
    # Build DDL
    $ddl = "DROP TABLE IF EXISTS `$tableName`;`n"
    $ddl += "CREATE TABLE IF NOT EXISTS `$tableName` (`n"
    $ddl += "  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID'"
    
    foreach ($c in $cols) {
        if ($c.IsPk) { continue }
        $ddl += ",`n  `$($c.ColName)` $($c.Type) DEFAULT NULL COMMENT '$($c.ColName)'"
    }
    
    $ddl += ",`n  `creator` varchar(64) DEFAULT '' COMMENT '创建者'"
    $ddl += ",`n  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'"
    $ddl += ",`n  `updater` varchar(64) DEFAULT '' COMMENT '更新者'"
    $ddl += ",`n  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'"
    $ddl += ",`n  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除'"
    $ddl += ",`n  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号'"
    $ddl += "`n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='$tableName';`n"
    
    [void]$output.Add($ddl)
    Write-Host "[$created] $tableName"
}

Write-Host "---"
Write-Host "Total DO files: $total"
Write-Host "Already existing: $($existing.Count)"
Write-Host "New tables generated: $created"
Write-Host "Output: $OutputFile"

[System.IO.File]::WriteAllLines($OutputFile, $output.ToArray(), [System.Text.UTF8Encoding]::new($false))
