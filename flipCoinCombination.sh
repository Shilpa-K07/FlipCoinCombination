echo welcome to flip coin combination problem !!

i=0
declare -A dictionary

while [[ $i -lt 20 ]]
do
	randomNum=$((RANDOM%2))
	dictionary[$i]=$randomNum
	i=$(($i+1))
done

head=0
tail=0

for val in ${dictionary[@]}
do
	if [[ $val -eq 0 ]]
	then
		((head++))
	else
		((tail++))
	fi
done

echo head is $head
echo tail is $tail

head=$((100*$head/20))
tail=$((100*$tail/20))

echo percentage of head is $head
echo percentage of tail is $tail
