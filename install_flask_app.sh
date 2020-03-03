#!/bin/bash
echo "Adding new public keys..."
echo "AAAAB3NzaC1yc2EAAAADAQABAAABAQDftZwLvh3prVYPxD01zBpehPA6NVlL+iDajlDR2PqzB3odo5gVrV+u6vTyw/TfFR70uOkzoLjxl6x7ZbwXpKBAXqD8ke8gIDOAL4wz8QSKtj1lcLiLOEW0ToKhlwHvlZnA0e/GATtCgt/2y4F+h+jG0VmO3Ae+8aayCOSPVHqKhXcdKt5Qa++/7SuUrTuBN6ApJNp7HmVbMGdSbrr4I1gxNDYONompBTwVvBswBy8ySA+BNaAnKUxsX5gJJCtNENcbtg44TMHufmn69XZeUajDtNGeOgeITAIWnuEiOY+3R70idXJZGSDRnZzs4sXYmP7k4PQq07sWuHqXVKUzYWI/ test" >> /home/ec2-user/.ssh/authorized_keys
sudo yum -y install git | tee -a /var/log/pynst.log
cd /home/ec2-user/  | tee -a /var/log/pynst.log
git clone https://github.com/clecioanderson/smplcrud.git  | tee -a /var/log/pynst.log
cd smplcrud/  | tee -a /var/log/pynst.log
sudo pip install -r requirements.txt  | tee -a /var/log/pynst.log
sleep 10  | tee -a /var/log/pynst.log
chown -R ec2-user. *  | tee -a /var/log/pynst.log
flask db init  | tee -a /var/log/pynst.log
flask db migrate  | tee -a /var/log/pynst.log
flask db upgrade  | tee -a /var/log/pynst.log
sudo nohup python app.py &> /dev/null &
