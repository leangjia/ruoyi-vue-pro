param(
    [string]$SourceDir = "D:\opencodeproject\ruoyi-vue-pro\yudao-module-mes\src\main\java\cn\iocoder\yudao\module\mes\dal\dataobject",
    [string]$OutputFile = "D:\opencodeproject\ruoyi-vue-pro\sql\mysql\mes_all_tables.sql"
)

$typeMap = @{}
$typeMap["Long"] = "bigint"
$typeMap["long"] = "bigint"
$typeMap["Integer"] = "int"
$typeMap["int"] = "int"
$typeMap["String"] = "varchar(500)"
$typeMap["Boolean"] = "bit(1)"
$typeMap["boolean"] = "bit(1)"
$typeMap["BigDecimal"] = "decimal(19,2)"
$typeMap["LocalDateTime"] = "datetime"
$typeMap["LocalDate"] = "date"
$typeMap["LocalTime"] = "time"
$typeMap["Byte"] = "tinyint"
$typeMap["byte"] = "tinyint"
$typeMap["Short"] = "smallint"
$typeMap["short"] = "smallint"
$typeMap["Double"] = "double"
$typeMap["double"] = "double"
$typeMap["Float"] = "float"
$typeMap["float"] = "float"
$typeMap["Date"] = "datetime"
$typeMap["byte[]"] = "blob"
$typeMap["InputStream"] = "longblob"

$existingTables = @{}
"mes_cal_plan,mes_cal_plan_shift,mes_cal_plan_team,mes_cal_team_shift,mes_md_auto_code_rule,mes_md_auto_code_part,mes_md_auto_code_record,mes_wm_arrival_notice,mes_wm_outsource_receipt,mes_qc_iqc,mes_qc_ipqc,mes_pro_feedback,mes_wm_product_produce,mes_wm_product_produce_line,mes_wm_product_produce_detail,mes_qc_oqc,mes_qc_rqc,mes_wm_product_sales_line,mes_wm_return_issue_line,mes_wm_return_sales_line,mes_wm_item_receipt,mes_wm_item_receipt_line,mes_wm_item_receipt_detail,mes_wm_item_consume,mes_wm_item_consume_line,mes_wm_item_consume_detail,mes_wm_batch,mes_wm_material_stock,mes_pro_task,mes_pro_route_process,mes_wm_product_sales_detail,mes_qc_indicator_result,mes_pro_work_order,mes_dv_machinery,mes_pro_andon_record,mes_dv_repair,mes_dv_repair_line,mes_dv_mainten_record,mes_dv_check_record,mes_dv_check_plan".Split(",") | ForEach-Object { $existingTables[$_.Trim()] = $true }

$outputLines = [System.Collections.ArrayList]::new()
[void]$outputLines.Add("-- MES All Tables DDL - Auto-generated from DO classes")
[void]$outputLines.Add("")
[void]$outputLines.Add("SET NAMES utf8mb4;")
[void]$outputLines.Add("")

function ConvertTo-SnakeCase {
    param([string]$name)
    $sb = [System.Text.StringBuilder]::new()
    $i = 0
    while ($i -lt $name.Length) {
        $c = $name[$i]
        if ($c -ge 'A' -and $c -le 'Z') {
            if ($i -gt 0) {
                $prev = $name[$i-1]
                $next = if ($i -lt $name.Length - 1) { $name[$i+1] } else { ' ' }
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

function Get-FieldInfo {
    param([string]$content)
    $fields = @()
    
    # Match field declarations
    $fieldLines = [regex]::Matches($content, '(?:private|protected)\s+(?:static\s+)?(?:final\s+)?(\w+(?:\[\])?(?:<[^>]+>)?)\s+(\w+)\s*;')
    
    $skipFields = @{
        "creator" = $true; "createTime" = $true; "updater" = $true
        "updateTime" = $true; "deleted" = $true; "tenantId" = $true
        "serialVersionUID" = $true
    }
    
    for ($j = 0; $j -lt $fieldLines.Count; $j++) {
        $match = $fieldLines[$j]
        $type = $match.Groups[1].Value
        $name = $match.Groups[2].Value
        
        if ($skipFields.ContainsKey($name)) { continue }
        
        # Skip generic collection types
        if ($type -match '^(List|Set|Collection|Map)') { continue }
        
        $colName = ConvertTo-SnakeCase $name
        $mySqlType = $typeMap[$type]
        
        if (-not $mySqlType) {
            # Check if it's a generic like Result<?>
            if ($type -match '<') { continue }
            $mySqlType = "varchar(255)"
        }
        
        # Check for @TableId annotation on field
        $beforeField = $content.Substring(0, $match.Index)
        $lastAt = $beforeField.LastIndexOf("@")
        $isPk = $false
        if ($lastAt -ge 0) {
            $annBlock = $beforeField.Substring($lastAt)
            if ($annBlock -match '@TableId') { $isPk = $true }
        }
        
        $fields += @{
            ColName = $colName
            Type = $mySqlType
            IsPk = $isPk
        }
    }
    
    return $fields
}

$count = 0
$tableNames = @()

Get-ChildItem -Recurse -Filter "*.java" -Path $SourceDir | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $tableName = ""
    
    if ($content -match '@TableName\("([^"]+)"\)') {
        $tableName = $matches[1]
    }
    
    if (-not $tableName) { return }
    if ($existingTables.ContainsKey($tableName)) { return }
    
    $count++
    $tableNames += $tableName
    Write-Host "[$count] Processing: $tableName"
    
    $fields = Get-FieldInfo -content $content
    
    [void]$outputLines.Add("DROP TABLE IF EXISTS `$tableName`;")
    
    $sql = "CREATE TABLE IF NOT EXISTS `$tableName` ("
    $cols = @()
    $cols += "  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID'"
    
    foreach ($f in $fields) {
        if ($f.IsPk) { continue }
        $cols += "  `$($f.ColName)` $($f.Type) DEFAULT NULL COMMENT '$($f.ColName)'"
    }
    
    $cols += "  `creator` varchar(64) DEFAULT '' COMMENT '创建者'"
    $cols += "  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'"
    $cols += "  `updater` varchar(64) DEFAULT '' COMMENT '更新者'"
    $cols += "  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'"
    $cols += "  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除'"
    $cols += "  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号'"
    
    $sql += "`n"
    $sql += ($cols -join ",`n")
    $sql += ",`n"
    $sql += "  PRIMARY KEY (`id`) USING BTREE"
    $sql += "`n"
    $sql += ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='$tableName';"
    
    [void]$outputLines.Add($sql)
    [void]$outputLines.Add("")
}

[void]$outputLines.Add("-- Total new tables generated: $count")
[void]$outputLines.Add("-- Tables: $($tableNames -join ', ')")

[System.IO.File]::WriteAllLines($OutputFile, $outputLines, [System.Text.UTF8Encoding]::new($false))
Write-Host "=== Generated $count new table DDL statements ==="
Write-Host "Output: $OutputFile"
