$solutions = @("FluorineFx-3.5-Lib.sln", "FluorineFx-4.0-Lib.sln")
$configuration = "Release"
$nuspecFile = "FluorineFx\fluorinefx.nuspec"

foreach ($solutionFile in $solutions)
{
	msbuild.exe "$solutionFile" /p:"Configuration=$configuration" /t:"Clean;Rebuild"
}

Remove-Item "..\Bin\*.nupkg"
nuget pack $nuspecFile -OutputDirectory "..\Bin" -Prop Configuration="$configuration"