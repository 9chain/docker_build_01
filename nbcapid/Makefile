include rules.mk 
TARGET_DIR=$(INSTALL_DIR)/nbcapid

all: nbcapid 

nbcapid: 
	make -C src/github.com/9chain/nbcapid

install:
	rm -rf $(TARGET_DIR)
	mkdir -p $(TARGET_DIR)
	cp bin/nbcapid $(TARGET_DIR)/
	cp -r src/github.com/9chain/nbcapid/cfg $(TARGET_DIR)/