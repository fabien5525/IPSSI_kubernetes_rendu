# composer install & npm install & start nginx
nginx -t
composer install
npm install
npm run dev
php bin/console doctrine:database:create --if-not-exists
php bin/console doctrine:migrations:migrate --no-interaction
service php8.0-fpm start
service php8.0-fpm status
echo "Server started"
nginx -g "daemon off;"
tail -f /dev/null
