#!/bin/bash

set -xe

source $(dirname "$0")/../tc-tests-utils.sh

source ${DS_ROOT_TASK}/DeepSpeech/tf/tc-vars.sh

BAZEL_TARGETS="
//native_client:deepspeech
//native_client:deepspeech_utils
//native_client:generate_trie
${BAZEL_CTC_TARGETS}
"

BAZEL_ENV_FLAGS="TF_NEED_CUDA=0"
SYSTEM_TARGET=rpi3

BAZEL_BUILD_FLAGS="${BAZEL_ARM_FLAGS}"

do_bazel_build

do_deepspeech_binary_build
