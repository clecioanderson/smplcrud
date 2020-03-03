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

2. Now we change to cloned directory:
```
cd smplcrud
```

3. To authenticate in AWS you need to create some environment variable accordingly:
```
export AWS_ACCESS_KEY_ID=your_access_key_here
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

```
> The credential configured at this step need at least these two access rights: AmazonEC2FullAccess, AmazonVPCFullAccess*

4. Now you can create your Flask ec2 instances:
```
ansible-playbook -i hosts playbook.yml
```

5. Pay attention on your terminal screen, after finish, you will see on screen the public dns of your Ec2 Flas instance:
```
"public_dns_name": "ec2-54-233-150-145.sa-east-1.compute.amazonaws.com", 
"public_ip": "54.233.150.145"
```

6. In this example in order to loggin in by ssh in your instance you will run:
```
ssh -i "yourkey.pem" ec2-user@ec2-54-233-150-145.sa-east-1.compute.amazonaws.com
```

7. To access the Flask WebForm App you will need to open this link using your preferred browser:

http://ec2-54-233-150-145.sa-east-1.compute.amazonaws.com

8. In this first version we don't have error verification, delete or update commands implemented yet. We will get there!

> Enjoy!!

