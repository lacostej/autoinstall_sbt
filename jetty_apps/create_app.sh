#install_jetty_script=/opt/apps/bin/download_jetty
jetty=/opt/downloads/jetty-distribution-7.2.2.v20101205.tar.gz

THIS_PROG="$0"

while [ -h "$THIS_PROG" ]; do
  ls=`ls -ld "$THIS_PROG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    THIS_PROG="$link"
  else
    THIS_PROG=`dirname "$THIS_PROG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$THIS_PROG"`

if [ $# = 0 ]; then
  echo "Missing argument deploymentName"
  echo "Usage: $0 deploymentName"
  exit -1
fi


cp -ar $PRGDIR/template $1
cd $1
#$install_jetty > /dev/null
tar -zxovf $jetty  > /dev/null
ln -s jetty* jetty
cd ..

target=`pwd`/$1

echo "$1 deployment created"
echo "before starting the app with "
echo "  cd $target ; ./start.sh"
echo "please change these values"
grep -r FIXME $target
