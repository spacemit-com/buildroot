################################################################################
#
# cray
#
################################################################################

CRAY_VERSION = 7feeb564668f23582f161376b3aa0f1761655550
CRAY_SITE = https://github.com/vkoskiv/c-ray.git
CRAY_SITE_METHOD = git
CRAY_INSTALL_TARGET = YES

# TODO enable SDL2######

#define CRAY_BUILD_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(CFLAGS) $(TARGET_LDFLAGS)" \
#		-C $(@D) all
#endef


define CRAY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/c-ray $(TARGET_DIR)/usr/bin

endef

#$(eval $(generic-package))
$(eval $(cmake-package))