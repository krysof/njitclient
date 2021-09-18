include $(TOPDIR)/rules.mk

PKG_NAME:=njitclient
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk


define Package/njitclient
	SECTION:=net
	CATEGORY:=Network
	TITLE:=njitclient
	DEPENDS:=+libpcap +libopenssl
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/njitclient/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/njitclient $(1)/bin/
endef

$(eval $(call BuildPackage,njitclient))
