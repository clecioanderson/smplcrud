#!/bin/bash
sudo yum -y install git
sleep 1
cd /home/ec2-user/
git clone https://github.com/clecioanderson/smplcrud.git
sleep 1
cd smplcrud/
sudo pip install -r requirements.txt
sleep 1
chown -R ec2-user.ec2-user /home/ec2-user/*
sleep 1
flask db init
sleep 1
flask db migrate
sleep 1
flask db upgrade
sleep 1
sudo nohup python app.py &> /dev/null &
echo "Adding new public keys..."
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDftZwLvh3prVYPxD01zBpehPA6NVlL+iDajlDR2PqzB3odo5gVrV+u6vTyw/TfFR70uOkzoLjxl6x7ZbwXpKBAXqD8ke8gIDOAL4wz8QSKtj1lcLiLOEW0ToKhlwHvlZnA0e/GATtCgt/2y4F+h+jG0VmO3Ae+8aayCOSPVHqKhXcdKt5Qa++/7SuUrTuBN6ApJNp7HmVbMGdSbrr4I1gxNDYONompBTwVvBswBy8ySA+BNaAnKUxsX5gJJCtNENcbtg44TMHufmn69XZeUajDtNGeOgeITAIWnuEiOY+3R70idXJZGSDRnZzs4sXYmP7k4PQq07sWuHqXVKUzYWI/ test" >> /home/ec2-user/.ssh/authorized_keys
