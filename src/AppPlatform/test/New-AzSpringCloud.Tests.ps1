$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'New-AzSpringCloud.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'New-AzSpringCloud' {
<<<<<<< HEAD
    It 'CreateExpanded' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
=======
    It 'CreateExpanded' {
        $spring = New-AzSpringCloud -ResourceGroupName $env.resourceGroup -Name $env.springName01 -Location $env.location
        $spring.ProvisioningState | Should -Be "Succeeded"
>>>>>>> 5bab2e7b2b... Add test case of AppPlatform.
    }
}
