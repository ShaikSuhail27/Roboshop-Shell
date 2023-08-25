#!/bin/bash

SERVER_NAMES=("MongoDB","Redis","MYSQL","RabbitMQ","Catalogue","User","Cart","Shipping","Payment"."dispatch","Web")

for i in "${SERVER_NAMES[@]}"
do
echo Name:$i
done