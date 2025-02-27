#! /usr/bin/bash


sudo ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/peazip /bin/
sudo ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/pea /bin/
sudo ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res /bin/
#sudo ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/libQt5Pas.so.1 /lib/

sudo ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/peazip.desktop /usr/share/applications/

chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Add to Archive'
chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/Convert
chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract Archive'
chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract Here'
chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract to Folder'
chmod a+x ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Open Archive'
 

ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Add to Archive' ~/.local/share/nautilus/scripts
ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/Convert ~/.local/share/nautilus/scripts
ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract Archive' ~/.local/share/nautilus/scripts
ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract Here' ~/.local/share/nautilus/scripts
ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Extract to Folder' ~/.local/share/nautilus/scripts
ln -s ~/Applications/peazip_portable-10.1.0.LINUX.GTK2.x86_64/res/share/batch/freedesktop_integration/Nautilus-scripts/Archiving/PeaZip/'Open Archive' ~/.local/share/nautilus/scripts

