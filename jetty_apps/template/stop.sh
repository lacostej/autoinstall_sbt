export JETTY_HOME=`pwd`/jetty
export JAVA_HOME="/opt/latest/java"
export PATH=$JAVA_HOME/bin:$PATH

. .config

JAVA_OPTIONS=
JAVA_OPTIONS="-Xms32m -Xmx128m $JAVA_OPTIONS"

cd $JETTY_HOME
java $JAVA_OPTIONS -DSTOP.PORT=$JETTY_STOP_PORT -DSTOP.KEY=$JETTY_STOP_KEY -Djetty.port=$JETTY_PORT -jar start.jar --stop
