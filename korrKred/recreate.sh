#!/bin/bash

rake db:drop
echo "Database dropped..."
rake db:create
echo "New database created..."
rake db:migrate
echo "Migrate completed..."
rake db:seed
echo "Populating done..."
