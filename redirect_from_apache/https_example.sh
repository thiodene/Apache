Redirect to HTTPS on Apache

When a SSL certificate is installed on the server, the website is not available via a secure HTTPS connection by default. It is necessary to add “https” to a URL every time one needs to be securely connected. The best way to achieve maximum security for website visitors is to enable an automatic redirect from HTTP to HTTPS.

If you have some control panel installed over Apache, it is necessary to set up redirects in the panel itself and not on the server to avoid redirect loops or incorrect module execution. You can check the guide on how to set up HTTPS redirect in cPanel here.

The redirect should be created on Apache directly if cPanel or any other control panel or GUI (graphical user interface) is not used.

Before setting up the redirect, please make sure that the following modules are enabled. Please run the commands below:

(View page: https://www.namecheap.com/support/knowledgebase/article.aspx/9821/38/redirect-to-https-on-apache)

sudo a2enmod rewrite
sudo a2enmod ssl

If both modules are enabled, you will see the following messages:

There are several methods of enabling a redirect from HTTP to HTTPS on Apache:

    Enable the redirect in the virtual host file for the necessary domain.
    Enable it in the .htaccess file (previously created in the web root folder).
    Use the mod_rewrite rule in the virtual host file.
    Use it in the .htaccess file to force HTTPS.

Enabling the redirect in the virtual host file is safer and simpler than other options, as the configuration will be similar for all systems. Usually, there are two virtual host files on Apache if an SSL certificate is installed: one is for the non-secure port 80, and the other is for the secure port 443. The redirect to HTTPS can be enabled in the virtual host for port 80. If you would like to force HTTPS only for certain webpages, you can use the following set of directives:

<VirtualHost *:80>
ServerName www.yourdomain.com
DocumentRoot /usr/local/apache2/htdocs
Redirect permanent /secure https://yourdomain.com/secure
</VirtualHost>

<VirtualHost _default_:443>
ServerName www.yourdomain.com
DocumentRoot /usr/local/apache2/htdocs
SSLEngine On
# ...
</VirtualHost>

where /secure is the directory you would like to force HTTPS for.

Otherwise, a permanent redirect to HTTPS can be enabled for all the pages of the website:

<VirtualHost *:80>
ServerName www.yourdomain.com
Redirect permanent / https://www.yourdomain.com/
</VirtualHost>

<VirtualHost _default_:443>
ServerName www.yourdomain.com
DocumentRoot /usr/local/apache2/htdocs
SSLEngine On
# ...
</VirtualHost>

As an alternative, you can modify the .htaccess file. The following directive can be used in the .htaccess file placed in the document root folder of the website to secure certain pages of the website:

Redirect permanent /secure https://www.yourdomain.com/secure

Using the mod_rewrite rule is recommended for experienced users, as the exact configuration can be different on different systems. The syntax of mod_rewrite rules can be complicated - for example, if you would like to redirect to HTTPS certain subfolders that consist of other subfolders. If you are not sure whether mod_rewrite can be used, it is better to enable the redirect to HTTPS in the virtual host file. If you would like to create a redirect for certain pages, the mod_rewrite rule should look like this:

RewriteEngine On
RewriteCond %{HTTPS} !=on
RewriteRule ^/?secure/(.*) https://%{SERVER_NAME}/secure/$1 [R,L]

The redirect for all directories is similar and looks like this:

RewriteEngine On
RewriteCond %{HTTPS} !=on
RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]

Note: To set a redirect with a 301 status code (permanent), you will need to assign this code to the R-flag in brackets by adding “=301”.

Now your website will be available via HTTPS by default. To check if the redirects work correctly, please clear the cache in the browser you usually use and open your website or try checking it in another browser.
