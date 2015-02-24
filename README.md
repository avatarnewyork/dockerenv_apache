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
In your docker [PROJECTNAME].yml file that you created for your project make sure you have the:
XDEBUG_CLIENT_IP: 10.2.0.51 <= replace with your desktop IP

Setup XDEBUG on PHPStorm for a Symfony2/Drupal project:
1. Click Run from the navigation bar and select Edit Configurations
2. In the Run/Debug Configurations window that opens click + and select PHP Web Application
3. Name the application [projectnameDEV]

Next we need to configure a server.
1. Under configuration (same window) next to server, click ...
2. On the Servers window that opens click +
3. Name your server [projectnameDEV]
4. under host write [PROJECT_NAME].dev.avatarnewyork.com
5. Check that port is 80 and Debugger is Xdebug

Now we need to configure path mappings for our remote server configuration.
6. Check the Use path mappings checkbox
7. For Symfony2 only, you need to map 2 different directories; Drupal projects require only that the web root directory is mapped:
   - Main project root => /var/www
   - web root => /var/www/html
8. Click apply, OK to save and close the Servers Configurations window
9. Click apply, OK to save and close the Run/Debug Configurations
10. Verify that everything works. 
   - Create a breakpoint and click the little bug in the toolbar (only executable statements can have breakpoints).
   - A new browser window opens with ?XDEBUG_SESSION_START=11349 in the url
   - In PHPStorm the debugging engine is activated and a new console/debugger tool opens

For more information refer to the PHPStorm docs on debugging:
https://www.jetbrains.com/phpstorm/help/debugging-with-a-php-web-application-debug-configuration.html

### PHPUnit + Selenium
phpunit is a dockerenv wrapper to phprun - You can run phpunit tests by using the dockerenv `phpunit` wrapper command as follows:

`phpunit [-hv] [-t <latest|php55beta|php53|php53beta|php51>] <PROJECT> [FILES]`

* -t be sure to always include this unless you are using the latest tag default
* <PROJECT> is your project name
* <FILES> the test file(s) you want to run

#### Selenium Setup
```php
class TestLogin extends PHPUnit_Extensions_Selenium2TestCase {
  public function setUp(){
    // Selenium Host - always dev server ip or hostname
    $this->setHost('10.2.0.10');
	
	// Selenium Port - this is static and is running in privleged mode (will always be 4444)
    $this->setPort(4444);
	
	// Selenium Browser - *currently only supporting chrome
    $this->setBrowser('chrome');
	
	// Selenium Test URL - this will be your dev URL - we should come up with a way to make this dynamic
    $this->setBrowserUrl('http://patsandbox.dev.avatarnewyork.com');
	
}
```

#### Example

See: https://github.com/avatarnewyork/dockerenv_apache/wiki/phpunit_selenium_example

### External Commands
* `phprun` (composer, etc) available in :latest, php53 - see dockerenv documentation
* `drush` available in :latest, php53 - see dockerenv documentation
* `phpunit` available in :latest, php53 - see dockerenv documentation

## Misc Info
* `nodejs less` available in :latest - https://github.com/avatarnewyork/dockerenv_apache/issues/6
* `xdebug` available in :latest, php53: https://github.com/avatarnewyork/dockerenv_apache/issues/8
* `email` available in :latest, php53.  Set environment variables above.  See https://github.com/avatarnewyork/dockerenv_apache/issues/10
