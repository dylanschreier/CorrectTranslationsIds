#!/bin/bash

correctTranslationsIds() {
    if [ $# -eq 1 ]; then
        awk '{for(x=1;x<=NF;x++)if($x~/id="[0-9]+"/){sub(/[0-9]+/,++i)}}1' $1 > $1.tmp
        rm $1
        mv $1.tmp $1
    fi
}

correctAllTranslationsFiles() {
    if [ $# -eq 1 ]; then
        TRANSLATIONS_FILENAMES=$(find $1/Resources/translations/ -regextype posix-extended -regex '^.*\.xlf')
        while read -r filename ; do
            echo "Correct translations ids for file $filename"
            correctTranslationsIds $filename
        done <<< "$TRANSLATIONS_FILENAMES"
    fi
}

if [ $# -eq 1 ]; then
    echo "----------------- $(date)"
    echo "Correct all translations ids in $1"
    correctAllTranslationsFiles $1
    echo "----------------- $(date)"
fi