#!/bin/bash

echo "Hello world from plugin \`hello\`"

load_lib "string"

echo "Len of \`hello\` is `strlen "hello"`"

load_lib "cfg"

echo "Username of github is `get_cfg "user" "github.cfg"`"
