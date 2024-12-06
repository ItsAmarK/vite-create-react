# following line tells bash should interpret this file. Make this file execuatble by: chmod +x viteclean.sh 
#!/bin/bash

# read -prompted projectName from user
read -p "Prject name: " projectName;

# create a react project using vite@6.0.0
echo "Log: created react project";
npm create vite@6.0.0 "$projectName" -- --template react -y;

# remove boilerplate and create a clean structure
echo "Log: remove boilerplate";
cd "$projectName";
rm -rv public/ src/ index.html;
mkdir -v client/ client/assets/ client/src/ client/src/pages/ client/src/components/ client/src/styles/ server/ server/src/;
touch client/index.html client/src/main.jsx client/src/components/App.jsx client/src/styles/main.css server/index.js;

# initialize npm in client side
echo "Log: npm install in client side";
mv package.json client/;
cd client/;
npm install;
npm pkg set name=$projectName-client
cd ..;

# initialize npm in server side
echo "Log: npm init in server side";
cd server/;
npm init -y;
npm pkg set name=$projectName-server
npm pkg set type="module";
cd ..;
