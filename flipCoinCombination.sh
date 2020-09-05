echo welcome to flip coin combination problem !

if [[ $randomNum -eq 0 ]]
then
        echo HEAD
else
        echo TAIL
fi

echo multiple time flipping and finding singlet percentage
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

echo multiple time flipping and finding doublet percentage
i=0
declare -A dictionary
HH=0
HT=0
TH=0
TT=0

while [[ $i -lt 20 ]]
do
	randomNum=$((RANDOM%4))
	if [[ $randomNum -eq 0 ]]
	then
		dictionary[$i]=HH
		((HH++))
	elif [[ $randomNum -eq 1 ]]
	then
		dictionary[$i]=HT
		((HT++))
	elif [[ $randomNum -eq 2 ]]
	then
		dictionary[$i]=TH
		((TH++))
	else
		dictionary[$i]=TT
		((TT++))
	fi
	i=$(($i+1))
done

echo doublet combination is ${dictionary[@]}
HH=$((100*$HH/20))
HT=$((100*$HT/20))
TH=$((100*$TH/20))
TT=$((100*$TT/20))


declare -A percentageDict

percentageDict=([HH]=$HH [HT]=$HT [TH]=$TH [TT]=$TT)
echo storing doublet percentage in dictionary
echo ${percentageDict[@]}
