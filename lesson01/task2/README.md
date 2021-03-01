## Task

### Download the database
curl -s https://yandex.ru/news/quotes/graph_2000.json > ./quotes.json

Now you have historical quotes for EUR/RUB pair since late November 2014. 

Let's get the mean value for the last 14 days and decide whether to buy Euros:
```
jq -r '.prices[][]' quotes.json | grep -oP '\d+\.\d+' | tail -n 14 | awk -v mean=0 '{mean+=$1} END {print mean/14}'
```
* tell me which March the price was the least volatile since 2015? To do so you'll have to find the difference between MIN and MAX values for the period.

## Solution

1. Parse file quotes.json
2. Cut 10 symbols in every string (yandex zero)
3. Convert date in normal format
4. Formating text
5. Find March in every year
6. Search middle cource in every March
7. Search MIN and MAX
8. Remove temp files
