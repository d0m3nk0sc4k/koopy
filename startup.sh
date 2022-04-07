#!/bin/bash

pip3 install -r api/requirements.txt

flasgger_info=$(pip3 show flasgger)
flasgger_path=${flasgger_info#*"Location: "}
dirpath=${flasgger_path%$'\nRequires'*}

cp api/custom_page/footer.html "$dirpath/flasgger/ui3/templates/flasgger/footer.html"
cp api/custom_page/head.html "$dirpath/flasgger/ui3/templates/flasgger/head.html"

tmux new-session -d -s api /home/domen/koopy/api/api.py