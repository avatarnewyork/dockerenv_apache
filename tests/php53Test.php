<?php

class php53Test extends PHPUnit_Framework_TestCase{
  public function testExtensions(){
    $this->assertEquals(true, extension_loaded('apc'));
  }
}

?>