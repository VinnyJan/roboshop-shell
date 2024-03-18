script_location=$(pwd)

cp ${scrpt_location}/files/mongodb.rep /etc/yum.repos.d/mongo.repo

yum install mongodb-org -y 

systemctl enable mongodb
systemctl start mongodb

systemctl restart mongod