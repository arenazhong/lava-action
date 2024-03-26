#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-d169b15b-5984-454f-9b1f-f908bae1443e/"

OUTPUT_DIR="logs"

near_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"block","id":"HappyCuanAirdrop","params":{"finality":"final"}}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$near_data" >> "$OUTPUT_DIR/near.txt"
    
    echo "NEAR data fetched and saved to $OUTPUT_DIR/near.txt."
else
    echo "Failed to fetch NEAR data."
fi

RPC_TEST_URL="https://near-testnet.lava.build/lava-referer-d169b15b-5984-454f-9b1f-f908bae1443e/"

OUTPUT_DIR="logs"

near_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"block","id":"HappyCuanAirdrop","params":{"finality":"final"}}' "$RPC_TEST_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$near_data" >> "$OUTPUT_DIR/near.txt"
    
    echo "TEST NEAR data fetched and saved to $OUTPUT_DIR/near.txt."
else
    echo "Failed to fetch TEST NEAR data."
fi
