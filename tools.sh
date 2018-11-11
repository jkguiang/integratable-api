docker ps > temp.txt
if [[ "${1}" == "open" ]] ; then
    python debug.py open
elif [[ "${1}" == "logs" ]] ; then
    python debug.py logs
else
    echo "Command ${1} not supported."
fi
rm temp.txt
