#!/bin/sh

cd "$(dirname "$0")/../"

source /tmp/runo_venv/.venv/bin/activate

echo ">>> formatting the code with ruff"
ruff format ./runo tests

echo ">>> fixing the code with ruff"
ruff check ./runo tests --fix

echo ">>> mypy is checking the code"
mypy ./runo tests

echo ">>> set and actual version"
# Remove __version__ line and compute checksum of the file
version="$(scripts/version.sh)"
sed -i "s/^__version__ = .*/__version__ = \"$version\"/" ./runo

