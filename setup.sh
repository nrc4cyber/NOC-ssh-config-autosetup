FOLDER=${HOME}/.ssh
CONFIG=${FOLDER}/config
DEFAULT_COLOR_FG="\033[39m"
GREEN_ON="\033[32m"
YELLOW_ON="\033[33m"
RED_ON="\033[31m"

FOLDER=./test_folder  #DEBUG
CONFIG=${FOLDER}/test_config  #DEBUG

clear
printf "
Hello, I will now start getting your ${CONFIG} file setup for you!\n"
sleep 5

# Check to see if the folder exists and if so echo a status message to the user
if [ -d "${FOLDER}" ]
then
    printf "[${GREEN_ON}i${DEFAULT_COLOR_FG}] ${FOLDER} exists already\n"
else
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] ${FOLDER} does not exist\n"
    sleep 3
    printf "[${GREEN_ON}i${DEFAULT_COLOR_FG}] Creating the folder ${FOLDER} now\n"
    mkdir ${FOLDER}
    FOLDER_EXIT_CODE=$?
    if [ ${FOLDER_EXIT_CODE} -ne 0 ]
    then
        printf "[${RED_ON}!${DEFAULT_COLOR_FG}] UhOh something has gone wrong\n"
        exit ${FOLDER_EXIT_CODE}
    elif [ ${FOLDER_EXIT_CODE} -eq 0 ]
    then
        sleep 2
        printf "[${GREEN_ON}i${DEFAULT_COLOR_FG}] ${FOLDER} created successfully\n"
    fi
fi

sleep 3

if [ -f "${CONFIG}" ]
then
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] ${CONFIG} exists already\n"
else
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] The file ${CONFIG} does not yet exist\n"
    sleep 3
    printf "[${GREEN_ON}i${DEFAULT_COLOR_FG}] Creating the file ${CONFIG} now\n"
fi
    # prompt user if they would like to append to the existing $CONFIG
    # or if they would like to backup the existing $CONFIG
    # or if they would like to just overwrite the existing $CONFIG