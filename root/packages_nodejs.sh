# tmp fix for: https://bugzilla.redhat.com/show_bug.cgi?id=1481470
rpm -i http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/http-parser-2.7.1-3.sdl7.x86_64.rpm

# install nodejs
yum -y install npm; yum clean all

# install node modules (globally)
npm install -g uglify-js@2.3.6
npm install -g uglifycss@0.0.10
npm install -g less@1.7.5
npm install grunt
