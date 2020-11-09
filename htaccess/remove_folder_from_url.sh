# Command Line
# Replace URL by simplified URL without Folder:
# http://domain.com/members/new_member -> http://domain.com/new_member

RewriteEngine on
RewriteBase /

RewriteRule ^$ members/ [L]

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^((?!members/).+)$ members/$1 [L,NC]
