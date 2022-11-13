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
        @('Europe', "Atletic Club <name>", 'Atletic Club Escaldes  (Andrra)'), # è
        @('Europe', "Inter Club <name>", 'Inter Club Escaldes (Andrra)'),
        @('Europe', "UE Santa <name>", 'Unio Esportiva Santa Coloma (Andrra)'),
        @('Europe', "BKMA <name>", 'BKMA Yerevan (Andrra)'),
        @('Europe', "CSKA-<name>", 'CSKA-Sofia (Bulgaria)'),
        @('Europe', "CSKA <name>", 'CSKA 1948 (Bulgaria)'),
        @('South America', "Racing Club <name>", 'Racing Club (Argentina)'),
        @('South America', "<name> Fútbol Club", 'Arsenal Fútbol Club (Argentina)'),
        @('South America', "Instituto AC <name>", 'Instituto AC Córdoba (Argentina)'),
        @('South America', "Club <name>", 'Club Ferro Carril Oeste (Argentina)'),
        @('South America', "Atletico de <name>", 'Atletico de Rafaela (Argentina)'), # é
        @('South America', "Independiente <name>", 'Independiente Rivadavia (Argentina)'),
        @('South America', "AA <name>", 'AA Estudiantes (Río Cuarto) (Argentina)'),
        @('South America', "Club Social y Atletico <name>", 'Club Social y Atletico Guillermo Brown (Argentina)'), # é
        @('South America', "Nueva <name>", 'Nueva Chicago (Argentina)'),
        @('South America', "Club Social y Deportivo <name>", 'Club Social y Deportivo Madryn (Argentina)'),
        @('South America', "<name> For Ever", 'Chaco For Ever (Argentina)'),
        @('Africa', "CR <name>", 'Sporting Club (Algeria)'),
        @('Africa', "USM <name>", 'Union Sportive de la Medina (Algeria)'),
        @('Africa', "JS <name>", 'Jeunesse Sportive de (Algeria)'), 
        @('Africa', "MC <name>", 'Mouloudia Club (Algeria)'),
        @('Africa', "CS <name>", 'Club Sportif (Algeria)'),
        @('Africa', "ES <name>", 'Entente Sportive (Algeria)'),
        @('Africa', "ASO <name>", 'Association Sportive Olympique de (Algeria)'),
        @('Africa', "ASO <name>", 'Association Sportive Olympique de (Algeria)'),
        @('Africa', "CA <name>", 'CA Petróleos Luanda (Angola)'),
        @('Africa', "CD <name>", 'Club Desportivo 1º de Agosto (Angola)'),
        @('Africa', "GD Interclube <name>", 'Grupo Desportivo Interclube Luanda (Angola)'),
        @('Africa', "Recreativo do <name>", 'Recreativo do Libolo (Angola)'),
        @('Africa', "Academica do <name>", 'Academica Petróleos do Lobito (Angola)'), # é
        @('Africa', "Progresso do <name>", 'Progresso do Sambizanga (Angola)'),
        @('Africa', "Sporting Clube <name>", 'Sporting Clube Petróleos de Cabinda (Angola)'),
        @('Africa', "Clube Recreativo <name>", 'Clube Recreativo da Caála (Angola)')
    )

    [string] addUnited ([String]$TeamnameStr) {
        return ${TeamnameStr} + " United"
    }

    [string] addSecondTeam ([String]$TeamnameStr) {
        return ${TeamnameStr} + " II"
    }

    [string] getTemplate ([string]$continent) {
        #Write-Host $continent
        if($null -eq $continent -or $continent -eq ''){
            $count = $this.teamnameArr.Count
            $num = Get-Random -Maximum ($count - 1) -Minimum 0
            #Write-Host "[TeamNameTemplateClass]getTemplate1: $num"
            return $this.teamnameArr[$num][1]
        }else {
            $arr = $this.teamnameArr | Where-Object {$_ -eq $continent}
            #Write-Host $arr
            $count = $arr.Count
            #Write-Host "[TeamNameTemplateClass]getTemplate2: $count"
            $num = Get-Random -Maximum ($count - 1) -Minimum 0
            #Write-Host "[TeamNameTemplateClass]getTemplate3: $num"
            return $arr[$num][1]
        }
    }

    [string] FixTeamName ([string]$teamnameOriginal) {
        $teamnameFixed = $teamnameOriginal
        if($teamnameOriginal -contains "SC United"){
            $teamnameFixed = $teamnameOriginal.replace("SC United","United SC")
        }
        if($teamnameOriginal -contains "FC United"){
            $teamnameFixed = $teamnameOriginal.replace("FC United","United SC")
        }

        return $teamnameFixed
    }
}

