#!/usr/bin/bash
export LC_COLLATE=C
shopt -s extglob 

if [ -d [Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee] ]; then
    echo "Database folder aleardy exists"
else
    mkdir database
fi
cd [Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee] 
select choice in "Create Database" "list Database" "Drop Dtabase" "Connect Database"

do
    case $choice in
    "Create Database" )
        read -p "Enter the name of database : " name
        mkdir $name

    ;;
    "list Database" )
        ls
    ;;
    "Drop Database" )
        read -p "Enter the name of database you want to drop: "
    ;;
    "Connect Database" )
        read -p "Enter the name of database : "
    ;;
    *)
        exit
    esac
done

