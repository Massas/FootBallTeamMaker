function doExtract($contents){
    Write-host 'doExtract:start'
    $resultArr = @()
    $cutstr = ' '
    foreach($content in $contents){
        $tmp = $content.replace($cutstr, '')
        if($tmp.indexOf($searchKey) -ne -1){
            $str = $tmp.replace('name:', '')
            $resultArr += $str
        }
    }
    Write-host 'doExtract:end'
    Write-host $resultArr.Length
    return $resultArr
}

function getContentsFromSource($file) {
    Write-host 'getContentsFromSource:start'
    $contentAll = Get-Content($file)
    $contentsTmp = $contentAll | Where-Object {$_.indexOf($searchKey)}
    Write-host $contentsTmp
    # 必要な箇所だけ抽出する
    $contents = doExtract($contentsTmp)
    Write-host 'getContentsFromSource:end'
    return $contents
}

$source = '..\ThePlaceAPI\result.log'
$result = '.\extract.txt'
$target = '..\extract.txt'
$searchKey = "name"

# main
$contents = getContentsFromSource($source)
Write-host $contents.Length

if($contents.Length -ne 0 -or $null -ne $contents){
    Write-Output $contents | Out-File $result -Encoding utf8
}

Move-Item $result $target -Force