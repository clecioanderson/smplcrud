#!/bin/bash
sudo yum -y install git
git clone https://github.com/clecioanderson/smplcrud.git
cd smplcrud/
sudo pip install -r requirements.txt
flask db init
flask db migrate
flask db upgrade
sudo nohup python app.py &> /dev/null &
