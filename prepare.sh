#!/bin/bash

#######################################################
# INITIAL REQUIREMENTS:
#
#   Clone the following repos into the folder first,
#   as types from those repos are also used.
#
# 
# git clone https://github.com/googleapis/googleapis.git
# git clone https://github.com/census-instrumentation/opencensus-proto.git
# git clone https://github.com/prometheus/client_model
#
# git clone https://github.com/protocolbuffers/protobuf.git
#
# Now copy the contents:
# 
# cp client_model/metrics.proto protos/
# cp -r opencensus-proto/src/opencensus proto
# cp -r googleapis/google protos
# cp -r protobuf/src/google/protobuf protos/google
#
# We can omit the 'compiler' types in the protobuf main
# package:
#
# rm -rf protos/google/protobuf/compiler
#
# One can also omit the *unittest* fields inside the same
# as well as the utils subdirectory.


# Remove any unrequired files and unsupported contents
# inside a proto file.

# Remove any file that is not a protobuf spec
find protos -type f | grep -v "\.proto" | xargs -I{} rm {}

# For the latest envoy API types, we have to remove the
# envoy prefix from the path because of the updated folder structure.
find protos -type f | xargs -I{} sed -i 's/import \"envoy\//import "/g' {}

# Remove the option ruby_package as the protoc generator for haskell
# does not support this explicitly.
find protos -type f | xargs -I{} sed -i '/option ruby_package/d' {}

