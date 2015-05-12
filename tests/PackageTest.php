<?php
class PackageTest extends PHPUnit_Framework_TestCase
{

  public function testPearPackagesInstalled()
  {
    include 'PEAR/Registry.php';

    $reg = new PEAR_Registry;
    $packages = $reg->listPackages();

    $this->assertContains('console_table', $packages);
    $this->assertContains('archive_tar', $packages);
    $this->assertContains('xml_rpc', $packages);
    $this->assertContains('console_getopt', $packages);
    $this->assertContains('xml_util', $packages);
    $this->assertContains('pear', $packages);
  }
  

}

?>
