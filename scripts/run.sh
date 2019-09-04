#!/bin/bash

shopt -s extglob

# Variables

_groupID="app"
_artifID="base"

# Functions

set_newproject(){
    mvn archetype:generate -DgroupId=$_groupID -DartifactId=$_artifID -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
    
    cd $_artifID && mvn package && cd ..

    cp ${0##*/} $_artifID
}

set_compile(){
    mvn package
}

set_execute(){
    java -cp target/*.jar $_groupID.App
}

get_dirs(){
    gio tree
}

# Main's

usage_help(){
    cat <<EOF

Usage: ${0##*/} [flags] [options]
        Options:
          --new,     -n    # Create new java project
          --compile, -c    # Compile the project
          --execute, -e    # Execute the project
          --tree,    -t    # Show project files
          --help,    -h    # Show this message

EOF
}

if [[ -z $1 || $1 = @(-h|--help) ]]; then
    usage_help
    exit $(( $# ? 0 : 1 ))
fi

case "$1" in

    "--new"|"-n") set_newproject ;;
    "--compile"|"-c") set_compile ;;
    "--execute"|"-e") set_execute ;;
    "--tree"|"-t") get_dirs ;;
    *) echo "Invalid opton." && usage_help ;;

esac

exit 0
