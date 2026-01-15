#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt update 
sudo apt-get install -y postgresql-14

read -s -p "Introduce la contraseña para el usuario canvas: " DB_PASS
echo

sudo -u postgres psql -c "
CREATE USER canvas
WITH PASSWORD 'DB_PASS'
NOSUPERUSER
NOCREATEDB
NOCREATEROLE;
"
sudo -u postgres createdb canvas_production --owner=canvas