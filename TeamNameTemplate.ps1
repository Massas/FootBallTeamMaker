class TeamNameTemplateClass {
    # チーム名のテンプレート
    $teamnameArr = @(
        # categoly, name, Full name
        @('common', "<name> FC", 'Football Club'),
        @('common', "FC <name>", 'Football Club'),
        @('common', "<name> SC", 'Soccer Club'),
        @('common', "SC <name>", 'Soccer Club'),
        @('common', "<name> AS", 'Athletic Club (Algeria)'), 
        @('common', "AS <name>", 'Athletic Club (Algeria)'), 
        @('Europe', "KF <name>", 'Klubi Futbollistik (Albania)'),
        @('Europe', "FK <name>", 'Fotball Klubb (Sweden)'),
        @('Europe', "KS <name>", 'Klubi Sportiv (Albania)'),
        @('Africa', "CR <name>", 'Sporting Club (Algeria)'),
        @('Africa', "USM <name>", 'Union Sportive de la Medina (Algeria)'),
        @('Africa', "JS <name>", 'Jeunesse Sportive de (Algeria)'), 
        @('Africa', "MC <name>", 'Mouloudia Club (Algeria)'),
        @('Africa', "CS <name>", 'Club Sportif (Algeria)'),
        @('Africa', "ES <name>", 'Entente Sportive (Algeria)'),
        @('Africa', "ASO <name>", 'Association Sportive Olympique de (Algeria)'),
        @('Africa', "ASO <name>", 'Association Sportive Olympique de (Algeria)')
    )

    [string] addUnited ([String]$TeamnameStr) {
        return ${TeamnameStr} + " United"
    }

    [string] getTemplate ([string]$continent) {
        Write-Host $continent
        if($null -eq $continent -or $continent -eq ''){
            $count = $this.teamnameArr.Count
            $num = Get-Random -Maximum ($count - 1) -Minimum 0
            Write-Host "[TeamNameTemplateClass]getTemplate1: $num"
            return $this.teamnameArr[$num][1]
        }else {
            $arr = $this.teamnameArr | Where-Object {$_ -eq $continent}
            Write-Host $arr
            $count = $arr.Count
            Write-Host "[TeamNameTemplateClass]getTemplate2: $count"
            $num = Get-Random -Maximum ($count - 1) -Minimum 0
            Write-Host "[TeamNameTemplateClass]getTemplate3: $num"
            return $arr[$num][1]
        }
    }

    [string] FixTeamName ([string]$teamnameOriginal) {
        $teamnameFixed = $teamnameOriginal
        if($teamnameOriginal -contains "SC  United"){
            $teamnameFixed = $teamnameOriginal.replace("SC  United","United SC")
        }
        return $teamnameFixed
    }
}

