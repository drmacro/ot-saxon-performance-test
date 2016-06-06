#!/bin/bash
#
# Run saxon 9.7 against the input map file using
# the Java HPROF profiler
JAVA_OPTS="-agentlib:hprof=cpu=samples,interval=1,format=a,file=saxon97.hprof.txt"
CLASSPATH="$PWD/lib/xercesImpl-2.11.0.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/xml-apis-1.4.01.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/xml-resolver-1.2.jar"
CLASSPATH="$ClASSPATH:$PWD/lib/saxon9he.jar"

java "$JAVA_OPTS" -cp "$CLASSPATH" net.sf.saxon.Transform \
   "-xsl:$PWD/xsl/topicpull-runner.xsl" \
   "-it:run" \
   "-o:$PWD/output/topicpull-result.xml" \
   "-s:$PWD/input/ot-user-guide/user-guide/DITA-globalization-xhtml.dita" \
   "-t" \
   "defaultLanguage=en-US" &> "$PWD/saxon97.log"
   
#
# End of script
#