#!/bin/bash +x


read -p "Enter value a and value b:" value_a 

echo "${value_a:-42}"
