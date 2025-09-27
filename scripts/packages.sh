#!/bin/bash

# This file defines package categories and their respective packages
# It is sourced by install-packages.sh

# Define package categories and their packages as associative arrays
# Each package entry is a string with format: "name;macos_package;ubuntu_package;global_npm;optional"
# "null" is used for missing values. "true" for boolean flags.

declare -A development_packages
development_packages["git"]="git;git;git;null;false"
development_packages["curl"]="curl;curl;curl;null;false"
development_packages["wget"]="wget;wget;wget;null;false"
development_packages["jq"]="jq;jq;jq;null;false"
development_packages["tree"]="tree;tree;tree;null;false"
development_packages["htop"]="htop;htop;htop;null;false"

declare -A typescript_packages
typescript_packages["node"]="node;node;nodejs;null;false" # Note: npm is handled separately for node
typescript_packages["typescript"]="typescript;null;null;typescript;false"
typescript_packages["ts-node"]="ts-node;null;null;ts-node;false"
typescript_packages["nodemon"]="nodemon;null;null;nodemon;false"

declare -A modern_cli_packages
modern_cli_packages["ripgrep"]="ripgrep;ripgrep;ripgrep;null;false"
modern_cli_packages["fd"]="fd;fd;fd-find;null;false"
modern_cli_packages["bat"]="bat;bat;bat;null;false"
modern_cli_packages["exa"]="exa;exa;exa;null;false"
modern_cli_packages["fzf"]="fzf;fzf;fzf;null;false"
modern_cli_packages["zoxide"]="zoxide;zoxide;zoxide;null;false"
modern_cli_packages["starship"]="starship;starship;starship;null;false"
modern_cli_packages["direnv"]="direnv;direnv;direnv;null;false"
modern_cli_packages["tldr"]="tldr;tldr;tldr;null;false"

declare -A docker_packages
docker_packages["docker"]="docker;docker;docker.io;null;false"
docker_packages["docker-compose"]="docker-compose;docker-compose;docker-compose;null;false"

declare -A productivity_packages
productivity_packages["tmux"]="tmux;tmux;tmux;null;false"
productivity_packages["nano"]="nano;nano;nano;null;false"
productivity_packages["micro"]="micro;micro;micro;null;false"

declare -A developer_tools_packages
developer_tools_packages["git-extras"]="git-extras;git-extras;git-extras;null;false"
developer_tools_packages["gh"]="gh;gh;gh;null;false"
developer_tools_packages["just"]="just;just;just;null;false"
developer_tools_packages["navi"]="navi;navi;navi;null;false"
developer_tools_packages["hyperfine"]="hyperfine;hyperfine;hyperfine;null;false"

declare -A optional_packages
optional_packages["lazygit"]="lazygit;lazygit;lazygit;null;true"
optional_packages["httpie"]="httpie;httpie;httpie;null;true"
optional_packages["glances"]="glances;glances;glances;null;true"
optional_packages["bandwhich"]="bandwhich;bandwhich;bandwhich;null;true"

# Map category names to their associative array names
declare -A CATEGORY_MAP
CATEGORY_MAP["development"]="development_packages"
CATEGORY_MAP["typescript"]="typescript_packages"
CATEGORY_MAP["modern_cli"]="modern_cli_packages"
CATEGORY_MAP["docker"]="docker_packages"
CATEGORY_MAP["productivity"]="productivity_packages"
CATEGORY_MAP["developer_tools"]="developer_tools_packages"
CATEGORY_MAP["optional"]="optional_packages"
