#!/bin/bash

####
# Very simple script to install Dazzle and create a repository
####

cat << EOF > ./parameters.sh
#This Variables must be present for any time the
# drazzle script is run
#Hard coded parameters
#Must be available to all Commands
#Please source ./parameters.sh in subscripts
export DAZZLE_USER=dazzle
export DAZZLE_GROUP=dazzle
export DAZZLE_HOME=/home/dazzle
EOF

echo "DAZZLE_USER $DAZZLE_USER"
echo "DAZZLE_GROUP $DAZZLE_GROUP"
echo "DAZZLE_HOME $DAZZLE_HOME"

if [ ! -f /usr/local/bin/dazzle ]; then
    echo "Getting Dazzle"
    curl https://raw.githubusercontent.com/jradxl/Dazzle/master/dazzle.sh --output /usr/local/bin/dazzle
fi

if [ -f "/usr/local/bin/dazzle" ] && [ ! -d "$DAZZLE_HOME" ]; then
    echo "Setting up Dazzle"
    chmod 700 /usr/local/bin/dazzle
    dazzle setup
else
    echo "$DAZZLE_HOME already exists."
    echo "Error Exit"
    exit 1
fi

echo "Now execute:  dazzle create <project-name>"
echo "Followed by:  dazzle link"
echo "and enter the ID from Sparkle's Icon Menu."

