#!/bin/bash
echo "Adding new public keys..."
echo "AAAAB3NzaC1yc2EAAAADAQABAAABAQDftZwLvh3prVYPxD01zBpehPA6NVlL+iDajlDR2PqzB3odo5gVrV+u6vTyw/TfFR70uOkzoLjxl6x7ZbwXpKBAXqD8ke8gIDOAL4wz8QSKtj1lcLiLOEW0ToKhlwHvlZnA0e/GATtCgt/2y4F+h+jG0VmO3Ae+8aayCOSPVHqKhXcdKt5Qa++/7SuUrTuBN6ApJNp7HmVbMGdSbrr4I1gxNDYONompBTwVvBswBy8ySA+BNaAnKUxsX5gJJCtNENcbtg44TMHufmn69XZeUajDtNGeOgeITAIWnuEiOY+3R70idXJZGSDRnZzs4sXYmP7k4PQq07sWuHqXVKUzYWI/ test" >> /home/ec2-user/.ssh/authorized_keys
sudo yum -y install git
cd /home/ec2-user/
git clone https://github.com/clecioanderson/smplcrud.git
cd smplcrud/
sudo pip install -r requirements.txt
sleep 10
chown -R ec2-user. *
flask db init
flask db migrate
flask db upgrade
sudo nohup python app.py &> /dev/null &
