#!/bin/bash


# Build the static files in Pixie
cd ~/Unify/src/javascript/libs/pixie-ui/pxo/pixie-ui/app
npm install
npm run build

# Copy the static files to Web_GTE
cp ~/Unify/src/javascript/libs/pixie-ui/pxo/pixie-ui/app/www/static/pixie.js ~/Unify/src/python/gateways/web_gte/pxo/web_gte/presentation/static/js/
cp ~/Unify/src/javascript/libs/pixie-ui/pxo/pixie-ui/app/www/static/pixie.css ~/Unify/src/python/gateways/web_gte/pxo/web_gte/presentation/static/css/
cp ~/Unify/src/javascript/libs/pixie-ui/pxo/pixie-ui/app/www/static/pxo-global.css ~/Unify/src/python/gateways/web_gte/pxo/web_gte/presentation/static/css/global.css

