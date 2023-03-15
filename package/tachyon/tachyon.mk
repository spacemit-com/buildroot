################################################################################
#
# TAVHYON
#
################################################################################

TACHYON_VERSION = 4e347495c3d996ed5f68d96a424d481d030843da
TACHYON_SITE = https://gitee.com/spacemit/Tachyon.git
TACHYON_SITE_METHOD=git
TACHYON_INSTALL_STAGING = YES
TACHYON_INSTALL_TARGET = YES
#CPPFLAGS=$(TARGET_CPPFLAGS) -xc++ -lstdc++ -shared-libgcc

CFLAGS += -Wall -O3 -fomit-frame-pointer -ffast-math -DLinux

linux-64-flag = "ARCH = linux-64" \
	"AR = ar" \
	"ARFLAGS = r" \
	"RANLIB = ranlib" \
	"LIBS = -L. -ltachyon $(MISCLIB) -lm"

define TACHYON_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(CFLAGS) $(MISCFLAGS) $(TARGET_LDFLAGS)" \
		-C $(@D)/unix all $(linux-64-flag)

endef

define TACHYON_INSTALL_STAGING_CMDS

endef

define TACHYON_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/compile/linux-64/tachyon $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
