
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Create a new Deployment or update an exiting Deployment.
.Description
Create a new Deployment or update an exiting Deployment.
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.Api20190501Preview.IDeploymentResource
.Link
https://docs.microsoft.com/en-us/powershell/module/az.SpringCloud/new-azSpringCloudappdeployment
#>
function New-AzSpringCloudAppDeployment {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.Api20190501Preview.IDeploymentResource])]
[CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Path')]
    [System.String]
    # The name of the App resource.
    ${AppName},

    [Parameter(Mandatory)]
    [Alias('DeploymentName')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Path')]
    [System.String]
    # The name of the Deployment resource.
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Path')]
    [System.String]
    # The name of the resource group that contains the resource.
    # You can obtain this value from the Azure Resource Manager API or the portal.
    ${ResourceGroupName},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Path')]
    [System.String]
    # The name of the Service resource.
    ${ServiceName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # Gets subscription ID which uniquely identify the Microsoft Azure subscription.
    # The subscription ID forms part of the URI for every service call.
    ${SubscriptionId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.Int32]
    # Required CPU
    ${Cpu},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.Api20190501Preview.IDeploymentSettingsEnvironmentVariables]))]
    [System.Collections.Hashtable]
    # Collection of environment variables
    ${EnvironmentVariable},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.Int32]
    # Instance count
    ${InstanceCount},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.String]
    # JVM parameter
    ${JvmOption},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.Int32]
    # Required Memory size in GB
    ${MemoryInGb},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Support.RuntimeVersion])]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Support.RuntimeVersion]
    # Runtime version
    ${RuntimeVersion},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.String]
    # Selector for the artifact to be used for the deployment for multi-module projects.
    # This should bethe relative path to the target module/project.
    ${SourceArtifactSelector},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.String]
    # Relative path of the storage which stores the source
    ${SourceRelativePath} = "<default>",

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Support.UserSourceType])]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Support.UserSourceType]
    # Type of the source uploaded
    ${SourceType} = "Jar",

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Body')]
    [System.String]
    # Version of the source
    ${SourceVersion},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

    process {
        if ($PSBoundParameters.ContainsKey('Cpu')) {
            $PSBoundParameters.Add('DeploymentSettingCpu', $Cpu)
            $Null = $PSBoundParameters.Remove('Cpu')
        }
        if ($PSBoundParameters.ContainsKey('EnvironmentVariable')) {
            $PSBoundParameters.Add('DeploymentSettingEnvironmentVariable', $EnvironmentVariable)
            $Null = $PSBoundParameters.Remove('EnvironmentVariable')
        }
        if ($PSBoundParameters.ContainsKey('InstanceCount')) {
            $PSBoundParameters.Add('DeploymentSettingInstanceCount', $InstanceCount)
            $Null = $PSBoundParameters.Remove('InstanceCount')
        }
        if ($PSBoundParameters.ContainsKey('JvmOption')) {
            $PSBoundParameters.Add('DeploymentSettingJvmOption', $JvmOption)
            $Null = $PSBoundParameters.Remove('JvmOption')
        }
        if ($PSBoundParameters.ContainsKey('MemoryInGb')) {
            $PSBoundParameters.Add('DeploymentSettingMemoryInGb', $MemoryInGb)
            $Null = $PSBoundParameters.Remove('MemoryInGb')
        }
        if ($PSBoundParameters.ContainsKey('RuntimeVersion')) {
            $PSBoundParameters.Add('DeploymentSettingRuntimeVersion', $RuntimeVersion)
            $Null = $PSBoundParameters.Remove('RuntimeVersion')
        }
        if (-not $PSBoundParameters.ContainsKey('SourceRelativePath')) {
            $PSBoundParameters.Add('SourceRelativePath', $SourceRelativePath)
        }
        if (-not $PSBoundParameters.ContainsKey('SourceType')) {
            $PSBoundParameters.Add('SourceType', $SourceType)
        }
        Az.SpringCloud.internal\New-AzSpringCloudAppDeployment @PSBoundParameters
    }
}
