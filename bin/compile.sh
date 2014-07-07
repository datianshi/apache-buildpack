#!/usr/bin/env bash
# bin/compile <build-dir> <cache-dir>

# ------------------------------------------------------------------------------------------------
# Copyright 2013 Jordon Bedwell.
# Apache License.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
# except  in compliance with the License. You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and  limitations under the License.
# ------------------------------------------------------------------------------------------------

shopt -s dotglob
set -e

# ------------------------------------------------------------------------------------------------

compile_build_dir=$1
compile_cache_dir=$2
compile_buildpack_dir=$(cd $(dirname $0) && cd .. && pwd)
compile_buildpack_bin=$compile_buildpack_dir/bin

#echo "pwd: $(pwd)"
#echo "compile_build_dir: $compile_build_dir"
#echo "compile_cache_dir: $compile_cache_dir"
#echo "compile_buildpack_bin: $compile_buildpack_bin"
#echo "compile_buildpack_dir: $compile_buildpack_dir"

# ------------------------------------------------------------------------------------------------

httpd_tgz="$compile_buildpack_dir/binary/httpd-2.4.9.tar.gz"

# ------------------------------------------------------------------------------------------------

cd $compile_build_dir

# ------------------------------------------------------------------------------------------------

echo "-----> Doing work with compiling."
#mkdir -p $compile_cache_dir/public
#mv * $compile_cache_dir/public
#mv $compile_cache_dir/public .
#[[ -f public/Procfile ]] && mv public/Procfile .
tar -xzf $httpd_tgz

#cp -f $compile_buildpack_dir/conf/nginx.conf nginx/conf/nginx.conf
#cp -f $compile_buildpack_dir/conf/mime.types nginx/conf/mime.types

#[[ -f public/nginx.conf ]] && mv public/nginx.conf nginx/conf/nginx.conf
#[[ -f public/mime.types ]] && mv public/mime.types nginx/conf/mime.types

cp $compile_buildpack_bin/boot.sh .
# ------------------------------------------------------------------------------------------------
