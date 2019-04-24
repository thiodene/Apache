# Change Apache default port to a custom port
# For Ubuntu

# Edit ports.conf
sudo vi /etc/apache2/ports.conf

# replace Listen 80 by
Listen 0.0.0.0:80

# Or any port chosen to access the API, example 8080
Listen 0.0.0.0:8080

# Then if needed change 000-default.conf
sudo vi /etc/apache2/sites-enabled/000-default.conf
<VirtualHost *:8090>
# save the file
[CTRL] + ZZ

# restart Apache
sudo service apache2 restart

# Now by typing
netstat -lnp
# 80 port should show:
0.0.0.0: 80 
# instead of
:::80
