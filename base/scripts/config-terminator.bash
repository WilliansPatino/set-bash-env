#!/bin/bash

PS3='Terminator options: '
options=("Split1" "Split2" "Split3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Split1")
            config=config-1
            break
            ;;
        "Split2")
            config=config-2
            break
            ;;
        "Split3")
            config=config-3
            break
            ;;
        *)
            exit
            ;;
    esac
done

cd ~/.config/terminator
cp config config-
cp $config config
cd
terminator &

