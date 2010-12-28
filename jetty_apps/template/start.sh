# this is jetty 7 specific http://jira.codehaus.org/browse/JETTY-1309
# we might need to update that script for STOP.PORT STOP.KEY to work as well in jetty 7
export JETTY_HOME=`pwd`/jetty
export JAVA_HOME="/opt/latest/java"
export PATH=$JAVA_HOME/bin:$PATH
. .config

NB_HOME=`pwd`

JAVA_OPTIONS="$START_JAVA_OPTIONS"
#JAVA_OPTIONS="-Xms32m -Xmx64m $JAVA_OPTIONS"

JETTY_OPTIONS=
JETTY_OPTIONS="$JAVA_OPTIONS $JETTY_OPTIONS"
JETTY_OPTIONS="-DNB_HOME=$NB_HOME $JETTY_OPTIONS"
JETTY_OPTIONS="-DSTOP.PORT=$JETTY_STOP_PORT -DSTOP.KEY=$JETTY_STOP_KEY $JETTY_OPTIONS"

JETTY_OPTIONS2=
JETTY_OPTIONS2="jetty.port=$JETTY_PORT $JETTY_OPTIONS2"

cd $JETTY_HOME
#java $JETTY_OPTIONS -jar start.jar >> ../app.log 2>&1
exec setsid java $JETTY_OPTIONS -jar start.jar $JETTY_OPTIONS2 \
  </dev/null >> ../app.log 2>&1 &
            echo $! > ../app.pid
            disown $!

