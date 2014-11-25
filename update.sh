#!/bin/bash
set -e

DIALOG=whiptail
$DIALOG --passwordbox "Please enter the passhrase to unlock the key" 10 40 2> pass.tmp
PASSPHRASE=`cat pass.tmp`
rm pass.tmp

if ! echo "abc" | gpg --passphrase "$PASSPHRASE" -o /dev/null -as; then
	echo "bad passphrase"
	exit 1
fi

# Create a fresh index
rm -rf debian || true
cp -R packages debian


# first sign the .debs
DEBS=`find debian -name "*.deb"`
for deb in $DEBS; do
	dpkg-sig -g "--passphrase \"$PASSPHRASE\"" --sign builder $deb
done

# then update the indexes
apt-ftparchive packages debian > debian/Packages
apt-ftparchive sources debian > debian/Sources
apt-ftparchive release debian > debian/Release

cat debian/Packages | gzip > debian/Packages.gz
cat debian/Packages | bzip2 > debian/Packages.bz2
cat debian/Sources | gzip > debian/Sources.gz
cat debian/Sources | bzip2 > debian/Sources.bz2

# sign release files:
gpg --yes --passphrase "$PASSPHRASE" --clearsign -o debian/InRelease debian/Release
gpg --yes --passphrase "$PASSPHRASE" -abs -o debian/Release.gpg debian/Release

# output the key to the repo that was used to sign them
gpg --yes --output debian/key --armor --export

# Update the translations
TRANSLATIONS=`find translate -xtype f`
[[ -d langs ]] && rm -rf langs;
mkdir langs
for translation in $TRANSLATIONS; do
	name=`basename $translation`
	arr=(`echo $name | egrep -o "[^.]+"`)
	pkg=${arr[0]}
	lng=${arr[1]}
	md5=(`cat $translation | md5sum`)

	echo "Package: $pkg"         >> langs/$lng
	echo "Description-md5: $md5" >> langs/$lng
	echo -n "Description-$lng: " >> langs/$lng
	cat $translation             >> langs/$lng
	echo                         >> langs/$lng
done

LANGS=`find langs -xtype f`
for lang in $LANGS; do
	cat $lang | gzip > $lang.gz
	cat $lang | bzip2 > $lang.bz2
done

mv langs/* debian/
rm -rf langs

#  deb http://kateadams.eu/ debian/
#  deb-src http://kateadams.eu/ debian/
#$ curl kateadams.eu/debian/key | sudo apt-key add -
