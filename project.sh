#!/usr/bin/bash
export LC_COLLATE=C
shopt -s extglob 


if [ -d [Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee] ]; then
    echo "Database folder aleardy exists"
else
    mkdir database
fi
cd [Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee] 
select choice in "Create Database" "list Database" "Drop Database" "Connect Database"

do
    case $choice in
    "Create Database" )
     bash creatdb
    ;;
    "list Database" )
        ls -F |grep /
    ;;
    "Drop Database" )
        bash dropdb
    ;;
    "Connect Database" )
        bash connectdb
    ;;
    *)
        echo "wrong choice"
    esac
done

