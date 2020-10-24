#! /bin/bash
mkfs.ext4 /dev/xvdh
mount /dev/xvdh /mnt
echo /dev/xvdh /mnt defaults,nofail 0 2 >> /etc/fstab
sudo apt-get install postgresql-client
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo chmod 600 /var/swap.1
sudo /sbin/swapon /var/swap.1
echo /var/swap.1 swap swap defaults 0 0 >> /etc/fstab
sudo apt-get update
sudo apt-get install -y docker.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /
git clone https://github.com/AdityaVishwekar/todolist-app.git 
cd todolist-app
sudo docker-compose up
