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
        foo="_"
        read -p "Enter the name of database : " name
        if [[ "$name" =~ \ |\' ]];then
            name="${name/ /"$foo"}"
        fi
        
        if [[ "$name" != +([a-z_A-Z]) ]]; then
         echo "wrong format,name should be string "
        elif [[ -d $name ]]; then
              echo "Database folder aleardy exists"
        else
            mkdir ./$name
        fi
    ;;
    "list Database" )
        ls -F |grep /
    ;;
    "Drop Database" )
        read -p "Enter the name of database you want to drop: " input
         if [[ "$input" != +([a-z_A-Z]) ]]; then
         echo "wrong format,name should be string "
        elif [[ -d $input ]]; then
          rm -r ${input}
        else 
        echo "database doesn't exist"
        fi
    ;;
    "Connect Database" )
       read -p "Enter the name of database : " connect
        if [[ "$connect" != +([a-z_A-Z]) ]]; then
         echo "wrong format,name should be string "
        elif [[ -d $connect ]]; then
          cd $connect          
          select choice in "Creare Table" "List Tables" "Drop Table" "Insert in Table" "Select From Table" "Update Table"
          do
            case $choice in
                "Creare Table" )
                 read -p "Enter name of the table :" table
                        if [[ "$table" =~ \ |\' ]];then
                            table="${table/ /"$foo"}"
                        fi
                        if [[ "$table" != +([a-zA-Z]) ]]; then
                        echo "wrong format,name should be string "
                        elif [[ -f $table ]]; then
                            echo "table aleardy exists"
                        else
                            touch ./$table
                        fi
                 read -p "Enter the number of fields:" field
                ;;
                "List Tables" )
                    ls
                ;;
                "Drop Table" )
                    read -p "Enter the name of table you want to drop: " drop
                        if [[ "$drop" != +([a-zA-Z]) ]]; then
                        echo "wrong format,name should be string "
                        elif [[ -f $drop ]]; then
                        rm ${drop}
                        else 
                        echo "table doesn't exist"
                        fi
                ;;
                "Insert in Table" )
                ;;
                "Insert in Table" )
                ;;
                "Update Table" )
                ;;

            esac
          done
        else 
        echo "database doesn't exist"
        fi
    ;;
    *)
        echo "wrong choice"
    esac
done

