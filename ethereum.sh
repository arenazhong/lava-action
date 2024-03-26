#!/bin/bash

RPC_URLS=(
    "https://eth1.lava.build/lava-referer-d169b15b-5984-454f-9b1f-f908bae1443e/",
    "https://eth1.lava.build/lava-referer-f0e1b816-37da-4a4c-86aa-d4082739bb3d/",
)

OUTPUT_DIR="logs"

for RPC_URL in "${RPC_URLS[@]}"; do
    eth_data=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

    if [ $? -eq 0 ]; then
        if [ ! -d "$OUTPUT_DIR" ]; then
            mkdir "$OUTPUT_DIR"
        fi
        
        echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
        
        echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
    else
        echo "Failed to fetch Ethereum data."
    fi
done