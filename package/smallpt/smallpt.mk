################################################################################
#
# smallpt
#
################################################################################

SMALLPT_VERSION = 20f2d8d7369d2e53ec1eb0492a42c648c5480863
SMALLPT_SITE = https://github.com/matt77hias/c-smallpt.git
SMALLPT_SITE_METHOD = git
SMALLPT_INSTALL_TARGET = YES

define SMALLPT_BUILD_CMDS

	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
		-I$(@D)/c-smallpt/c-smallpt/src/ \
		-c $(@D)/c-smallpt/c-smallpt/src/c-smallpt.c \
		-o $(@D)/c-smallpt/c-smallpt/src/smallpt
endef

define SMALLPT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/c-smallpt/c-smallpt/src/smallpt $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
