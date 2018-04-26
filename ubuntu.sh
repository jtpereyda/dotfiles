#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

$DIR/ubuntu-base.sh

$DIR/makesymlinks.sh
