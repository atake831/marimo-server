#/bin/bash
carton exec plackup -r -s FCGI --listen /tmp/rakumeshi.socket app.psgi
