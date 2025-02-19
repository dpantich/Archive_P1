#!/bin/bash

# Function to convert decimal to binary
decimal_to_binary() {
    local num=$1
    local binary=""
    
    while [ "$num" -gt 0 ]; do
        binary=$((num % 2))$binary
        num=$((num / 2))
    done
    
    echo "$binary"
}

# Function to convert decimal to hexadecimal
decimal_to_hex() {
    local num=$1
    local hex=""
    local hex_map="0123456789ABCDEF"
    
    while [ "$num" -gt 0 ]; do
        remainder=$((num % 16))
        hex="${hex_map:$remainder:1}$hex"
        num=$((num / 16))
    done
    
    echo "$hex"
}

# Main script starts here
echo "Enter a decimal number (must be less than 100000):"
read decimal

# Validate input
if ! [[ "$decimal" =~ ^[0-9]+$ ]]; then
    echo "Error: Input must be a valid decimal number."
    exit 1
elif [ "$decimal" -ge 100000 ]; then
    echo "Error: Number must be less than 100000."
    exit 1
fi

# Convert and display results
binary=$(decimal_to_binary "$decimal")
hexadecimal=$(decimal_to_hex "$decimal")

echo "Decimal: $decimal"
echo "Binary: $binary"
echo "Hexadecimal: $hexadecimal"

# Save output to a file
echo -e "Decimal: $decimal\nBinary: $binary\nHexadecimal: $hexadecimal" > conversion_result.txt

echo "Results saved to conversion_result.txt"
