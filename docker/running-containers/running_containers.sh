#!/bin/bash

# Exclude the user <USER> from the list
EXCLUDED_USER="s55ma"

# Get the list of users from /home excluding the EXCLUDED_USER
if [ -n "$EXCLUDED_USER" ]; then
    USER_LIST=$(ls /home | grep -v "$EXCLUDED_USER")
else
    USER_LIST=$(ls /home)
fi

# Red color code
RED='\033[0;31m'
# No color code
NC='\033[0m'

# Initialize counter
TOTAL_RUNNING_CONTAINERS=0

# Loop through each user and run 'docker ps' as that user, formatting the output as a table
{
    # Print the table header
    echo -e "${RED}USER, TYPE, CONTAINER_ID, NAME, STATUS${NC}"
    for USER in $USER_LIST; do
        CONTAINERS=$(su -c "docker ps --format '{{.ID}},{{.Names}},{{.Label \"com.docker.compose.project\"}},{{.Status}}'" $USER)
        while IFS= read -r LINE; do
            CONTAINER_ID=$(echo "$LINE" | cut -d',' -f1)
            CONTAINER_NAME=$(echo "$LINE" | cut -d',' -f2)
            STACK_LABEL=$(echo "$LINE" | cut -d',' -f3)
            STATUS=$(echo "$LINE" | cut -d',' -f4-)

            if [ -n "$STACK_LABEL" ]; then
                TYPE="Stack"
            else
                TYPE="Container"
            fi

            # Check if the container is running
            if [[ $STATUS == Up* ]]; then
                ((TOTAL_RUNNING_CONTAINERS++))
            fi

            echo "$USER, $TYPE, $CONTAINER_ID, $CONTAINER_NAME, $STATUS"
        done <<< "$CONTAINERS"
    done

    # Print the total count of running containers
    echo -e "\n${RED}Total Running Containers: $TOTAL_RUNNING_CONTAINERS${NC}"
} | column -t -s ,
