<?php
class PackageTest extends PHPUnit_Framework_TestCase
{

  public function testPearPackagesInstalled()
  {

    error_reporting(E_ALL & ~E_STRICT & ~E_DEPRECATED);
    
    require_once "PEAR/Config.php";
    $conf = new PEAR_Config();
    $reg = $conf->getRegistry();

    $packages = $reg->listPackages();

    $this->assertContains('console_table', $packages);
    $this->assertContains('archive_tar', $packages);
    $this->assertContains('console_getopt', $packages);
    $this->assertContains('xml_util', $packages);
    $this->assertContains('pear', $packages);
  }
  

}

?>
