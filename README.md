[![Build Status](https://travis-ci.org/Azure/batch-shipyard.svg?branch=master)](https://travis-ci.org/Azure/batch-shipyard)
[![Build status](https://ci.appveyor.com/api/projects/status/3a0j0gww57o6nkpw/branch/master?svg=true)](https://ci.appveyor.com/project/alfpark/batch-shipyard)
[![Docker Pulls](https://img.shields.io/docker/pulls/alfpark/batch-shipyard.svg)](https://hub.docker.com/r/alfpark/batch-shipyard)
[![Image Layers](https://images.microbadger.com/badges/image/alfpark/batch-shipyard:latest-cli.svg)](http://microbadger.com/images/alfpark/batch-shipyard)

# Batch Shipyard
[Batch Shipyard](https://github.com/Azure/batch-shipyard) is a tool to help
provision and execute container-based batch processing and HPC workloads on
[Azure Batch](https://azure.microsoft.com/services/batch/) compute
pools. Batch Shipyard supports both [Docker](https://www.docker.com) and
[Singularity](http://singularity.lbl.gov/) containers! No experience with the
[Azure Batch SDK](https://github.com/Azure/azure-batch-samples) is needed; run
your containers with easy-to-understand configuration files. All Azure
regions are supported, including non-public Azure regions.

Additionally, Batch Shipyard provides the ability to provision and manage
entire [standalone remote file systems (storage clusters)](http://batch-shipyard.readthedocs.io/en/latest/65-batch-shipyard-remote-fs/)
in Azure, independent of any integrated Azure Batch functionality.

Batch Shipyard is now integrated directly into
[Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview)
and you can execute any Batch Shipyard workload using your web browser or
the Microsoft Azure [Android](https://play.google.com/store/apps/details?id=com.microsoft.azure&hl=en)
and [iOS](https://itunes.apple.com/us/app/microsoft-azure/id1219013620?mt=8)
app.

## Major Features
* Automated [Docker Host Engine](https://www.docker.com) and
[Singularity](http://singularity.lbl.gov/) installations tuned for
Azure Batch compute nodes
* Automated deployment of required Docker and/or Singularity images to
compute nodes
* Accelerated Docker and Singularity image deployment at scale to compute
pools consisting of a large number of VMs via private peer-to-peer
distribution of container images among the compute nodes
* Mixed mode support for Docker and Singularity: run your Docker and
Singularity containers within the same job, side-by-side or even concurrently
* Comprehensive data movement support: move data easily between locally
accessible storage systems, remote filesystems, Azure Blob or File Storage,
and compute nodes
* Support for Docker Registries including
[Azure Container Registry](https://azure.microsoft.com/services/container-registry/)
and other Internet-accessible public and private registries
* Support for the [Singularity Hub](https://singularity-hub.org/) Container
Registry
* Support for execution with
[Azure Functions](http://batch-shipyard.readthedocs.io/en/latest/60-batch-shipyard-site-extension/)
* [Standalone Remote Filesystem Provisioning](http://batch-shipyard.readthedocs.io/en/latest/65-batch-shipyard-remote-fs/)
with integration to auto-link these filesystems to compute nodes with
support for
    * [NFS](https://en.wikipedia.org/wiki/Network_File_System)
    * [GlusterFS](https://www.gluster.org/) distributed network file system
* Automatic shared data volume support
    * Remote Filesystems as provisioned by Batch Shipyard
    * [Azure File](https://azure.microsoft.com/services/storage/files/)
      via SMB
    * [Azure Blob](https://azure.microsoft.com/services/storage/blobs/)
      via [blobfuse](https://github.com/Azure/azure-storage-fuse)
    * [GlusterFS](https://www.gluster.org/) provisioned directly on compute
      nodes
    * Custom Linux mount support (fstab)
* Seamless integration with Azure Batch job, task and file concepts along with
full pass-through of the
[Azure Batch API](https://azure.microsoft.com/documentation/articles/batch-api-basics/)
to containers executed on compute nodes
* Support for [Low Priority Compute Nodes](https://docs.microsoft.com/azure/batch/batch-low-pri-vms)
* Support for [pool autoscale](http://batch-shipyard.readthedocs.io/en/latest/30-batch-shipyard-autoscale/)
and autopool to dynamically scale and control computing resources on-demand
* Support for [Task Factories and merge tasks](http://batch-shipyard.readthedocs.io/en/latest/35-batch-shipyard-task-factory-merge-task/)
with the ability to generate tasks based on parametric (parameter) sweeps,
randomized input, file enumeration, replication, and custom Python code-based
generators
* Support for deploying Batch compute nodes into a specified
[Virtual Network](http://batch-shipyard.readthedocs.io/en/latest/64-batch-shipyard-byovnet/)
* Transparent support for GPU-accelerated container applications on both
[Docker](https://github.com/NVIDIA/nvidia-docker) and Singularity
on [Azure N-Series VM instances](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-gpu)
* Support for multi-instance tasks to accommodate MPI and multi-node cluster
applications packaged in Docker or Singularity on compute pools with
automatic job completion and task termination
* Transparent assist for running Docker and Singularity containers utilizing
Infiniband/RDMA for MPI on HPC low-latency Azure VM instances:
    * [A-Series](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-hpc): STANDARD\_A8, STANDARD\_A9
    * [H-Series](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-hpc): STANDARD\_H16R, STANDARD\_H16MR
    * [N-Series](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-gpu): STANDARD\_NC24R, STANDARD\_NC24RS\_V2, STANDARD\_ND24RS
* Support for [Azure Batch task dependencies](https://azure.microsoft.com/documentation/articles/batch-task-dependencies/)
allowing complex processing pipelines and DAGs
* Support for merge or final task specification that automatically depends
on all other tasks within the job
* Support for job schedules and recurrences for automatic execution of
tasks at set intervals
* Support for live job and job schedule migration between pools
* Automatic setup of SSH or RDP users to all nodes in the compute pool and
optional creation of SSH tunneling scripts to Docker Hosts on compute nodes
* Support for credential management through
[Azure KeyVault](https://azure.microsoft.com/services/key-vault/)
* Support for [custom host images](http://batch-shipyard.readthedocs.io/en/latest/63-batch-shipyard-custom-images/)
* Support for [Windows Containers](https://docs.microsoft.com/virtualization/windowscontainers/about/)
on compliant Windows compute node pools

## Installation
### Azure Cloud Shell
Batch Shipyard is now integrated into Azure Cloud Shell with no installation
required. Simply request a Cloud Shell session and type `shipyard` to invoke
the CLI.

Try Batch Shipyard now from your browser:
[![Launch Cloud Shell](https://shell.azure.com/images/launchcloudshell.png "Launch Cloud Shell")](https://shell.azure.com)

### Local Installation
Please see [the installation guide](http://batch-shipyard.readthedocs.io/en/latest/01-batch-shipyard-installation/)
for more information regarding installation and requirements.

## Documentation and Recipes
Please refer to the
[Batch Shipyard Documentation on Read the Docs](http://batch-shipyard.readthedocs.io/).

Visit the
[Batch Shipyard Recipes](https://github.com/Azure/batch-shipyard/blob/master/recipes)
section for various sample container workloads using Azure Batch and Batch
Shipyard.

## Batch Shipyard Compute Node OS Support
Batch Shipyard is currently compatible with most Azure Batch supported
[Marketplace Linux VMs](https://docs.microsoft.com/azure/virtual-machines/linux/endorsed-distros),
[compliant Linux custom images](http://batch-shipyard.readthedocs.io/en/latest/63-batch-shipyard-custom-images/),
and native Azure Batch
[Windows Server with Containers](https://azuremarketplace.microsoft.com/marketplace/apps/Microsoft.WindowsServer?tab=Overview)
VMs. Please see the
[platform image support](http://batch-shipyard.readthedocs.io/en/latest/25-batch-shipyard-platform-image-support/)
documentation for more information.

## Change Log
Please see the
[Change Log](http://batch-shipyard.readthedocs.io/en/latest/CHANGELOG/)
for project history.

* * *
Please see this project's [Code of Conduct](CODE_OF_CONDUCT.md) and
[Contributing](CONTRIBUTING.md) guidelines.
