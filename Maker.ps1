# include Template
. .\TeamNameTemplate.ps1
. .\continent.ps1

# The PlaceAPIのログから地名を取得する

# main
$continent = ''
$Templates = New-Object TeamNameTemplateClass
$continents = New-Object ContinentClass

$continent = $continents.getContinent()
Write-Host "[main]continent: $continent"
$Template = $Templates.getTemplate($continent)
Write-Host "[main]Template: $Template"
$teamname = $Template.replace("<name>", "$name")

$tmp = $Templates.addUnited($teamname)
Write-Host "[main]tmp: $tmp"
$fixedName = $Templates.FixTeamName($tmp)
Write-Host "[main]fixedName: $fixedName"