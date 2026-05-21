$SourceDir = "D:\opencodeproject\ruoyi-vue-pro\yudao-module-mes\src\main\java\cn\iocoder\yudao\module\mes\dal\dataobject"
$OutputFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_all_tables.sql"
$ExistingFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_create_tables.sql"

function CamelToSnake {
    param([string]$s)
    if ([string]::IsNullOrEmpty($s)) { return $s }
    return [regex]::Replace($s, '(?<=[a-z0-9])[A-Z]|(?<=[A-Z])[A-Z](?=[a-z])', '_\$&').ToLower()
}

$typeMap = @{}
$typeMap['Long']='bigint'; $typeMap['long']='bigint'
$typeMap['Integer']='int'; $typeMap['int']='int'
$typeMap['String']='varchar(500)'
$typeMap['Boolean']='bit(1)'; $typeMap['boolean']='bit(1)'
$typeMap['BigDecimal']='decimal(19,2)'
$typeMap['LocalDateTime']='datetime'; $typeMap['LocalDate']='date'; $typeMap['LocalTime']='time'
$typeMap['Byte']='tinyint'; $typeMap['byte']='tinyint'
$typeMap['Short']='smallint'; $typeMap['short']='smallint'
$typeMap['Double']='double'; $typeMap['double']='double'
$typeMap['Float']='float'; $typeMap['float']='float'
$typeMap['Date']='datetime'

$existing = @{}
if (Test-Path $ExistingFile) {
    Get-Content $ExistingFile | ForEach-Object {
        if ($_ -match '\"mes_\w+\"') { $existing[$matches[0].Trim('"')] = $true }
    }
}
"mes_pro_work_order,mes_dv_machinery,mes_pro_andon_record,mes_dv_repair,mes_dv_repair_line,mes_dv_mainten_record,mes_dv_check_record,mes_dv_check_plan".Split(',') | ForEach-Object { $existing[$_] = $true }

$output = @()
$total = 0
$created = 0

Get-ChildItem -Recurse -Filter "*.java" -Path $SourceDir | ForEach-Object {
    $total++
    $content = [System.IO.File]::ReadAllText($_.FullName)
    
    $tableName = ""
    if ($content -match '@TableName\("([^"]+)"\)') { $tableName = $matches[1] } else { return }
    if ($existing.ContainsKey($tableName)) { return }
    
    $created++
    
    $cols = @()
    $i = 0
    $lines = $content -split "`n"
    while ($i -lt $lines.Count) {
        $line = $lines[$i].Trim()
        
        if ($line -match '^private\s+(static\s+)?(final\s+)?(\w[\w.]*)\s+(\w+)\s*;') {
            $type = $matches[3]
            $name = $matches[4]
            if ($name -in @('creator','createTime','updater','updateTime','deleted','tenantId','serialVersionUID')) { $i++; continue }
            
            $colName = CamelToSnake $name
            $mySqlType = $typeMap[$type]
            if (-not $mySqlType) {
                if ($type -match '<') { $i++; continue }
                $mySqlType = "varchar(255)"
            }
            
            $isId = ($line -match '@TableId') -or ($i -gt 0 -and $lines[$i-1].Trim() -match '@TableId')
            
            $cols += @{ColName=$colName; Type=$mySqlType; IsPk=$isId}
        }
        $i++
    }
    
    # Build DDL as array of strings
    $ddl = @()
    $ddl += "DROP TABLE IF EXISTS $tableName;"
    $ddl += "CREATE TABLE IF NOT EXISTS $tableName ("
    
    $colDefs = @("  id bigint NOT NULL AUTO_INCREMENT COMMENT 'ID'")
    foreach ($c in $cols) {
        if ($c.IsPk) { continue }
        $colDefs += "  $($c.ColName) $($c.Type) DEFAULT NULL COMMENT '$($c.ColName)'"
    }
    $colDefs += "  creator varchar(64) DEFAULT '' COMMENT '创建者'"
    $colDefs += "  create_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'"
    $colDefs += "  updater varchar(64) DEFAULT '' COMMENT '更新者'"
    $colDefs += "  update_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'"
    $colDefs += "  deleted bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除'"
    $colDefs += "  tenant_id bigint NOT NULL DEFAULT 0 COMMENT '租户编号'"
    
    $ddl += ($colDefs -join ",`n")
    $ddl += ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='$tableName';"
    
    # Write table DDL
    $output += ($ddl -join "`n") + "`n"
    Write-Host "[$created] $tableName"
}

Write-Host "---"
Write-Host "Total DO files: $total"
Write-Host "New tables: $created"

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($OutputFile, $output, $utf8NoBom)
Write-Host "Written: $OutputFile"
