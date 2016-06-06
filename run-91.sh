#!/bin/bash
#
# Run saxon against the input map file using
# the Java HPROF profiler
JAVA_OPTS="-agentlib:hprof=cpu=samples,interval=1,format=a,file=saxon91.hprof.txt"
CLASSPATH="$PWD/lib/xercesImpl-2.11.0.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/xml-apis-1.4.01.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/xml-resolver-1.2.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/saxon-9.1.0.8.jar"

java "$JAVA_OPTS" -cp "$CLASSPATH" net.sf.saxon.Transform \
   "-xsl:$PWD/xsl/topicpull-runner.xsl" \
   "-it:run" \
   "-o:$PWD/output/topicpull-result.xml" \
   "-s:$PWD/input/ot-user-guide/user-guide/DITA-globalization-xhtml.dita" \
   "-t" \
   "defaultLanguage=en-US" &> "$PWD/saxon91.log"
   
#
# End of script
#