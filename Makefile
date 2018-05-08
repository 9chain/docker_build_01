include rules.mk
TARGET_NBCAPID=$(TARGET_DIR)/nbcapid
TARGET_GOSDKSRVD=$(TARGET_DIR)/gosdksrvd

all: nbcapi gosdksrv
install: nbcapi-install gosdksrv-install 
image: gosdksrv-image nbcapi-image
push: gosdksrv-push nbcapi-push 

nbcapi: 
	cd gopath/src/gitlab.com/tenbayblockchain/nbcapid && go install 

gosdksrv: 
	cd gopath/src/gitlab.com/tenbayblockchain/gosdksrvd && go install 

nbcapi-install:
	if [ -e $(TARGET_NBCAPID) ]; then rm -rf $(TARGET_NBCAPID); fi 
	mkdir -p $(TARGET_NBCAPID)/
	cp gopath/bin/nbcapid $(TARGET_NBCAPID)/
	cd gopath/src/gitlab.com/tenbayblockchain/nbcapid && cp cfg docker/* $(TARGET_NBCAPID)/ -r

gosdksrv-install:
	if [ -e $(TARGET_GOSDKSRVD) ]; then rm -rf $(TARGET_GOSDKSRVD); fi 
	mkdir -p $(TARGET_GOSDKSRVD)
	cp gopath/bin/gosdksrvd $(TARGET_GOSDKSRVD)
	cd gopath/src/gitlab.com/tenbayblockchain/gosdksrvd && cp cfg docker/* $(TARGET_GOSDKSRVD)/ -r

gosdksrv-image:
	cd $(TARGET_GOSDKSRVD) && docker build . -t $(REGISTRY)/gosdksrvd:$(TAG_VERSION)

nbcapi-image:
	cd $(TARGET_NBCAPID) && docker build . -t $(REGISTRY)/nbcapid:$(TAG_VERSION)

gosdksrv-push:
	docker push $(REGISTRY)/gosdksrvd:$(TAG_VERSION)
nbcapi-push:
	docker push $(REGISTRY)/nbcapid:$(TAG_VERSION)