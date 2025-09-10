#!/bin/sh

cd "$(dirname "$0")/../"

checksum=$(grep -v '^__version__ = "' "./runo" | md5sum | awk '{print $1}' | cut -c1-8)
echo "$(date +%y.%m.%d)-$checksum"
