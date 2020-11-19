RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}


RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f

#RewriteRule ^(.*)$ member_profile.php?username=$1 [QSA,L]

# Generic rule for outside/(logged out) pages
RewriteRule ^about/?$ /outside_about.php [L]
RewriteRule ^contactus/?$ /outside_contactus.php [L]
RewriteRule ^privacy/?$ /outside_privacy.php [L]
RewriteRule ^sitemap/?$ /outside_sitemap.php [L]
RewriteRule ^search/?$ /outside_search.php [L]
RewriteRule ^login/?$ /outside_login.php [L]
RewriteRule ^reset_password/?$ /outside_reset_password.php [L]
RewriteRule ^signup/?$ /outside_signup.php [L]
#RewriteRule ^verify_signup/?$ /outside_verify_signup.php [L]
RewriteRule ^verify_signup/([a-zA-Z0-9\-_]+)/([a-zA-Z0-9\-_]+)/?$ /outside_verify_signup.php?token=$1&action=$2 [QSA,L]
RewriteRule ^subscribe/?$ /outside_subscribe.php [L]

# Generic rule for inside/(logged in) pages
RewriteRule ^logout/?$ /inside_logout.php [L]
RewriteRule ^settings/?$ /inside_settings.php [L]
RewriteRule ^add/?$ /inside_add.php [L]
RewriteRule ^add_event/?$ /inside_add_event.php [L]
RewriteRule ^add_post/?$ /inside_add_post.php [L]
RewriteRule ^add_location/?$ /inside_add_location.php [L]


# Generic rule for Members pages
#RewriteCond %{REQUEST_URI} !^/member_profile.php
#RewriteRule ^(.*)$ members/profile.php?username=$1
#RewriteRule ^(.*)$ member_profile.php?username=$1
#RewriteRule ^([^/]+)$ member_profile.php?username=$1
