# This script replaces a full URL of the type:
# domain.com/members/profile.php?username=thiodene
# by the following:
# domain.com/thiodene
# Source:
# https://stackoverflow.com/questions/21649616/display-username-in-url-instead-of-id-using-htaccess

RewriteEngine on

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ members/profile.php?username=$1 [L]
