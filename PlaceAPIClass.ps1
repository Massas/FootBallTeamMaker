Class PlaceAPIClass {
    $searchKey = 'name :'
    $contentsNum = 10

    [string[]] getContentsFromSource($file) {
        $contentAll = Get-Content($file)
        #Write-Host $contentAll.GetType()
        $contents = $contentAll | Where-Object {$_.indexOf($searchKey)}
        #Write-Host $contents
        #Write-Host '[PlaceAPIClass]getContentFromSource: ' $contents.Length
        return $contents
    }

    [string[]] getChoices($contents) {
        $length = $contents.Length
        #Write-Host "[PlaceAPIClass]getChoices: $length"
        $tmp = $contents[($length-100)..($length-1)] # 最新の10件を取得する
        $choices = $tmp | Where-Object {$_.indexOf($searchKey)}
        Write-Host '[PlaceAPIClass]getChoices: ' $choices
        return $choices
    }

    [string] setChoice($choices) {
        for($i = 0; $i -lt $choices.Length; $i++){
            Write-Host $i ':' $choices[$i]
        }
        $num = Read-Host '<<SELECT NUMBER>>'
        Write-Host '[PlaceAPIClass]setChoice: ' $choices[$num]
        $choiced = $this.cutName($choices[$num])
        return $choiced       
    }

    [string] cutName($str) {
        $cutstr = '           name : '
        $retstr = $str.replace($cutstr, '')
        Write-Host '[PlaceAPIClass]cutName: ' $retstr
        return $retstr
    }

}