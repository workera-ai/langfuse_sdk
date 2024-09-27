# LangfuseSdk

Langfuse SDK with generated API using [open-api-generator](https://github.com/aj-foster/open-api-generator).
You can read the API documentation over here: https://api.reference.langfuse.com/.

## Settings

Go to Langfuse API Keys inside organization settings and then export the following variables to your shell profile:

```
export LANGFUSE_SECRET_KEY="your secret key..."
export LANGFUSE_PUBLIC_KEY="your public key..."
```

## Synching

> Running this command is only recommended to update the generate code because it may introduce incompatibilities in the current API implementation.

Run `mix sdk.build` to regenerete the API. This command will download the latest version of the OpenAPI YAML specification and generate the correspondent code to match the API spec.
