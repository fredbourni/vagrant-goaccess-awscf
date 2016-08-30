# maxmind goeiplite
add-apt-repository -y ppa:maxmind/ppa && apt-get update
apt-get install -y build-essential autoconf libgeoip-dev libncursesw5-dev
wget -N -q http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz && mv GeoLiteCity.dat /usr/local/share/GeoIP/

# goaccess
curl -s http://tar.goaccess.io/goaccess-1.0.2.tar.gz | tar xvz
cd goaccess-1.0.2/ && ./configure --enable-geoip --enable-utf8 && make && make install

# cloudfront specific goaccess config
patch /usr/local/etc/goaccess.conf ./goaccess/cloudfront.diff

# aws cli
curl -s https://bootstrap.pypa.io/get-pip.py | python3 && pip install awscli

# setting proper vagrant permissions for default nginx webroot folder
apt-get -y install nginx && chown -R vagrant:vagrant /usr/share/nginx/html/