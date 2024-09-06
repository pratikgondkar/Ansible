#!/bin/bash
#set -x


#CURRENT_VERSION=$(readlink "$WEBSITE_DIR/current")

folder_path="/var/www/website/current/*"
line=$(ls -l $folder_path | grep ^l)
CURRENT_VERSION=$(basename "$line")

WEBSITE_DIR="/var/www/website"

Current_Website=$WEBSITE_DIR/current/index.html

case "$CURRENT_VERSION" in
    site1)
	#sudo rm -rf $CURRENT_VERSION    
        sudo ln -s "$WEBSITE_DIR/site2" "$WEBSITE_DIR/current"
	sudo cat $WEBSITE_DIR/site2/index.html > $Current_Website
	sudo rm -rf /var/www/website/current/site1
        ;;
    site2)
	#sudo rm -rf $CURRENT_VERSION
        sudo ln -s "$WEBSITE_DIR/site3" "$WEBSITE_DIR/current"
	sudo cat $WEBSITE_DIR/site3/index.html > $Current_Website
        sudo rm -rf /var/www/website/current/site2
	;;
    site3)
	#sudo rm -rf $CURRENT_VERSION
        sudo ln -sfn "$WEBSITE_DIR/site1" "$WEBSITE_DIR/current"
	sudo cat $WEBSITE_DIR/site1/index.html > $Current_Website
        sudo rm -rf /var/www/website/current/site3
	;;
esac
echo "Content switched to:   >> /var/log/content_rotation.log "
# Reload Nginx to apply changes
sudo systemctl reload nginx
