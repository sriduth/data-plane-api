
# Data plane API

This tree hosts the configuration and APIs that drive [Envoy](https://www.envoyproxy.io/). The
APIs are also in some cases used by other proxy solutions that aim to interoperate with management
systems and configuration generators that are built against this standard. Thus, we consider these a
set of *universal data plane* APIs. See [this](https://medium.com/@mattklein123/the-universal-data-plane-api-d15cec7a)
blog post for more information on the universal data plane concept.

# Generating haskell types and datastructures

The .proto files in the protos directory have been placed such that simply running the protoc compiler
will generate the required code.

```sh
protoc --plugin=protoc-gen-haskell-protolens=<path to proto-lens-protoc>  --haskell-protolens_out=./<path to output folder> $(find protos -type f) --proto_path=./protos
```



# Repository structure

The API tree can be found at two locations:
* https://github.com/envoyproxy/envoy/tree/master/api - canonical read/write home for the APIs.
* https://github.com/envoyproxy/data-plane-api - read-only mirror of
  https://github.com/envoyproxy/envoy/tree/master/api, providing the ability to consume the data
  plane APIs without the Envoy implementation.

# Further API reading

* [API overview for developers](API_OVERVIEW.md)
* [API overview for users](https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/v2_overview#)
* [xDS protocol overview](https://www.envoyproxy.io/docs/envoy/latest/api-docs/xds_protocol)
* [Contributing guide](CONTRIBUTING.md)
