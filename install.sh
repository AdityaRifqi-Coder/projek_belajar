echo "Installing Wifi Password Viewer for Termux"
dir=/data/data/com.termux/files
[ -d "$dir" ] || { echo "Termux not installed!"; exit 1; }
if [ $(getprop ro.build.version.sdk) -lt 26 ]; then
echo "! This script only supports Android 8.0+"
else
mkdir -p $dir/home/.wpass
cd .wpass
curl -s -o "wpd.sh" https://gist.githubusercontent.com/veez21/4f2541d271809864411e3ffbbe8e3df9/raw/wpd
chmod a+x wpd.sh
if ! grep wpass $dir/home/.bashrc;
then
echo "
wpass() {
su -c ../home/.wpass/wpd.sh
}
" >> $dir/home/.bashrc
fi
source $dir/home/.bashrc
echo "Done"
echo "Enter 'wpass' to view passwords for saved networks"
fi