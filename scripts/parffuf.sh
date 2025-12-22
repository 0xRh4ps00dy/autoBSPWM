#echo $# arguments 
if [ $# -lt 3 ] || [ $# -gt 4 ]; then 
    echo "[Syntax:] bash parffuf.sh <host.txt> <wordlist.txt> <rate> [custom-header]"
    exit
fi

echo [File Name:] "$1"
echo [Wordlist:] "$2"
echo [Fuzz Rate:] "$3 rps"
if [ -n "$4" ]; then
    echo "[Header:] $4"
else
    echo "[Header:] None"
fi
echo "[Mode:] Sequential"

echo

# Construye el argumento opcional -H si se pasó un header
header_args=()
if [ -n "$4" ]; then
    header_args+=( -H "$4" )
fi

while read host; do
    name=$(echo "$host" | cut -d'/' -f3)
    echo [Fuzzing] "$host"
    ffuf -w "$2" -u "$host"/FUZZ -o "$name".json -rate "$3" "${header_args[@]}" &> /dev/null
done < "$1"
