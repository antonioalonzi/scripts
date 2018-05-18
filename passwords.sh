#!/bin/bash
FILE=~/Private/passwords.txt.gpg

function usage() {
    echo "usage: passwords.sh <action>"
    echo "       <action> can be 'see' or 'edit'"
    echo ""
    echo "  e.g. passwords.sh see mySite"
    echo "  e.g. passwords.sh edit"
    exit 1
}

# Check action argument
if [ -z $1 ]
then
    echo "ERROR: First argument missing"
    echo ""
    usage
fi


if [ $1 == "see" ]
then
    # Decrypt the file
    gpg --decrypt --out /tmp/passwords.txt $FILE > /dev/null 2>&1

    # Display the file (or only the requesed passwords)
    if [ -z $2 ]
    then
        cat /tmp/passwords.txt
    else
        head -n 3 /tmp/passwords.txt
        cat /tmp/passwords.txt | grep -i $2
        tail -n 1 /tmp/passwords.txt
    fi

    # Remove the file
    rm /tmp/passwords.txt

elif [ $1 == "edit" ]
then
    echo "not yet implemented"
fi

