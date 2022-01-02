if [ $# -eq 0 ]
  then
    echo "Please supply an absolute path to the folder containing the shtooka flac files."
    exit
fi

if [ $(echo -n $1 | tail -c 1) == '/' ]
  then
    echo "Please DO NOT include a trailing slash in the path."
    exit
fi

mkdir "$1/renamed"
for f in $(ls $1 | grep "\.flac");
do
        TITLE=$(mediainfo "$1/$f" | grep 'Track name ' | awk -F': ' '{print $2}' | sed "s/?//")
	echo "$f\t->\t$TITLE"
        cp "$1/$f" "$1/renamed/$TITLE.flac"
done
