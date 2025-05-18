#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {

  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  #List of available services
  S_AV=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  #Display available services
  echo "$S_AV" | while read S BAR N
  do
    echo "$S) $N"
  done

  #Ask for a service
  echo -e "\nPlease select a service."
  read SERVICE_ID_SELECTED

  #If it's not in the range of services
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
  then
    MAIN_MENU "Sorry, we couldn't find that service."
  else
    #Ask for a phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    #Search customer's name in database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

    #If not in database
    if [[ -z $CUSTOMER_NAME ]]
    then
     #Ask for customer's name
     echo -e "\nWhat's your name?"
     read CUSTOMER_NAME
     
     #Insert customer
     IC=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
    fi

    #Ask for a time
    echo -e "\nWhat time would you be available?"
    read SERVICE_TIME

    #Get customer ID
    CID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

    #Insert appointment
    IA=$($PSQL "INSERT INTO appointments(customer_id,service_id, time) VALUES($CID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
    
    #Get service name
    S=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

    #Format all the variables
    S=$( echo $S | sed -E 's/^ *| *$//g')
    N=$( echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
    T=$( echo $SERVICE_TIME | sed -E 's/^ *| *$//g')

    #Display the final message
    echo -e "\nI have put you down for a $S at $T, $N."

  
  fi

}

MAIN_MENU
