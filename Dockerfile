FROM eeacms/apache:2.4-2.3
LABEL maintainer="European Environment Agency (EEA): IDM2 A-Team <eea-edw-a-team-alerts@googlegroups.com>"

COPY html  /usr/local/apache2/htdocs

# enable proxy formatted logs
RUN  sed -i '/LogFormat.*common/a \    LogFormat \"%{X-Forwarded-For}i %l %u %t \\"%r\\" %>s %b \\"%{Referer}i\\" \\"%{User-Agent}i\\"" proxy' /usr/local/apache2/conf/httpd.conf \
   &&  sed -i "$( grep -n CustomLog.*common /usr/local/apache2/conf/httpd.conf | cut -d: -f1)s/common/proxy/" /usr/local/apache2/conf/httpd.conf 
