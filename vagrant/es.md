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
sudo vi /etc/elasticsearch/elasticsearch.yml
# network.host: 0.0.0.0" 
# port 9200

sudo iptables -I INPUT -p tcp --dport 9200 -j ACCEPT
sudo iptables-save

update-rc.d elasticsearch defaults 95 10
/etc/init.d/elasticsearch start

# => Step 4: install Kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.1-amd64.deb
shasum -a 512 kibana-6.3.1-amd64.deb 
sudo dpkg -i kibana-6.3.1-amd64.deb

chmod +x /etc/init.d/kibana

sudo iptables -I INPUT -p tcp --dport 5601 -j ACCEPT
sudo iptables-save

sudo update-rc.d kibana defaults 95 10
sudo -i service kibana start

#Edit config: 
sudo vi /etc/kibana/kibana.yml
# inout server.host: "0.0.0.0"
# port 5601
/etc/init.d/kibana restart
# output: http://10.9.1.3:5601


# Step 5: install logstash

echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

etc/apt/sources.list.d/logstash.list
sudo apt-get update
sudo apt-get install logstash
