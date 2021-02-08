wpath="export WSPACE=$PWD/";
echo $wpath >> ~/.bash_profile;

wexec="wspace() { source $PWD/wspace.sh \$@; }"
echo $wexec >> ~/.bash_profile;

while true; do
    echo ""
    read -p "WSPACE has been installed. Reload shell? [y/n]: > " yn
    case $yn in
        [Yy]* ) source ~/.bash_profile; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done