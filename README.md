# General

Collection of scripts that I created and used in my life.


## passwords.sh

Allow to securely save your passwords on your computer.
Passwords will be saved under "~/Private/passwords.txt.gpg" and encrypted using gpg using a master passwords.
If you forgot your master passwords you won't be able to decrypt the file anymore.

### Prerequisite

To use this script you must install gpg.

### Initialization

    mkdir ~/Private
    cd ~/Private
    echo "----------------------------------------------------------------------------------------------" > passwords.txt
    echo "|   Site                                | Username        | Password     | Extra Info        |" >> passwords.txt
    echo "----------------------------------------------------------------------------------------------" >> passwords.txt
    echo "| www.example.com                       | MyUser          | MyPass       |                   |" >> passwords.txt
    echo "----------------------------------------------------------------------------------------------" >> passwords.txt
    gpg -c passwords.txt
    rm passwords.txt

### Usage

To see a password:

    passwords.sh see example

To edit a passwords:

    to be implemented

