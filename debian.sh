#! /bin/sh
# Configure your paths and filenames
SOURCEBINPATH=.
SOURCEBIN=warsms
SOURCEDMN=warsms-fake-daemon
SOURCECONF=warsmsrc
SOURCEDEF=sms_mms_gateways.json
SOURCEDOC=README.md
DEBFOLDER=warsms
DEBVERSION=$(date +%Y%m%d)

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi
cd $TOME

#git pull origin master

DEBFOLDERNAME="$TOME/../$DEBFOLDER-$DEBVERSION"

# Create your scripts source dir

# Copy your script to the source dir
cp $TOME $DEBFOLDERNAME/ -R
cd $DEBFOLDERNAME

pwd

# Create the packaging skeleton (debian/*)
dh_make --indep --createorig 

mkdir -p debian/tmp/usr
cp -R usr debian/tmp/usr

# Remove make calls
grep -v makefile debian/rules > debian/rules.new 
mv debian/rules.new debian/rules 

# debian/install must contain the list of scripts to install 
# as well as the target directory
echo usr/bin/$SOURCEBIN usr/bin >> debian/install
echo usr/bin/$SOURCEDMN usr/bin >> debian/install
echo etc/$SOURCECONF etc >> debian/install
echo usr/share/warsms/$SOURCEDEF usr/share/warsms >> debian/install
cp $SOURCEDOC usr/share/doc/$DEBFOLDER/$SOURCEDOC
echo usr/share/doc/$DEBFOLDER/$SOURCEDOC usr/share/doc/$DEBFOLDER >> debian/install

echo "Source: $DEBFOLDER
Section: unknown
Priority: optional
Maintainer: cmotc <cmotc@openmailbox.org>
Build-Depends: debhelper (>= 9)
Standards-Version: 3.9.5
Homepage: https://www.github.com/cmotc/warsms
#Vcs-Git: git@github.com:cmotc/warsms
#Vcs-Browser: https://www.github.com/cmotc/warsms

Package: $DEBFOLDER
Architecture: all
Depends: mail, jq, \${misc:Depends}
Description: A script for determining the carrier of a cell number by process
 of elimination.
" > debian/control

#echo "gsettings set org.gnome.desktop.session session-name awesome-gnome
#dconf write /org/gnome/settings-daemon/plugins/cursor/active false
#gconftool-2 --type bool --set /apps/gnome_settings_daemon/plugins/background/active false
#" > debian/postinst
# Remove the example files
rm debian/*.ex
rm debian/*.EX

dpkg-source --commit . "$DEBVERSION"

# Build the package.
# You  will get a lot of warnings and ../somescripts_0.1-1_i386.deb
debuild -us -uc >> ../log
