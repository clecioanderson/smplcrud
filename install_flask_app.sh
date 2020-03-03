#!/bin/bash
sudo yum -y install git
git clone https://github.com/clecioanderson/smplcrud.git
virtualenv smplcrud
source smplcrud/bin/activate
cd smplcrud/
pip install -r requirements.txt
flask db init
flask db migrate
flask db upgrade
sudo python app.py
