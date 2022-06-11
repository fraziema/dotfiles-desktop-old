clock() {
	clear; 
	while true;do 
		now=$( date +"%r" ) ; 
		echo -en "\r   $now " ;
		sleep 1;
	done 
}

randb64(){  
    </dev/urandom base64 | head -c $1 
}

b36(){
        b36arr=(0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
        for     i in $(echo "obase=36; $1"| bc)
        do      echo -n ${b36arr[${i#0}]}
        done
        echo
}

hashmove() { 
	NAME="$(md5sum $1 | cut -d' ' -f1)"
	if [ "$2" = "-c" ]; then
		NAME=$NAME-$1
	fi
	EXT="${1##*.}"
	if [ -f $NAME.$EXT ]; then 
		NAME=$NAME-$(sha256sum "$1"|cut -d' ' -f1)
	fi
	if [ ! -f $NAME.$EXT ]; then 
		mv $1 $NAME.$EXT;
	else 
		echo "$NAME.$EXT conflicts with existing file; cannot rename";
	fi
}


timer() { time read -n 1; }

cdl() { 
	cd "$1"
 	ls 
}

mcd()
{
    mkdir -p "${1}" && \
    cd "${1}"
}

function countdown 
{
        local OLD_IFS="${IFS}"
        IFS=":"
        local ARR=( $1 )
        local SECONDS=$((  (ARR[0] * 60 * 60) + (ARR[1] * 60) + ARR[2]  ))
        local START=$(date +%s)
        local END=$((START + SECONDS))
        local CUR=$START

        while [[ $CUR -lt $END ]]
        do
                CUR=$(date +%s)
                LEFT=$((END-CUR))

                printf "\r%02d:%02d:%02d" \
                        $((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

                sleep 1
        done
        IFS="${OLD_IFS}"
        echo "        "
}

list() { 
	ls -thor $1
}

dkill() { 
	echo "killall $2" | at "$1" 
}

