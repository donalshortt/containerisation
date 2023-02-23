cd db
echo "Deploying db"
./deploy.sh
cd ..
sleep 10

cd api
echo "Deploying api"
./deploy.sh
cd ..

cd front
echo "Deploying front"
./deploy.sh
cd ..

