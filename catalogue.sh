script_location=$(pwd)
set -e


yum module disable nodejs -y
yum module enable nodejs:18 -y


yum install nodejs -y
#useradd roboshop

mkdir -p /app 


curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
rm -rf /app*
cd /app 
unzip /tmp/catalogue.zip

cd /app 
npm install 

cp ${script_location}/files/catalogue.service /etc/systemd/system/catalogue.service

systemctl daemon-reload

systemctl enable catalogue 
systemctl start catalogue