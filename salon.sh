#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome, how can I help you today?\n"
  
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-6]$ ]]
  then
    MAIN_MENU "Please, select a valid service."
  else
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    SERVICE_FORMATTED=$(echo $SERVICE | sed -E 's/^ *| *$//g')
    
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
      NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

    echo -e "\nWhat time would you like your $SERVICE_FORMATTED, $NAME_FORMATTED?"
    read SERVICE_TIME

    TIME_FORMATTED=$(echo $SERVICE_TIME | sed -E 's/^ *| *$//g')
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    echo -e "\nI have put you down for a $SERVICE_FORMATTED at $TIME_FORMATTED, $NAME_FORMATTED."

  fi

}

MAIN_MENU
