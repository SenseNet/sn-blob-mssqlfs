# MS SQL FileStream blob provider
An external [blob provider](https://community.sensenet.com/docs/blob-provider) for the sensenet platform based on the FILESTREAM feature of MS SQL Server.

[![NuGet](https://img.shields.io/nuget/v/SenseNet.MsSqlFsBlobProvider.svg)](https://www.nuget.org/packages/SenseNet.MsSqlFsBlobProvider)

This package is intended for older sensenet projects that once switched on the FileStream feature. It is a legacy package created for backward compatibility that lets you migrate binaries from a FileStream column in MS SQL Server to either a regular binary column or to an external blob storage.

> **Should I install this package if I do not use the FileStream feature yet?**
>
> No. Please do not start using FileStream now, it is a legacy feature. We recommend using one of the available modern [blob providers](https://community.sensenet.com/docs/blob-provider).

## Usage
We assume you already have the FileStream feature installed in sensenet (if not, this package is not for you). Please install the NuGet package above, set `SqlFileStreamBlobProvider` as the blob provider and `SqlFileStreamBlobMetaDataProvider` as the metadata provider either in the web.config (see the blob provider article above for configuration) or using the new [repository builder API](build-repository.md).

> **Important**: you have to set both of the providers above to make this feature work.
