# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# Utiliser une image de base Tomcat
FROM openjdk:8-jdk-alpine

# Définir des variables d'environnement
ENV TOMCAT_VERSION=8.5.82
ENV CATALINA_HOME=/usr/local/tomcat/webapps
ENV PATH=$CATALINA_HOME/bin:$PATH

# Installer Tomcat
RUN apk add --no-cache wget ca-certificates \
    && wget https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mkdir -p $CATALINA_HOME \
    && tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C $CATALINA_HOME --strip-components=1 \
    && rm apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && apk del wget ca-certificates

# Copier l'application JSP dans le dossier webapps de Tomcat
COPY dist/Jovena2.war $CATALINA_HOME/webapps/

# Exposer le port 8080
EXPOSE 8080

# Démarrer Tomcat
CMD ["catalina.sh", "run"]