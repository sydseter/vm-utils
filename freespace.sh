cat - << EOWARNING
You should NOT do this on a running system.
This is purely for making vagrant boxes damn small.
 
Press Ctrl+C within the next 10 seconds if you want to abort!!
 
EOWARNING
sleep 10;
 
echo 'Cleanup bash history'
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history
 
echo 'Cleanup log files'
find /var/log -type f | while read f; do echo -ne '' > $f; done;
sudo apt-get clean
sudo aptitude clean
sudo find /var/cache -type f -exec rm -rf {} \;
