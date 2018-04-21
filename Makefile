include rules.mk

all: nbcapi sdksrv

install: nbcapi-install sdksrv-install 

image: sdksrv-image apisrv-image

nbcapi: 
	make -C nbcapid
sdksrv: 
	make -C sdksrvd/sdksrvd

nbcapi-install:
	mkdir -p $(TARGET_DIR)
	make -C nbcapid install INSTALL_DIR=$(TARGET_DIR)

sdksrv-install:
	mkdir -p $(TARGET_DIR)
	make -C sdksrvd/sdksrvd install INSTALL_DIR=$(TARGET_DIR)

# apisrv-image:
# 	cd $(TARGET_DIR) && docker build . -t $(REGISTRY)/apisrv:$(TAG_VERSION)

sdksrv-image:
	cp -r docker/sdksrvd/* $(TARGET_DIR)/sdksrvd/
	cd $(TARGET_DIR)/sdksrvd/ && docker build . -t $(REGISTRY)/sdksrvd:$(TAG_VERSION)

apisrv-image:
	cp -r docker/nbcapid/* $(TARGET_DIR)/nbcapid/
	cd $(TARGET_DIR)/nbcapid/ && docker build . -t $(REGISTRY)/nbcapid:$(TAG_VERSION)
