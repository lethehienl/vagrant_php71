# => Step 1:  install Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# => Step 2: install ElasticSearch
sudo apt-get install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update && sudo apt-get install elasticsearch

# => Step 3: DONT HAVE PERMISSION TO WRITE
sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml

sudo iptables -I INPUT -p tcp --dport 9200 -j ACCEPT
sudo iptables-save

update-rc.d elasticsearch defaults 95 10
/etc/init.d/elasticsearch start

# => Step 4: install Kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.4-linux-x86_64.tar.gz
gunzip kibana-6.2.4-linux-x86_64.tar.gz
tar -xvf kibana-6.2.4-linux-x86_64.tar
mkdir /opt/kibana
cp -Rrvf kibana-6.2.4-linux-x86_64/* /opt/kibana/
cd /etc/init.d/
wget https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/bce61d85643c2dcdfbc2728c55a41dab444dca20/kibana6
chmod +x /etc/init.d/kibana6

sudo iptables -I INPUT -p tcp --dport 5601 -j ACCEPT
sudo iptables-save

update-rc.d kibana6 defaults 96 9
/etc/init.d/kibana6 restart

#Edit config: 
sudo vi /opt/kibana/config/kibana.yml
# inout server.host: "0.0.0.0"
/etc/init.d/kibana6 restart
# output: http://10.9.1.3:5601


# Step 5: install logstash

echo 'deb http://packages.elasticsearch.org/logstash/6.0/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list
sudo apt-get update
sudo apt-get install logstash
