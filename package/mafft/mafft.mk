################################################################################
#
# MAFFT
#
################################################################################

MAFFT_VERSION = 26ecaba0130b533cf06a29200f0fb40829c00101
MAFFT_SITE = https://github.com/GSLBiotech/mafft
MAFFT_SITE_METHOD = git
MAFFT_LICENSE = BSD
#MAFFT_INSTALL_STAGING = YES
MAFFT_INSTALL_TARGET = YES

define MAFFT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(CFLAGS) $(TARGET_LDFLAGS)" \
		-C $(@D)/core all
endef

define MAFFT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/core/mafft $(TARGET_DIR)/usr/bin
	mkdir $(TARGET_DIR)/usr/bin/binaries/
	mkdir $(TARGET_DIR)/usr/bin/scripts/
	$(INSTALL) -D -m 0755 $(@D)/binaries/* $(TARGET_DIR)/usr/bin/binaries/
	$(INSTALL) -D -m 0755 $(@D)/scripts/* $(TARGET_DIR)/usr/bin/scripts/

endef

$(eval $(generic-package))
