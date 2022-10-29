class ContinentClass {
    $continents = @('common', 'Europe', 'Africa','')

    [string] getContinent () {
        $count = $this.continents.Count
		$num = Get-Random -Maximum ($count -1) -Minimum 0
        #Write-Host "[ContinentClass]getContinent: $num"
        Write-Host $this.continents[$num]
        return $this.continents[$num]
    }
}