$srcPath = [System.IO.Path]::GetFullPath(($PSScriptRoot + '\..\..\src'))

# delete existing packages
Remove-Item $PSScriptRoot\*.nupkg

nuget pack $srcPath\MsSqlFsBlobProvider\SenseNet.MsSqlFsBlobProvider.nuspec -properties Configuration=Release -OutputDirectory $PSScriptRoot