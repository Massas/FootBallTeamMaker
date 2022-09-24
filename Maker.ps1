# include Template
. .\TeamNameTemplate.ps1

$continent = ''
$Templates = New-Object TeamNameTemplate
$Template = $Templates.getTemplate($continent)

$name = 'Milano'
$teamname = $Template.replace("<name>", "$name")

$tmp = $Templates.addUnited($teamname)

$tmp