# include
. .\TeamNameTemplate.ps1
. .\continent.ps1
. .\PlaceAPIClass.ps1

# The PlaceAPIのログから地名を取得する

# main
$source = '.\ThePlaceAPI\result.log'
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
$teamname = $Template.replace("<name>", "$name") # 最終的にこの処理でチーム名が作られる
Write-Host "[main]teamname: $teamname"

$tmp = $Templates.addUnited($teamname)
Write-Host "[main]tmp: $tmp"
$fixedName = $Templates.FixTeamName($tmp)
Write-Host "[main]fixedName: $fixedName"

Write-Output $fixedName | Out-File $result -Encoding utf8 -Append