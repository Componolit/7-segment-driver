#!/bin/sh

set -e

git clone https://github.com/AdaCore/templates-parser.git /tmp/templates-parser
git clone https://github.com/AdaCore/startup-gen.git /tmp/startup-gen
cd /tmp/templates-parser
make
cd /tmp/startup-gen
export GPR_PROJECT_PATH=/tmp/templates-parser/
gprbuild -P startup_gen.gpr
export PATH=$PATH:/tmp/startup-gen
cd /7-Segment-Driver
git submodule update --init --recursive
make
gprbuild -P /7-Segment-Driver/Segment_Driver.gpr
gnatprove -P /7-Segment-Driver/Segment_Driver.gpr --prover=altergo,cvc4,z3 --checks-as-errors --steps=5000
