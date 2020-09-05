echo welcome to flip coin combination problem !!

randomNum=$((RANDOM%2))

if [[ $randomNum -eq 0 ]]
then
	echo HEAD
else
	echo TAIL
fi
