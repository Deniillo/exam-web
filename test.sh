#!/bin/bash

for i in {1..20}; do
    echo "Request $i"
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/api/test)

    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "Ладно ладно проходи. Status code: $STATUS_CODE"
    elif [ "$STATUS_CODE" -eq 429 ]; then
        echo "Прекрати дудосить! Status code: $STATUS_CODE"
    else
        echo "Получен неожиданный код: $STATUS_CODE"
    fi
done