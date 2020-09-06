echo welcome to flip coin combination problem !

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
