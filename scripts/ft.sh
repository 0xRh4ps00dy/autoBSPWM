set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: $0 <ip> <command>"
    exit 1
fi

ip="$1"
shift
command=( "$@"  )

echo "[*] Querying offset from: $ip"

# Get offset in seconds
offset_float=$(ntpdate -q "$ip" 2>/dev/null | grep -oP 'offset \+\K[0-9.]+')
if [ -z "$offset_float" ]; then
    echo "[!] Failed to extract valid offset from ntpdate."
    exit 1
fi

# Compose faketime format: +<offset>s
faketime_fmt="+${offset_float}s"

echo "[*] faketime -f format: $faketime_fmt"
echo "[*] Running: ${command[@]}"

faketime -f "$faketime_fmt" "${command[@]}"
