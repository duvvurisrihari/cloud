
# =====================
# Jump Box Setup on AWS
# =====================


## Launch "Jump Box" AWS Linux AMI

    1. AMI:             Amazon Linux AMI 2018.03.0 (HVM)
    2. Instance Type:   t2.micro
    3. VPC:             cmpe281
    4. Network:         public subnet
    5. Auto Public IP:  yes
    6. Security Group:  jumpbox 
    7. SG Open Ports:   22
    8. Key Pair:        <your key pair>
    

## SSH into Private Instance (via Jump Box)

    ssh -i <key>.pem ec2-user@<public ip>  (access jump box)
    ssh -i <key>.pem ec2-user@<private ip> (access private node)


# =========================
# Install Tools in Jump Box
# =========================


## Install Curl & Ping in your "Jump Box" (Probably Not Needed in AWS AMI)

	sudo yum install curl
	sudo yum install iputils
	sudo yum check-update
	
## Install Redis Client in your "Jump Box"

	sudo yum install gcc
	sudo yum install wget
	wget http://download.redis.io/redis-stable.tar.gz
	tar xvzf redis-stable.tar.gz
	cd redis-stable
	make
	mkdir -p /home/ec2-user/bin
	mv src/redis-cli /home/ec2-user/bin
	
	redis-cli -h <host> -p 6379
		
## Install Riak Client in your "Jump Box"

	https://docs.basho.com/riak/kv/2.1.4/setup/installing/rhel-centos/
	
	package=riak-2.2.3-1.el7.centos.x86_64.rpm
	wget https://packagecloud.io/basho/riak/packages/el/7/riak-2.2.3-1.el7.centos.x86_64.rpm/download.rpm -O /tmp/$package
	sudo rpm -ivh /tmp/$package

	sudo riak start
	sudo riak ping
	sudo riak console
	sudo riak-admin test

## Install MySQL Client in your "Jump Box"
	
	sudo yum install mysql
	
	mysql -u <user> -p -h <db host> <db name>


## Install Mongo Client in your "Jump Box"

	https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
	https://docs.mongodb.com/v3.6/tutorial/install-mongodb-on-red-hat/

	FILE: sudo vi /etc/yum.repos.d/mongodb-org-4.0.repo

	[mongodb-org-4.0]
	name=MongoDB Repository
	baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/
	gpgcheck=1
	enabled=1
	gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc

	sudo yum install mongodb-org-shell
	
	mongo <host>:<port>/<database> -u <username> -p <password>





	
