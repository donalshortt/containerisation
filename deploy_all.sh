./apply-network-policies.sh

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

echo "See tls/deploy.sh for setting up tls"
# cd tls
# echo "Setting up tls"
# ./deploy.sh
