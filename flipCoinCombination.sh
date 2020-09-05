echo welcome to flip coin combination problem !

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
