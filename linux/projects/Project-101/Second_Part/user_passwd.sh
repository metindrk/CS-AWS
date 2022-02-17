#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
<<<<<<< HEAD

if [[ "$UID" -ne 0]]
then 
    echo "Please run this command with sudo"
    exit
fi

# Get the username (login).
read -p "Please Enter username : " username
# Get the real name (contents for the description field).
read -p "Please Enter comment : " comment
# Get the password.
read -s -p "Please Enter Password : " password
# Create the account.
useradd -c $comment -m username
=======
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run this script with sudo or as root.'
   exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Get the password.
read -sp 'Enter the password to use for the account: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME} 2> /dev/null 

>>>>>>> b7d09822249a83a8202b3dc11681de238138c3f6
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
  echo 'This username is already exit. Please select different username '
  exit 1
fi

if [[ $? -eq 0 ]]
then
  echo "Success! User has been created"
fi
# Set the password.
<<<<<<< HEAD
echo $password | passwd --stdin $username
# Check to see if the passwd command succeeded.
if [[ $? -eq 0 ]]
then
  echo "Password Success!"
fi
# Force password change on first login.
passwd -e $username
# Display the username, password, and the host where the user was created.
echo -e "Your username: $username
Your password: $password
Hostname : $HOSTNAME"
=======
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
>>>>>>> b7d09822249a83a8202b3dc11681de238138c3f6
