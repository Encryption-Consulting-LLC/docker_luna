Client_Name='DockerLunaDemo'
MIN_CLIENT_DIR=/root/luna-docker/LunaClient-Minimal-10.2.0-111.x86_64
$MIN_CLIENT_DIR/bin/64/configurator setValue -s Chrystoki2 -e LibUNIX -v $MIN_CLIENT_DIR/libs/64/libCryptoki2.so
$MIN_CLIENT_DIR/bin/64/configurator setValue -s Chrystoki2 -e LibUNIX64 -v $MIN_CLIENT_DIR/libs/64/libCryptoki2_64.so
$MIN_CLIENT_DIR/bin/64/configurator setValue -s Misc -e ToolsDir -v $MIN_CLIENT_DIR/bin/64
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "LunaSA Client" -e SSLConfigFile -v $MIN_CLIENT_DIR/openssl.cnf
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "LunaSA Client" -e ClientPrivKeyFile -v $HOME/luna-docker/config/certs/dockerlunaclientKey.pem
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "LunaSA Client" -e ClientCertFile -v $HOME/luna-docker/config/certs/dockerlunaclient.pem
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "LunaSA Client" -e ServerCAFile -v $HOME/luna-docker/config/certs/CAFile.pem
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "Secure Trusted Channel" -e ClientTokenLib -v $MIN_CLIENT_DIR/libs/64/libSoftToken.so
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "Secure Trusted Channel" -e SoftTokenDir -v $HOME/luna-docker/config/stc/token
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "Secure Trusted Channel" -e ClientIdentitiesDir -v $HOME/luna-docker/config/stc/client_identities
$MIN_CLIENT_DIR/bin/64/configurator setValue -s "Secure Trusted Channel" -e PartitionIdentitiesDir -v $HOME/luna-docker/config/stc/partition_identities
$MIN_CLIENT_DIR/bin/64/vtl createCert -n $Client_Name
scp $HOME/luna-docker/config/certs/$Client_Name.pem elabhsm1par72usr@lunahsm1.thaleselab.com:
scp elabhsm1par72usr@lunahsm1.thaleselab.com:server.pem $HOME/luna-docker/config/certs
$MIN_CLIENT_DIR/bin/64/vtl addServer -c $HOME/luna-docker/config/certs/server.pem -n lunahsm1.thaleselab.com
