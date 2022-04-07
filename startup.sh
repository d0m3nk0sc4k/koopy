#!/bin/bash

echo Installing pip requirements...
pip3 install -r api/requirements.txt > /dev/null
echo pip requirements satisfied

echo Getting flasgger installation location...
flasgger_info=$(pip3 show flasgger)
flasgger_path=${flasgger_info#*"Location: "}
dirpath=${flasgger_path%$'\nRequires'*}
echo Flasgger installation location found!

echo Copying custom html files to flasgger install location...
cp api/custom_page/footer.html "$dirpath/flasgger/ui3/templates/flasgger/footer.html"
cp api/custom_page/head.html "$dirpath/flasgger/ui3/templates/flasgger/head.html"
echo Custom files copied.

echo Starting api server in tmux session named "api"
tmux new-session -d -s api /home/domen/koopy/api/api.py
echo Tmux session started!