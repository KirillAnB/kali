#!/bin/bash +x


read -p "Enter a word: " word

first_low="${word,}"
all_low="${word,,}"
first_capital="${word^}"
all_capital="${word^^}"

echo "original word is: $word
      all low: $all_low
      first low: $first_low
      first capital $first_capital
      all capital: $all_capital"



