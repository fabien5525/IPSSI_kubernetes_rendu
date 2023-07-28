# composer install & npm install & start nginx
nginx -t
composer install
composer require symfony/profiler-pack
composer require symfony/debug-bundle 
php bin/console cache:clear
npm install
npm run dev
php bin/console doctrine:database:create --if-not-exists
php bin/console doctrine:migrations:migrate --no-interaction
service php8.0-fpm start
service php8.0-fpm status
echo "Server started"
nginx -g "daemon off;"
tail -f /dev/null
