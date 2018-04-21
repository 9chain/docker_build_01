include rules.mk 
TARGET_DIR=$(INSTALL_DIR)/nbcapid/target/

all: nbcapid 

nbcapid: 
	make -C src/gitlab.com/tenbayblockchain/nbcapid

install:
	rm -rf $(TARGET_DIR)
	mkdir -p $(TARGET_DIR)
	cp src/gitlab.com/tenbayblockchain/nbcapid/nbcapid $(TARGET_DIR)/
	cp -r src/gitlab.com/tenbayblockchain/nbcapid/cfg $(TARGET_DIR)/