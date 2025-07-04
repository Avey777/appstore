source ./.env 

LOG='./init.log'
mkdir -p $PWD/data/.obd/cluster 2>&1 >> $LOG  || exit 11
if [ "x$OB_INSTALL_PATH" != "x" ]; then
    HOME_PATH="$OB_INSTALL_PATH/ob/$CONTAINER_NAME"
    echo "link $HOME_PATH to $OB_MOUNT_PATH/ob" >> $LOG
    mkdir -p $HOME_PATH 2>&1 >> $LOG || exit 10
    ln -sf $HOME_PATH ./data/ob 2>&1 >> $LOG  || exit 12
    echo "HOME_PATH=$HOME_PATH" >> ./.env 
else
    mkdir -p $OB_MOUNT_PATH/ob 2>&1 >> $LOG  || exit 10
    echo "install path not set" >> $LOG
fi
