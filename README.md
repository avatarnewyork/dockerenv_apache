dockerenv_apache
================

## Fig
Example
```yml
sandboxproject:
  image: avatarnewyork/dockerenv-apache:php53
  volumes:
    - /var/www/sandboxproject/public:/var/www/html
  ports:
    - "80"
  links: 
    - db # Link any external containers, like your database
  environment:
    POSTFIX_HOSTNAME: dev_host
    POSTFIX_USER: postmaster@dev.mailgun.com
    POSTFIX_PWD: somesecretpassword
    XDEBUG_CLIENT_IP: 10.2.0.51
```
## Environment Varaibles
### Email - mailgun
Ask your admin for these (different for staging / dev environments)
```
POSTFIX_HOSTNAME: [hostname]
POSTFIX_USER: [user]
POSTFIX_PWD: [password]
```

### XDEBUG
Add your desktop IP address.  Tested with PHPStorm Client
XDEBUG_CLIENT_IP: 10.2.0.51

### External Commands
* `phprun` (composer, etc) available in :latest, php53 - see dockerenv documentation
* `drush` available in :latest, php53 - see dockerenv documentation

## Misc Info
* `nodejs less` available in :latest - https://github.com/avatarnewyork/dockerenv_apache/issues/6
* `xdebug` available in :latest, php53: https://github.com/avatarnewyork/dockerenv_apache/issues/8
* `email` available in :latest, php53.  Set environment variables above.  See https://github.com/avatarnewyork/dockerenv_apache/issues/10
