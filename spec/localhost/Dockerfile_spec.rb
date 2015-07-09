# spec/Dockerfile_spec.rb

require "serverspec"
require "docker"

# Workaround needed for circleCI
if ENV['CIRCLECI']
  class Docker::Container
    def remove(options={}); end
    alias_method :delete, :remove
  end
end

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, :family => 'redhat'
    set :backend, :docker
    set :docker_image, image.id
  end

  it "installs the right version of Centos" do
    expect(os_version).to include("CentOS release 6.6")
  end

  it "installs required packages" do
    expect(package("httpd")).to be_installed
    expect(package("npm")).to be_installed
    expect(package("php56w")).to be_installed
  end

  describe 'Apache Install' do
    describe command('apachectl -M') do
      its(:stdout) { should include('rewrite_module') }
      its(:stdout) { should include('php5_module') }
    end
    
    describe command('apachectl -V') do
      # test 'Prefork' exists between "Server MPM" and "Server compiled".
      its(:stdout) { should include('Prefork') }
      
      # test 'conf/httpd.conf' exists after "SERVER_CONFIG_FILE".
      its(:stdout) { should include('conf/httpd.conf') }
      
      # test 'Apache/2.2.15' exists before "Server built".
      its(:stdout) { should include(' Apache/2.2.15') }
    end
  end

  describe 'PHP config parameters' do
    context  php_config('default_mimetype') do
      its(:value) { should eq 'text/html' }
    end

    context php_config('xdebug.max_nesting_level') do
      its(:value) { should eq 300 }
    end
    context php_config('xdebug.remote_port') do
      its(:value) { should eq 9000 }
    end
    context php_config('xdebug.profiler_enable') do
      its(:value) { should eq 0 }
    end
  end

  describe 'NodeJS Packages - version specifc' do
    describe package('less') do
      it { should be_installed.by('npm').with_version('1.7.5') }
    end
    describe package('uglify-js') do
      it { should be_installed.by('npm').with_version('2.3.6') }
    end
    describe package('uglifycss') do
      it { should be_installed.by('npm').with_version('0.0.10') }
    end
    describe package('grunt') do
      it { should be_installed.by('npm') }
    end
  end

  describe 'Misc installed packages' do
    describe command('which drush') do
      its(:stdout) { should match "/usr/bin/drush" }
    end
    describe command('which composer.phar') do
      its(:stdout) { should match "/usr/bin/composer.phar" }
    end
  end
  
  def os_version
    command("/bin/cat /etc/redhat-release").stdout
  end
end
