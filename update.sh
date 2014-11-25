#!/bin/sh
DIALOG=whiptail
$DIALOG --passwordbox "Please enter the passhrase to unlock the key" 10 40 2> pass.tmp
PASSPHRASE=`cat pass.tmp`
rm pass.tmp

if ! echo "abc" | gpg --passphrase "$PASSPHRASE" -o /dev/null -as; then
	echo "bad passphrase"
	exit 1
fi

apt-ftparchive packages debian > debian/Packages
apt-ftparchive sources debian > debian/Sources
apt-ftparchive release debian > debian/Release

cat debian/Packages | gzip > debian/Packages.gz
cat debian/Sources | gzip > debian/Sources.gz

# sign release files:
gpg --yes --passphrase "$PASSPHRASE" --clearsign -o debian/InRelease debian/Release
gpg --yes --passphrase "$PASSPHRASE" -abs -o debian/Release.gpg debian/Release

# sign debs
DEBS=`find debian -name "*.deb"`
for deb in $DEBS; do
	dpkg-sig -g "--passphrase \"$PASSPHRASE\"" --sign builder $deb
done

# output the key to the repo that was used to sign them
gpg --yes --output debian/key --armor --export


#  deb http://kateadams.eu/ debian/
#  deb-src http://kateadams.eu/ debian/
#$ curl kateadams.eu/debian/key | sudo apt-key add -
