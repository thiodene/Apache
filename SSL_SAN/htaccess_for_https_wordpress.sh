#php_flag display_errors on
#php_flag display_startup_errors on
#php_value error_reporting 2047

#php_flag register_globals off
#php_value upload_max_filesize 50M
#php_value post_max_size 50M

#Header add Access-Control-Allow-Origin "*"
#Header add Access-Control-Allow-Headers "origin, x-requested-with, content-type"
#Header add Access-Control-Allow-Methods "PUT, GET, POST, DELETE, OPTIONS"

<FilesMatch ".less$">
  Header set Cache-Control "no-cache"
</FilesMatch>

# For .htc files
#AddType text/x-component .htc

RewriteEngine On
RewriteBase /

ErrorDocument 404 /404/

# For https
RewriteCond %{HTTPS} !=on
RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Force www
RewriteCond %{HTTP_HOST} !^$
RewriteCond %{HTTP_HOST} !^www\.theroyalambassador\.com [NC]
RewriteCond %{HTTPS}s ^on(s)|
RewriteRule ^ http%1://www.%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

# Force trailing slash
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_URI}  !\.[a-zA-Z0-9]{2,4}$
RewriteCond %{HTTPS}s ^on(s)|
RewriteRule ^(.*)([^/])$ http%1://%{HTTP_HOST}/$1$2/ [L,R=301]

# For multilingual sites
#RewriteRule ^fr(/?)(.*)$ /$1$2?language=fr [QSA,L]

# Just for IE
#RewriteCond %{REQUEST_URI} !^/pie/PIE\.htc [NC]
#RewriteCond %{REQUEST_URI} PIE\.htc [NC]
#RewriteRule (.*) http://%{HTTP_HOST}/pie/PIE.htc [R=301,L]

# Ignore rewrites for some folders
#RewriteRule ^blog - [L]

RewriteRule ^adminpanel/?$ /adminpanel/index.php [L]

# For sites with user accounts
#RewriteRule ^account/(.*)$ /$1?restrictedArea=1 [L]

# Generic rule for details pages
RewriteRule ^news/([a-zA-Z0-9\-_]+)/?$ /news-details.php?news=$1 [QSA,L]
RewriteRule ^locations/([a-zA-Z0-9\-_]+)/?$ /location-direction.php?location=$1 [QSA,L]
RewriteRule ^catering/?$ /catering-info.php [L]
RewriteRule ^catering/([a-zA-Z0-9\-_]+)/?$ /catering-details.php?slug=$1 [QSA,L]
#RewriteRule ^catering/([a-zA-Z0-9\-_]+)/?$ /catering-details.php?slug=$1 [QSA,L]
RewriteRule ^about/?$ /about/about-us/ [QSA,L]
RewriteRule ^about/our-team/?$ /our-team.php [L]
RewriteRule ^about/([a-zA-Z0-9\-_]+)/?$ /about-us.php?slug=$1 [QSA,L]
RewriteRule ^gallery/([a-zA-Z0-9\-_]+)/?$ /gallery-details.php?slug=$1 [QSA,L]

#For static pages
#RewriteRule ^pages/?([a-zA-Z0-9\-_]+)/?$ /page.php?page=$1 [QSA]


# Rules for event details
RewriteRule ^events/([a-zA-Z0-9\-_]+)/?$ /event-detail.php?slug=$1 [QSA,L]

# Rules for facilities details
RewriteRule ^facilities/([a-zA-Z0-9\-_]+)/([a-zA-Z0-9\-_]+)/?$ /facility-detail.php?slug=$1&slug2=$2 [QSA,L]
RewriteRule ^facilities/([a-zA-Z0-9\-_]+)/?$ /about-us.php?slug=$1 [QSA,L]
RewriteRule ^facilities/?$ /facilities.php [L]


#GZIP Compression

# compress text, html, javascript, css, xml:
AddOutputFilterByType DEFLATE text/plain
AddOutputFilterByType DEFLATE text/html
AddOutputFilterByType DEFLATE text/xml
AddOutputFilterByType DEFLATE text/css
AddOutputFilterByType DEFLATE application/xml
AddOutputFilterByType DEFLATE application/xhtml+xml
AddOutputFilterByType DEFLATE application/rss+xml
AddOutputFilterByType DEFLATE application/javascript
AddOutputFilterByType DEFLATE application/x-javascript

# Or, compress certain file types by extension:

SetOutputFilter DEFLATE


# Rules for file_server
#RewriteRule ^files/pages/([a-zA-Z0-9\-_]+\.pdf)$ /file_server.php?file=$1 [NC,L]

# This uses a request path. It skips redirection for existing files and directories.
# The request path contains the menu and page url names.
# Links look like /about/privacy
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([a-zA-Z0-9\-_]+)/([a-zA-Z0-9\-_]+)/?$ /page_server.php?menu=$1&page=$2 [QSA,L]

# Redirect page to page.php
RewriteRule ^([a-zA-Z0-9\-_]+)\.(html|htm)$ /$1.php [NC,L]
RewriteRule ^([a-zA-Z0-9\-_]+)/?$ /$1.php [NC,L]

<IfModule mod_rewrite.c>
  Options +FollowSymlinks
  RewriteEngine On

  # Adaptive-Images -----------------------------------------------------------------------------------

  # Add any directories you wish to omit from the Adaptive-Images process on a new line, as follows:
  # RewriteCond %{REQUEST_URI} !ignore-this-directory
  # RewriteCond %{REQUEST_URI} !and-ignore-this-directory-too

  RewriteCond %{REQUEST_URI} !assets

  # don't apply the AI behaviour to images inside AI's cache folder:
  RewriteCond %{REQUEST_URI} !ai-cache

  # Send any GIF, JPG, or PNG request that IS NOT stored inside one of the above directories
  # to adaptive-images.php so we can select appropriately sized versions

  RewriteRule \.(?:jpe?g|gif|png)$ /inc/adaptive-images.php

  # END Adaptive-Images -------------------------------------------------------------------------------
</IfModule>
