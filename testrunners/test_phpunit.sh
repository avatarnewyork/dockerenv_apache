#!/bin/bash

docker-compose -f docker-compose.yml run web /.composer/vendor/phpunit/phpunit/phpunit  /var/www/html/
