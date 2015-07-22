FROM library/sonarqube:5.1.1

MAINTAINER Anderson Nabas, "andersonnabas@gmail.com"

RUN apt-get update && apt-get clean

RUN apt-get install -q -y wget

# download and install sonar plugins
RUN rm /opt/sonarqube/lib/bundled-plugins/sonar-java-plugin-*.jar 

RUN wget -P /opt/sonarqube/extensions/downloads/ https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.4.jar
RUN wget -P /opt/sonarqube/extensions/downloads/ http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-build-breaker-plugin/1.1/sonar-build-breaker-plugin-1.1.jar
RUN wget -P /opt/sonarqube/extensions/downloads/ http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/java/sonar-checkstyle-plugin/2.3/sonar-checkstyle-plugin-2.3.jar
RUN wget -P /opt/sonarqube/extensions/downloads/ http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/java/sonar-pmd-plugin/2.4.1/sonar-pmd-plugin-2.4.1.jar

# Start Sonar
EXPOSE 9000

#importar rules
#curl -X POST -u admin:admin -F 'backup=@/home/nabas/dev/env/sonarqube-5.1.1/rules.xml' -v http://localhost:9000/api/profiles/restore

#set default
#api/profiles/set_as_default

CMD ["/opt/sonarqube/bin/run.sh"]


