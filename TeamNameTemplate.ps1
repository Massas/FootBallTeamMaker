class TeamNameTemplate {
    # チーム名のテンプレート
    $teamnameArr = @(
        # categoly, name, Full name
        @('common', "<name> FC", 'Football Club'),
        @('common', "<name> SC", 'Soccer Club'),
        @('common', "<name> AS", 'Athletic Club (Algeria)'), 
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
        $count = $this.teamnameArr.Count
		$num = Get-Random -Maximum $count -Minimum 0
        return $this.teamnameArr[$num][1]
    }
}

