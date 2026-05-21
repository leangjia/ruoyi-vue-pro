$SourceDir = "D:\opencodeproject\ruoyi-vue-pro\yudao-module-mes\src\main\java\cn\iocoder\yudao\module\mes\dal\dataobject"
$OutputFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_all_tables_en.sql"
$ExistingFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_create_tables.sql"

function CamelToSnake {
    param([string]$s)
    if ([string]::IsNullOrEmpty($s)) { return $s }
    $result = [regex]::Replace($s, '(?<=[a-z0-9])[A-Z]|(?<=[A-Z])[A-Z](?=[a-z])', { param($m) "_" + $m.Value.ToLower() })
    return $result.ToLower()
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
        if ($_ -match 'mes_\w+') { $existing[$matches[0]] = $true }
    }
}

$outputLines = [System.Collections.ArrayList]::new()
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
            $type = $matches[3]; $name = $matches[4]
            if ($name -in @('creator','createTime','updater','updateTime','deleted','tenantId','serialVersionUID')) { $i++; continue }
            $colName = CamelToSnake $name
            $mySqlType = $typeMap[$type]
            if (-not $mySqlType) { if ($type -match '<') { $i++; continue }; $mySqlType = "varchar(255)" }
            $isId = ($line -match '@TableId') -or ($i -gt 0 -and $lines[$i-1].Trim() -match '@TableId')
            $cols += @{ColName=$colName; Type=$mySqlType; IsPk=$isId}
        }
        $i++
    }

    [void]$outputLines.Add("DROP TABLE IF EXISTS $tableName;")
    $colDefs = [System.Collections.ArrayList]::new()
    [void]$colDefs.Add("  id bigint NOT NULL AUTO_INCREMENT COMMENT 'ID'")
    foreach ($c in $cols) {
        if ($c.IsPk) { continue }
        [void]$colDefs.Add("  $($c.ColName) $($c.Type) DEFAULT NULL COMMENT '$($c.ColName)'")
    }
    [void]$colDefs.Add("  creator varchar(64) DEFAULT '' COMMENT 'creator'")
    [void]$colDefs.Add("  create_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time'")
    [void]$colDefs.Add("  updater varchar(64) DEFAULT '' COMMENT 'updater'")
    [void]$colDefs.Add("  update_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time'")
    [void]$colDefs.Add("  deleted bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted'")
    [void]$colDefs.Add("  tenant_id bigint NOT NULL DEFAULT 0 COMMENT 'tenant_id'")

    $colDefs.Add("  PRIMARY KEY (id) USING BTREE")
    $createTable = "CREATE TABLE IF NOT EXISTS $tableName ("
    $createTable += ($colDefs -join ",`n")
    $createTable += ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='$tableName';"
    [void]$outputLines.Add($createTable)
    [void]$outputLines.Add("")
    Write-Host "[$created] $tableName"
}

Write-Host "---"
Write-Host "Total DO files: $total"
Write-Host "New tables: $created"

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($OutputFile, $outputLines, $utf8NoBom)
Write-Host "Written: $OutputFile"
