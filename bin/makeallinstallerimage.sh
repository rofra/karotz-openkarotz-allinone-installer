#/bin/bash

CURRDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOTDIR=$CURRDIR/../
cd $ROOTDIR

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

if [ ! -d "${ROOTDIR}firmware" ]; then
  echo "firmware not found"
  exit 1
fi

if [ ! -d "${ROOTDIR}firmware" ]; then
  echo "websources not found"
  exit 1
fi

echo "Generating Firmware"
cd firmware
./bin/makeroms.sh
cd ${ROOTDIR}


if [ ! -f ${ROOTDIR}firmware/rootfs.img.gz ] || [ ! -f ${ROOTDIR}firmware/rootfs.img.gz.md5 ] ; then
  echo "ERROR, firmware not generated"
  rm -f ${ROOTDIR}firmware/rootfs.img.gz ${ROOTDIR}firmware/rootfs.img.gz.md5
  exit 1
fi

echo "Compiling Files in a new image directory"
rm -fr ${ROOTDIR}generatedimage/
mkdir ${ROOTDIR}generatedimage/
cp -f ${ROOTDIR}ressources/autorun  ${ROOTDIR}ressources/autorun.sig ${ROOTDIR}ressources/tools2.tar  ${ROOTDIR}generatedimage/ 
cp -fR ${ROOTDIR}ressources/sound ${ROOTDIR}generatedimage/ 
cp -fR ${ROOTDIR}ressources/conf ${ROOTDIR}generatedimage/

mv -f ${ROOTDIR}firmware/rootfs.img.gz ${ROOTDIR}firmware/rootfs.img.gz.md5 ${ROOTDIR}generatedimage/
cp -fR ${ROOTDIR}websources/ ${ROOTDIR}generatedimage/openkarotz/


echo "Managing rights problems"
chmod -R 755 ${ROOTDIR}generatedimage/

echo "OK! Your installer is generated in 'generatedimage' directory"
echo "End of the generation"


