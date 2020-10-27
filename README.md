# MS SQL FileStream blob provider
An external [blob provider](https://github.com/SenseNet/sensenet.github.io/blob/master/_docs/blob-provider.md) for the sensenet platform based on the FILESTREAM feature of MS SQL Server.

[![NuGet](https://img.shields.io/nuget/v/SenseNet.MsSqlFsBlobProvider.svg)](https://www.nuget.org/packages/SenseNet.MsSqlFsBlobProvider)

This package is intended for older sensenet projects that once switched on the FileStream feature. It is a legacy package created for backward compatibility that lets you migrate binaries from a FileStream column in MS SQL Server to either a regular binary column or to an external blob storage.

> **Should I install this package if I do not use the FileStream feature yet?**
>
> No. Please do not start using FileStream now, it is a legacy feature. We recommend using one of the available modern [blob providers](https://github.com/SenseNet/sensenet.github.io/blob/master/_docs/blob-provider.md).

## Usage
We assume you already have the FileStream feature installed in sensenet and there are binaries stored in the FileStream column (if not, this package is not for you). Please install the NuGet package above to be able to access the new blob provider for FileStream.

### Migration mode
The recommended approach is to install this provider along with a new external provider (e.g. [MongoDb](https://github.com/SenseNet/sensenet.github.io/blob/master/_docs/mongodb-provider.md)). This way you will be able to migrate your binaries stored in the FileStream column to a more modern blob provider.

1. Set `SqlFileStreamBlobMetaDataProvider` as the *blob metadata provider* either in the web.config (see the blob provider article above for configuration) or using the new repository builder API. This is necessary for the system to recognize FileStream column information.
2. Set the new external blob provider of your choice that you want to use from now on.

> If you do not set an external provider, the system will save files back to the SQL database - which is an absolutely acceptable option.

At this point you will have to write a simple tool that iterates through all the files that are stored in the FileStream column and save their binaries through the GetStream/SetStream API of the binary data class.

After migrating all the binaries from the FileStream column to a new blob provider you may freely **remove this package** and the blob metadata provider configuration from your application.

### Legacy mode
In case you still want to *save* your binaries into the FileStream column in SQL Server, you have to configure this new provider as the external provider.

> Please note that there can be only one external provider in the system **for writing**. For reading there can be any number of them, they just have to be present in the app domain as libraries.

1. Set `SqlFileStreamBlobMetaDataProvider` as the *blob metadata provider* either in the web.config (see the blob provider article above for configuration) or using the new repository builder API. This is necessary for the system to recognize FileStream column information.
2. Set `SqlFileStreamBlobProvider` as the blob provider.

Sample configuration fragment:

```xml
<blobstorage>
      <add key="MetadataProvider" value="SenseNet.MsSqlFsBlobProvider.SqlFileStreamBlobMetaDataProvider" />
      <add key="BlobProvider" value="SenseNet.MsSqlFsBlobProvider.SqlFileStreamBlobProvider" />
</blobstorage>
```

> Please note that the blobstorage section may contain additional values, for example blob chunk sizes.

# sensenet as a service (SNaaS) - use sensenet from the cloud

For a monthly subscription fee, we store all your content and data, relieving you of all maintenance-related tasks and installation, ensuring easy onboarding, easy updates, and patches.

https://www.sensenet.com/pricing
