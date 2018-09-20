// <auto-generated>
// Copyright (c) Microsoft and contributors.  All rights reserved.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//   http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// 
// See the License for the specific language governing permissions and
// limitations under the License.
// 
// 
// Warning: This code was generated by a tool.
// 
// Changes to this file may cause incorrect behavior and will be lost if the
// code is regenerated.
// 
// For documentation on code generator please visit
//   https://aka.ms/nrp-code-generation
// Please contact wanrpdev@microsoft.com if you need to make changes to this file.
// </auto-generated>

namespace Microsoft.Azure.Commands.Network
{
    using Microsoft.Azure.Commands.Network.Models;
    using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
    using Microsoft.Azure.Commands.ResourceManager.Common.Tags;
    using Microsoft.Azure.Management.Internal.Resources.Utilities.Models;
    using Microsoft.Azure.Management.Network;
    using Microsoft.Azure.Management.Network.Models;
    using Microsoft.Rest.Azure;
    using Microsoft.WindowsAzure.Commands.Utilities.Common;
    using System.Collections.Generic;
    using System.Management.Automation;
    using CNM = Microsoft.Azure.Commands.Network.Models;

    [Cmdlet(VerbsCommon.Get, ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "NetworkProfile", DefaultParameterSetName = "NoExpand"), OutputType(typeof(PSNetworkProfile))]
    public partial class GetAzureNetworkProfile : NetworkBaseCmdlet
    {
        [Parameter(
            Mandatory = true,
            HelpMessage = "The resource group name of the network profile.",
            ParameterSetName = "GetByResourceNameExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = false,
            HelpMessage = "The resource group name of the network profile.",
            ParameterSetName = "GetByResourceNameNoExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [ResourceGroupCompleter]
        [ValidateNotNullOrEmpty]
        public string ResourceGroupName { get; set; }

        [Alias("ResourceName")]
        [Parameter(
            Mandatory = true,
            HelpMessage = "The name of the network profile.",
            ParameterSetName = "GetByResourceNameExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = false,
            HelpMessage = "The name of the network profile.",
            ParameterSetName = "GetByResourceNameNoExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty]
        public string Name { get; set; }

        [Parameter(
            Mandatory = true,
            HelpMessage = "The Azure resource manager id of the network profile.",
            ParameterSetName = "GetByResourceIdExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = true,
            HelpMessage = "The Azure resource manager id of the network profile.",
            ParameterSetName = "GetByResourceIdNoExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        public string ResourceId { get; set; }

        [Parameter(
            Mandatory = true,
            HelpMessage = "The resource reference to be expanded.",
            ParameterSetName = "GetByResourceIdExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = true,
            HelpMessage = "The resource reference to be expanded.",
            ParameterSetName = "GetByResourceIdNoExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = true,
            HelpMessage = "The resource reference to be expanded.",
            ParameterSetName = "GetByResourceNameNoExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [Parameter(
            Mandatory = true,
            HelpMessage = "The resource reference to be expanded.",
            ParameterSetName = "GetByResourceNameExpandParameterSet",
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty]
        public string ExpandResource { get; set; }

        public override void Execute()
        {
            base.Execute();

            if (this.IsParameterBound(p => p.ResourceId))
            {
                ResourceIdentifier resourceIdentifier = new ResourceIdentifier(ResourceId);
                this.ResourceGroupName = resourceIdentifier.ResourceGroupName;
                this.Name = resourceIdentifier.ResourceName;
            }

            if(!string.IsNullOrEmpty(this.Name))
            {
                var vNetworkProfile = this.NetworkClient.NetworkManagementClient.NetworkProfiles.Get(ResourceGroupName, Name, ExpandResource);
                var vNetworkProfileModel = NetworkResourceManagerProfile.Mapper.Map<CNM.PSNetworkProfile>(vNetworkProfile);
                vNetworkProfileModel.ResourceGroupName = this.ResourceGroupName;
                vNetworkProfileModel.Tag = TagsConversionHelper.CreateTagHashtable(vNetworkProfile.Tags);
                WriteObject(vNetworkProfileModel, true);
            }
            else
            {
                IPage<NetworkProfile> vNetworkProfilePage;
                if(!string.IsNullOrEmpty(this.ResourceGroupName))
                {
                    vNetworkProfilePage = this.NetworkClient.NetworkManagementClient.NetworkProfiles.List(this.ResourceGroupName);
                }
                else
                {
                    vNetworkProfilePage = this.NetworkClient.NetworkManagementClient.NetworkProfiles.ListAll();
                }

                var vNetworkProfileList = ListNextLink<NetworkProfile>.GetAllResourcesByPollingNextLink(vNetworkProfilePage,
                    this.NetworkClient.NetworkManagementClient.NetworkProfiles.ListNext);
                List<PSNetworkProfile> psNetworkProfileList = new List<PSNetworkProfile>();
                foreach (var vNetworkProfile in vNetworkProfileList)
                {
                    var vNetworkProfileModel = NetworkResourceManagerProfile.Mapper.Map<CNM.PSNetworkProfile>(vNetworkProfile);
                    vNetworkProfileModel.ResourceGroupName = NetworkBaseCmdlet.GetResourceGroup(vNetworkProfile.Id);
                    vNetworkProfileModel.Tag = TagsConversionHelper.CreateTagHashtable(vNetworkProfile.Tags);
                    psNetworkProfileList.Add(vNetworkProfileModel);
                }
                WriteObject(psNetworkProfileList, true);
            }
        }
    }
}
