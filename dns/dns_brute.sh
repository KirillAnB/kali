#!/bin/bash

# Prompt for the domain name
read -p "Enter domain name: " domain_name

# Function to check a domain
function check_domain() {
    local domain=$1
    result=$(host "$domain" 2>&1) # Capture both output and errors
    echo "$result"
}

# Function to brute-force subdomains
function sub() {
    # Ensure sub.txt exists
    if [[ ! -f sub.txt ]]; then
        echo "Error: sub.txt file not found."
        exit 1
    fi

    # Process each subdomain
    while IFS= read -r sub; do
        to_check="$sub.$domain_name"
        echo "Checking $to_check..."
        echo "### $to_check ###" >> dns_results.txt
        check_domain "$to_check" >> dns_results.txt
    done < sub.txt
}

# Run the sub function and save results
> dns_results.txt # Clear previous results
sub

# Generate the HTML file
cat << _EOF_ > dns_results.html
<!DOCTYPE html>
<html>
    <head>
        <title>DNS Brute-Force Results</title>
    </head>
    <body>
        <h1>DNS Brute-Force Results for $domain_name</h1>
        <pre>
$(cat dns_results.txt)
        </pre>
    </body>
</html>
_EOF_

# Open the results in Firefox
firefox dns_results.html
