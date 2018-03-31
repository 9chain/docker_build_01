include rules.mk

all: nbcapi sdksrv
install: nbcapi-install sdksrv-install 
	cp -r docker/* $(TARGET_DIR)
image: apisrv-image

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

apisrv-image:
	cd $(TARGET_DIR) && docker build . -t $(REGISTRY)/apisrv:$(TAG_VERSION)
	