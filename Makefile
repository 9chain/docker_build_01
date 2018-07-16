include rules.mk
TARGET_NBCAPID=$(TARGET_DIR)/nbcapid
TARGET_GOSDKSRVD=$(TARGET_DIR)/gosdksrvd
TARGET_EXPLORER=$(TARGET_DIR)/explorer

all: nbcapi gosdksrv
install: nbcapi-install gosdksrv-install 
image: gosdksrv-image nbcapi-image
push: gosdksrv-push nbcapi-push 

nbcapi: 
	cd gopath/src/gitlab.com/tenbayblockchain/nbcapid && go install 

gosdksrv: 
	cd gopath/src/gitlab.com/tenbayblockchain/gosdksrvd && go install 

explorer: 
	cd gopath/src/github.com/helloshiki/blockchain-explorer/client && npm run build 

nbcapi-install:
	if [ -e $(TARGET_NBCAPID) ]; then rm -rf $(TARGET_NBCAPID); fi 
	mkdir -p $(TARGET_NBCAPID)/
	cp gopath/bin/nbcapid $(TARGET_NBCAPID)/
	cd gopath/src/gitlab.com/tenbayblockchain/nbcapid && cp cfg docker/* $(TARGET_NBCAPID)/ -r

gosdksrv-install:
	if [ -e $(TARGET_GOSDKSRVD) ]; then rm -rf $(TARGET_GOSDKSRVD); fi 
	mkdir -p $(TARGET_GOSDKSRVD)/files 
	cp gopath/bin/gosdksrvd $(TARGET_GOSDKSRVD)
	cd gopath/src/gitlab.com/tenbayblockchain/gosdksrvd && cp cfg docker/* recover $(TARGET_GOSDKSRVD)/ -r
	cd gopath/src/gitlab.com/tenbayblockchain/gosdksrvd && cp cfg recover $(TARGET_GOSDKSRVD)/files -r

explorer-install:
	if [ -e $(TARGET_EXPLORER) ]; then rm -rf $(TARGET_EXPLORER); fi 
	mkdir -p $(TARGET_EXPLORER)/files/client
	cd gopath/src/github.com/helloshiki/blockchain-explorer && cp -r main.js package.json node_modules  appconfig.json swagger.json app $(TARGET_EXPLORER)/files
	cd gopath/src/github.com/helloshiki/blockchain-explorer && cp -r client/build $(TARGET_EXPLORER)/files/client
	cd gopath/src/github.com/helloshiki/blockchain-explorer && cp docker/* $(TARGET_EXPLORER)
	cp node-v8.11.3-linux-x64.tar.xz $(TARGET_EXPLORER)/

gosdksrv-image:
	cd $(TARGET_GOSDKSRVD) && docker build . -t $(REGISTRY)/gosdksrvd:$(TAG_VERSION)

nbcapi-image:
	cd $(TARGET_NBCAPID) && docker build . -t $(REGISTRY)/nbcapid:$(TAG_VERSION)

gosdksrv-push:
	docker push $(REGISTRY)/gosdksrvd:$(TAG_VERSION)
nbcapi-push:
	docker push $(REGISTRY)/nbcapid:$(TAG_VERSION)