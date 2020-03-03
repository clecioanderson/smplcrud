# Simple Flask WebForm App

## How to use it :+1:

We need to ensure we have installed in our client environment the requirements below:
```
* git
* pip
* ansible
* awscli
```

## Requiremens SETUP
```
sudo yum -y install git
sudo easy_install pip
sudo pip install ansible
sudo pip install awscli
```

1. Now we need clone github repository:
```
git clone https://github.com/clecioanderson/smplcrud.git
```

2. Next we change to cloned directory:
```
cd smplcrud
```

3. To authenticate in AWS you need to create some environment variables accordingly:
```
export AWS_ACCESS_KEY_ID=your_access_key_here
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

```
> The credential configured at this step need at least these two access rights: AmazonEC2FullAccess, AmazonVPCFullAccess

4. We are closer!! Before we have fun running our playbook, please edit the fields below in playbook.yml file replacing by your own information:
```
---
- hosts: localhost
  connection: local
  gather_facts: yes
  vars:
  - vpc_region: sa-east-1 # (Replace AWS preferred Region - Optional)
  - my_useast1_key: cleciokeypair_26022020 # (Replace keypair name with keypair information on your EC2 Console)
```

5. Now you can create your Flask ec2 instances:
```
ansible-playbook -i hosts playbook.yml
```

6. Pay attention on your terminal screen, after finish, you will see on screen the public dns of your EC2 Flask instance:
```
"public_dns_name": "ec2-54-233-150-145.sa-east-1.compute.amazonaws.com", 
"public_ip": "54.233.150.145"
```

7. In this example in order to connect in your EC2 instance by ssh you may run:
```
ssh -i "yourkey.pem" ec2-user@ec2-54-233-150-145.sa-east-1.compute.amazonaws.com
```

8. To access the Flask WebForm App you will need to open this link using your preferred browser:

http://ec2-54-233-150-145.sa-east-1.compute.amazonaws.com

9. In this first version we don't have error verification, delete or update commands implemented yet. Be patient! We will get there!:wink:

> Enjoy!!

