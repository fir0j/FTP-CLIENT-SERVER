#!/usr/bin/env bash 

function clientTosever() 
{ 
	
SERVER="192.168.1.35"
USER="firoj"
PASS="  "
#login to remote server_directory
ftp -inv "${SERVER}" <<enteringlines
user "${USER}" "${PASS}"
cd "$currentdir"
ls
enteringlines
}

function serverToclient() 
{ 
	
SERVER="192.168.1.9"
USER="firoj"
PASS="  "

#login to remote server_directory
ftp -inv "${SERVER}" <<enteringlines
user "${USER}" "${PASS}"
cd "$currentdir"
mget *.html
bye
enteringlines
}

function menu()
{

	echo -e "\n\nCLIENT-SERVER DEMONSTRATION USING FTP CONNECTION \n-------------------------------------------------"
	echo "1. Show file in the Current Directory"
	echo "2. Transfer the file From Client to Server"
	echo "3. Download the file from Server to Client"
	echo "4. Exit"
}

currentdir="`pwd`"
menu
while true
do
read choice
case $choice in
    1)
	    echo -e "\nFiles in the current directory are:\n--------------------------------------"
	    ls
	    echo
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

