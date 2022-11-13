# include
. .\TeamNameTemplate.ps1
. .\continent.ps1
. .\PlaceAPIClass.ps1

# The PlaceAPIのログから地名を取得する

# main
$source = '.\extract.txt'
$result = '.\result.log'

$continent = ''
$Templates = New-Object TeamNameTemplateClass
$continents = New-Object ContinentClass
$places = New-Object PlaceAPIClass

$continent = $continents.getContinent()
Write-Host "[main]continent: $continent"
$Template = $Templates.getTemplate($continent)
Write-Host "[main]Template: $Template"

$contents = $places.getContentsFromSource($source)
$choices = $places.getChoices($contents)
$name = $places.setChoice($choices)

if($name -ne '' -or $null -ne $name){
    $teamname = $Template.replace("<name>", "$name") # 最終的にこの処理でチーム名が作られる
    Write-Host "[main]teamname: $teamname"
    
    if((Get-Random) % 2 -eq 0){
        $tmp = $Templates.addUnited($teamname)
        $teamname = $tmp
    }
    if((Get-Random) % 2 -eq 0){
        $tmp = $Templates.addSecondTeam($teamname)
        $teamname = $tmp
    }
    $fixedName = $Templates.FixTeamName($teamname)
    Write-Host "[main]fixedName: $fixedName"
    
    Write-Output $fixedName | Out-File $result -Encoding utf8 -Append
}
