yarn docker:init

yarn start:dev

if you face permission problems during build phase just delete dist folder and manually do nest build

sudo kill -9 `sudo lsof -t -i:5000`
