#!/usr/bin/env bash

if [ -z "$1" ]; then
    name="you"
else
    name="$1"
fi

printf "One for %s, one for me." "$name"