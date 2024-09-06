#!/bin/bash
#set -x


#CURRENT_VERSION=$(readlink "$WEBSITE_DIR/current")
index_path="/var/www/html"
folder_path="/var/www/html/*"
line=$(ls -l $folder_path | grep ^l)
CURRENT_VERSION=$(basename "$line")

WEBSITE_DIR="/var/www/website"

Current_Website=$index_path/index.html

case "$CURRENT_VERSION" in
    site1)
	#sudo rm -rf $CURRENT_VERSION    
    sudo ln -s "$WEBSITE_DIR/site2" "$index_path"
	sudo cat $WEBSITE_DIR/site2/index.html > $Current_Website
	sudo rm -rf $index_path/site1
        ;;
    site2)
	#sudo rm -rf $CURRENT_VERSION
        sudo ln -s "$WEBSITE_DIR/site3" "$index_path"
	sudo cat $WEBSITE_DIR/site3/index.html > $Current_Website
        sudo rm -rf $index_path/site2
	;;
    site3)
	#sudo rm -rf $CURRENT_VERSION
        sudo ln -sfn "$WEBSITE_DIR/site1" "$index_path"
	sudo cat $WEBSITE_DIR/site1/index.html > $Current_Website
        sudo rm -rf $index_path/site3
	;;
esac
# echo "Content switched to:   >> /var/log/content_rotation.log "
# Reload Nginx to apply changes
sudo systemctl reload nginx
