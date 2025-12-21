#echo $# arguments 
if [ $# -ne 3 ]; 
    then echo "[Syntax:] bash parffuf.sh <host.txt> <wordlist.txt> <rate>"
    exit
fi

echo [File Name:] $1
echo [Wordlist:] $2
echo [Fuzz Rate:] $3 rps
echo "[Mode:] Sequential"

echo

while read host; do
	name=$(echo $host | cut -d'/' -f3)
	echo [Fuzzing] $host
	ffuf -w $2 -u $host/FUZZ -o $name.json -rate $3 &> /dev/null
done < $1
