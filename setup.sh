FOLDER=${HOME}/.ssh
CONFIG=${FOLDER}/config
SSH_CONFIG_TEXT="MACs hmac-md5,hmac-sha1,umac-64@openssh.com,hmac-sha2-512
HostkeyAlgorithms ssh-dss,ssh-rsa,rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
ServerAliveInterval 30
StrictHostKeyChecking=accept-new
KexAlgorithms +diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
Ciphers +aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc"
DEFAULT_COLOR_FG="\033[39m"
GREEN_ON="\033[32m"
YELLOW_ON="\033[33m"
RED_ON="\033[31m"

#FOLDER=./test_folder  #DEBUG
#CONFIG=${FOLDER}/test_config  #DEBUG

clear
printf "
Hello, I will now start getting your ${CONFIG} file setup for you!\n"
sleep 5

# Check to see if the folder exists and if so echo a status message to the user
if [ -d "${FOLDER}" ]
then
    printf "[✓] ${FOLDER} exists already\n"
else
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] ${FOLDER} does not exist\n"
    sleep 3
    printf "[✓] Creating the folder ${FOLDER} now\n"
    mkdir ${FOLDER}
    FOLDER_EXIT_CODE=$?
    if [ ${FOLDER_EXIT_CODE} -ne 0 ]
    then
        printf "[${RED_ON}!!!${DEFAULT_COLOR_FG}] UhOh something has gone wrong\n"
        exit ${FOLDER_EXIT_CODE}
    else
        sleep 2
        printf "[✓] The folder ${FOLDER} has been created successfully\n"
    fi
fi

sleep 3

if [ -f "${CONFIG}" ]
then
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] The file ${CONFIG} exists already\n"
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] Please either back up the version already there or remove it\n"
    #TODO: possibly look into prompting the user if they want to backup the version already there and then write over it 
    #      or if the user would like to just append to the end of the existing file
else
    printf "[${YELLOW_ON}!${DEFAULT_COLOR_FG}] The file ${CONFIG} does not yet exist\n"
    sleep 3
    printf "[✓] Creating the file ${CONFIG} now\n"
    echo "${SSH_CONFIG_TEXT}" > ${CONFIG}
    CONFIG_EXIT_CODE=$?
    if [ ${CONFIG_EXIT_CODE} -ne 0 ]
    then
        printf "[${RED_ON}!!!${DEFAULT_COLOR_FG}] UhOh something has gone wrong\n"
        exit ${CONFIG_EXIT_CODE}
    else
        sleep 2
        printf "[✓] The file ${CONFIG} has been created successfully\n"
    fi    
fi
