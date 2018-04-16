# For multilingual sites
#RewriteRule ^fr(/?)(.*)$ /$1$2?language=fr [QSA,L]

RewriteRule ^adminpanel/?$ /adminpanel/index.php [L]

# For sites with user accounts
#RewriteRule ^account/(.*)$ /$1?restrictedArea=1 [L]

# Generic rule for details pages
# Rules for News/Upcoming Events
RewriteRule ^news/?$ /news.php [L]
RewriteRule ^news/([a-zA-Z0-9\-_]+)/?$ /news-details.php?news=$1 [QSA,L]

# Rules For Locations
RewriteRule ^locations/?$ /locations.php [L]
RewriteRule ^locations/([a-zA-Z0-9\-_]+)/?$ /location-direction.php?location=$1 [QSA,L]

# Rules for Catering
RewriteRule ^catering/?$ /catering-info.php [L]
RewriteRule ^catering/([a-zA-Z0-9\-_]+)/?$ /catering-details.php?slug=$1 [QSA,L]
#RewriteRule ^catering/([a-zA-Z0-9\-_]+)/?$ /catering-details.php?slug=$1 [QSA,L]

# Rules for About
RewriteRule ^about/?$ /about/about-us/ [QSA,L]
RewriteRule ^about/our-team/?$ /our-team.php [L]
RewriteRule ^about/([a-zA-Z0-9\-_]+)/?$ /about-us.php?slug=$1 [QSA,L]

# Rules for Gallery
RewriteRule ^gallery/?$ /gallery.php [L]
RewriteRule ^gallery/([a-zA-Z0-9\-_]+)/?$ /gallery-details.php?slug=$1 [QSA,L]

# Rules for Reviews
RewriteRule ^reviews/?$ /reviews.php?slug=$1 [QSA,L]
RewriteRule ^reviews/([a-zA-Z0-9\-_]+)/?$ /reviews.php?slug=$1 [QSA,L]

# Rules for Sitemap
RewriteRule ^sitemap/?$ /sitemap.php?slug=$1 [QSA,L]
RewriteRule ^sitemap/([a-zA-Z0-9\-_]+)/?$ /sitemap.php?slug=$1 [QSA,L]

#For static pages
#RewriteRule ^pages/?([a-zA-Z0-9\-_]+)/?$ /page.php?page=$1 [QSA]


# Rules for event details
RewriteRule ^events/?$ /events.php [L]
RewriteRule ^events/([a-zA-Z0-9\-_]+)/?$ /event-detail.php?slug=$1 [QSA,L]

# Rules for facilities details
RewriteRule ^facilities/([a-zA-Z0-9\-_]+)/([a-zA-Z0-9\-_]+)/?$ /facility-detail.php?slug=$1&slug2=$2 [QSA,L]
RewriteRule ^facilities/([a-zA-Z0-9\-_]+)/?$ /about-us.php?slug=$1 [QSA,L]
RewriteRule ^facilities/?$ /facilities.php [L]
