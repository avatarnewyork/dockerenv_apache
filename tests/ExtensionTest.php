<?php

class ExtensionTest extends PHPUnit_Framework_TestCase
{
  
  public function testStandardExtensionsLoaded()
  {
    // extras
    $this->assertEquals(true, extension_loaded('imagick'));
    $this->assertEquals(true, extension_loaded('ssh2'));
    $this->assertEquals(true, extension_loaded('memcache'));
    $this->assertEquals(true, extension_loaded('memcached'));
    $this->assertEquals(true, extension_loaded('solr'));
    $this->assertEquals(true, extension_loaded('xdebug'));
    $this->assertEquals(true, extension_loaded('curl'));
    $this->assertEquals(true, extension_loaded('OAuth'));

    // standard
    $this->assertEquals(true, extension_loaded('bcmath'));
    $this->assertEquals(true, extension_loaded('bz2'));
    $this->assertEquals(true, extension_loaded('calendar'));
    $this->assertEquals(true, extension_loaded('Core'));
    $this->assertEquals(true, extension_loaded('ctype'));
    $this->assertEquals(true, extension_loaded('date'));
    $this->assertEquals(true, extension_loaded('dom'));
    $this->assertEquals(true, extension_loaded('ereg'));
    $this->assertEquals(true, extension_loaded('exif'));
    $this->assertEquals(true, extension_loaded('fileinfo'));
    $this->assertEquals(true, extension_loaded('ftp'));
    $this->assertEquals(true, extension_loaded('gd'));
    $this->assertEquals(true, extension_loaded('gettext'));
    $this->assertEquals(true, extension_loaded('gmp'));
    $this->assertEquals(true, extension_loaded('hash'));
    $this->assertEquals(true, extension_loaded('iconv'));
    $this->assertEquals(true, extension_loaded('intl'));
    $this->assertEquals(true, extension_loaded('json'));
    $this->assertEquals(true, extension_loaded('ldap'));
    $this->assertEquals(true, extension_loaded('libxml'));
    $this->assertEquals(true, extension_loaded('mbstring'));
    $this->assertEquals(true, extension_loaded('mcrypt'));
    $this->assertEquals(true, extension_loaded('mysql'));
    $this->assertEquals(true, extension_loaded('mysqli'));
    $this->assertEquals(true, extension_loaded('openssl'));
    $this->assertEquals(true, extension_loaded('pcntl'));
    $this->assertEquals(true, extension_loaded('pcre'));
    $this->assertEquals(true, extension_loaded('PDO'));
    $this->assertEquals(true, extension_loaded('pdo_mysql'));
    $this->assertEquals(true, extension_loaded('pdo_sqlite'));
    $this->assertEquals(true, extension_loaded('Phar'));
    $this->assertEquals(true, extension_loaded('pspell'));
    $this->assertEquals(true, extension_loaded('readline'));
    $this->assertEquals(true, extension_loaded('Reflection'));
    $this->assertEquals(true, extension_loaded('session'));
    $this->assertEquals(true, extension_loaded('shmop'));
    $this->assertEquals(true, extension_loaded('SimpleXML'));
    $this->assertEquals(true, extension_loaded('snmp'));
    $this->assertEquals(true, extension_loaded('soap'));
    $this->assertEquals(true, extension_loaded('sockets'));
    $this->assertEquals(true, extension_loaded('SPL'));
    $this->assertEquals(true, extension_loaded('sqlite3'));
    $this->assertEquals(true, extension_loaded('standard'));
    $this->assertEquals(true, extension_loaded('tokenizer'));
    $this->assertEquals(true, extension_loaded('wddx'));
    $this->assertEquals(true, extension_loaded('xml'));
    $this->assertEquals(true, extension_loaded('xmlreader'));
    $this->assertEquals(true, extension_loaded('xmlrpc'));
    $this->assertEquals(true, extension_loaded('xmlwriter'));
    $this->assertEquals(true, extension_loaded('xsl'));
    $this->assertEquals(true, extension_loaded('zip'));
    $this->assertEquals(true, extension_loaded('zlib'));

  }
}

// PHP 5.3 Specific
//if (version_compare(PHP_VERSION, '5.3.3') == 0) 
//  $this->assertEquals(true, extension_loaded('apc'));
    
?>