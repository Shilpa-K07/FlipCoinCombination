echo welcome to flip coin combination problem !

randomNum=$((RANDOM%2))

if [[ $randomNum -eq 0 ]]
then
	echo HEAD
else
	echo TAIL
fi

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

echo multiple time flipping and finding tripet percentage
i=0
declare -A dictionary
HHH=0
HHT=0
HTT=0
HTH=0
TTT=0
TTH=0
THH=0
THT=0
while [[ $i -lt 20 ]]
do
	randomNum=$((RANDOM%8))
	if [[ $randomNum -eq 0 ]]
	then
		dictionary[$i]=HHH
		((HHH++))
	elif [[ $randomNum -eq 1 ]]
	then
		dictionary[$i]=HHT
		((HHT++))
	elif [[ $randomNum -eq 2 ]]
	then
		dictionary[$i]=HTT
		((HTT++))
	elif [[ $randomNum -eq 3 ]]
	then
		dictionary[$i]=HTH
		((HTH++))
	elif [[ $randomNum -eq 4 ]]
        then
                dictionary[$i]=TTT
		((TTT++))
	elif [[ $randomNum -eq 5 ]]
        then
                dictionary[$i]=TTH
		((TTH++))
	elif [[ $randomNum -eq 6 ]]
        then
                dictionary[$i]=THH
		((THH++))
	elif [[ $randomNum -eq 7 ]]
        then
                dictionary[$i]=THT
		((THT++))
	fi
	i=$(($i+1))
done

echo doublet combination is ${dictionary[@]}
HHH=$((100*$HHH/20))
HHT=$((100*$HHT/20))
HTT=$((100*$HTT/20))
HTH=$((100*$HTH/20))
TTT=$((100*$TTT/20))
TTH=$((100*$TTH/20))
THH=$((100*$THH/20))
THT=$((100*$THT/20))

declare -A percentageDict

percentageDict=([HHH]=$HHH [HHT]=$HHT [HTT]=$HTT [HTH]=$HTH [TTT]=$TTT [TTH]=$TTH [THH]=$THH [THT]=$THT)
echo storing doublet percentage in dictionary
echo ${percentageDict[@]}


echo finding winning combination

i=0
H=0
T=0
while [[ $i -lt 20 ]]
do
   randomNum=$((RANDOM%2)) 
	if [[ $randomNum -eq 0 ]] 
	then 
		((H++))
	else 
		((T++))
	fi
	i=$(($i+1))
done

HH=0
HT=0
TH=0
TT=0

i=0
while [[ $i -lt 20 ]]
do
	randomNum=$((RANDOM%4))
	if [[ $randomNum -eq 0 ]]
	then
		((HH++))
	elif [[ $randomNum -eq 1 ]]
	then
		((HT++))
	elif [[ $randomNum -eq 2 ]]
	then
		((TH++))
	else
		((TT++))
	fi
	i=$(($i+1))
done

HHH=0
HHT=0
HTT=0
HTH=0
TTT=0
TTH=0
THH=0
THT=0

i=0
while [[ $i -lt 20 ]]
do
	randomNum=$((RANDOM%8))
	if [[ $randomNum -eq 0 ]]
	then
		((HHH++))
	elif [[ $randomNum -eq 1 ]]
	then
		((HHT++))
	elif [[ $randomNum -eq 2 ]]
	then
		((HTT++))
	elif [[ $randomNum -eq 3 ]]
	then
		((HTH++))
	elif [[ $randomNum -eq 4 ]]
        then
		((TTT++))
	elif [[ $randomNum -eq 5 ]]
        then
		((TTH++))
	elif [[ $randomNum -eq 6 ]]
        then
		((THH++))
	elif [[ $randomNum -eq 7 ]]
        then
		((THT++))
	fi
	i=$(($i+1))
done

declare -A sortingDictionary
sortingDictionary=([H]=$H [T]=$T [HH]=$HH [HT]=$HT [TH]=$TH [TT]=$TT [HHH]=$HHH [HHT]=$HHT [HTT]=$HTT [HTH]=$HTH [TTT]=$TTT [TTH]=$TTH [THH]=$THH [THT]=$THT) 

echo "Dictionary Insertion Order:" $H $T $HH $HT $TH $TT $HHH $HHT $HTT $HTH $TTT $TTH $THH $THT

n=${#sortingDictionary[@]}

i=0
for val in ${sortingDictionary[@]}
do
   arr[i]=$val
   i=$(($i+1))
done

n=${#arr[@]}
for((i=0;i<$n;i++))
    do
        for((j=((i+1));j<$n;j++))
        do
            if [ ${arr[i]} -gt ${arr[j]} ]
            then
                tmp=${arr[i]}
                arr[i]=${arr[j]}
                arr[j]=$tmp
            fi
        done
done

echo "dictionary:" ${sortingDictionary[@]}
echo "Array:" ${arr[@]}
maxValue=${arr[$(($n-1))]}
echo "max value " $maxValue

i=0
for key in ${!sortingDictionary[@]}
do
   if [ ${sortingDictionary[$key]} -eq $maxValue ]
    then
	combination[$i]=$key
	i=$(($i+1))
   fi
done
echo "Winning combination is "${combination[@]}
