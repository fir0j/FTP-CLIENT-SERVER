#!/usr/bin/env bash 
function execftp() 
{ 
	
SERVER="192.168.1.9"
USER="firoj"
PASS="  "

#server_directory
    serverdir="/home/firoj/Desktop/"

#Client_directory
    clientdir="/home/firoj/"

#login to remote server_directory
ftp -inv "${SERVER}" <<enteringlines
user "${USER}" "${PASS}"
ls
bye
# cd "${serverdir}"
# get index.html
enteringlines
}

function menu()
{

	echo -e "CLIENT-SERVER DEMONSTRATION USING FTP CONNECTION \n-------------------------------------------------"
	echo "1. Show file in the Current Directory"
	echo "2. Transfer the file to the Server"
	echo "3. Get the file from the server"
	echo "4. exit"
}

# Above functions are declared

menu
while true
do
read choice
case $choice in
    1)
	    echo -e "\n"
	    execftp
	    echo
	    menu
	    ;;
    2)
	    echo -e "\nOkay! transfering file to the server"
	    menu
	    ;;
    3)
	    echo -e "\nOkay! downloading file from the server"
	    menu
	    ;;
    4)
	    echo "[Exited]"
	    exit;;

    *)
	    clear
	    echo -e "INVALID OPTION!\n-----------------"
	    menu
    esac
done

