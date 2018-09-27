#!/usr/bin/env bash

function clientTosever() 
{ 
	
SERVER="192.168.1.2"
USER="firoj"
PASS="  "
#login and chaning to remote server_directory
ftp -pinv "${SERVER}" <<enteringlines
user "${USER}" "${PASS}"
cd Desktop #directory for files to be uploaded
mput *.html
enteringlines
}

function serverToclient() 
{ 
	
SERVER="192.168.1.2"
USER="firoj"
PASS="  "

#login and changing to our CWD
ftp -pinv "${SERVER}" <<enteringlines
user "${USER}" "${PASS}"
cd Desktop #directory from where to download files
lcd "$currentdir" #directory to keep downloaded files
mget *.html
bye
enteringlines
}

function menu()
{

	echo -e "\nCLIENT-SERVER DEMONSTRATION USING FTP CONNECTION \n-------------------------------------------------"
	echo "1. Show files in the Current Working Directory (CWD)"
	echo "2. Transfer All CWD files to Server"
	echo "3. Download All files from Server to CWD"
	echo "4. Exit"
}

currentdir="`pwd`"
menu
while true
do
read choice
case $choice in
    1)
	    echo -e "\nFiles in the current directory are:\n-----------------------------------------------------------------------------"
	    ls
	    echo -e "-----------------------------------------------------------------------------"
	    menu
	    ;;
    2)
	    echo -e "\n"
	    clientTosever
	    menu
	    ;;
    3)
	    echo -e "\n"
	    serverToclient
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

