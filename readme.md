# TSI Admin Portal

Follow the instructions below to set up the TSI Admin Portal Laravel Project.
A few important things to keep in mind:
 
- The Laravel project root is located at `/path/to/townsquareinteractive/current/tsi`.
- The default `public` directory was renamed to `admin` for better urls.


## Configure Apache

Add the following `<Directory>` to `/etc/apache2/httpd.conf`.

```
<Directory "/path/to/townsquareinteractive/current/tsi/admin">
    Options FollowSymLinks Multiviews
    MultiviewsMatch Any
    AllowOverride All
    Require all granted
</Directory>
```


## Fix Permissions

Laravel creates and writes to files in

- `/storage/app/`
- `/storage/framework/`
- `/storage/logs/`
- `/bootstrap/cache/`

These must be writeable, otherwise Laravel will throw unexpected errors, or render a blank page. Set __user__, __group__, and __other__ permissions to allow reading and __writing__ to the above directories and the files within.

```
cd /path/to/project_root
chmod -R g+rw storage
```

For Mac OS X users: `chown :_www storage/ bootstrap/cache/`  
For Linux users: `chown :www-data storage/ bootstrap/cache/`

## Configure Environment

Environment settings are stored in the `.env` file in the Laravel project root. The `env('APP_URL','default_value')` function is used to read these settings throughout the application, especially in bootstrapped and config files. These settings should be machine/environment-specific, e.g., my computer, your computer, staging1, staging2, production.

NOTE: `.env` files should __NOT__ be tracked in git.

#### Settings
`APP_ENV` defines the environment, e.g., local, production  
`APP_DEBUG` toggles whether or not to display debug statements and stack traces  
`APP_KEY` is used for encryption/decryption and hash functions  
`APP_URL` defines the default "base url" of the Laravel app  
`DB_CONNECTION` default connection to use (see `/config/database.php`)  
`DB_HOST` connection host  
`DB_PORT` connection port  
`DB_DATABASE` database to use  
`DB_USERNAME` username  
`DB_PASSWORD` password  
`DB_TABLE_PREFIX` table prefix  

#### Example .env File
```
APP_ENV=local
APP_DEBUG=true
APP_KEY=base64:qvdcknKsLtaxQhKevlZHbhOTVP2opuZ0PlGwMo0RrbE=
APP_URL=http://test3.b2b.localhost/tsi/admin/a/p/

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=townsquare
DB_USERNAME=tsi
DB_PASSWORD=4vrf5btg
DB_TABLE_PREFIX=ap_
```