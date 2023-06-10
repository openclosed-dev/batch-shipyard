$version = $(python -c 'from convoy import __version__; print(__version__)')
$executableName = "batch-shipyard-${version}-cli-win-amd64.exe"

$gitHash= $(git show --format='%h' --no-patch)
$majorVersion, $minorVersion, $patchNumber = $version.split('.')
$buildNumber = 1
$versionTuple =  [string]::Format("({0}, {1}, {2}, {3})", $majorVersion, $minorVersion, $patchNumber, $buildNumber)
$branchGitSha1 = "${version}@${gitHash}"

$originalFileVerInfo = 'images\docker\windows\file_version_info.txt'
$fileVersionInfo = 'cli_version_info.txt'

(Get-Content $originalFileVerInfo) `
    -replace '{BUILDVER_DOTTED}', $version `
    -replace '{BUILDVER_TUPLE}', $versionTuple `
    -replace '{BRANCH_GITSHA1}', $branchGitSha1 `
    -replace '{EXE}', $executableName `
    | Set-Content $fileVersionInfo

$env:ARTIFACT_VERSION=$version; pyinstaller --distpath dist --clean .\shipyard-cli-windows.spec
