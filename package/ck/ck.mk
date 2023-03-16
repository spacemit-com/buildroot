################################################################################
#
# concurrencykit
#
################################################################################

CK_VERSION=50299b7e5f28ccaae7d1960e26c4ded5ea9abbfe
CK_SITE=https://github.com/concurrencykit/ck
CK_SITE_METHOD=git

CK_CONF_OPTS = \
	--platform=riscv64

define CK_CONFIGURE_CMDS
	(cd $(@D); CC="riscv64-unknown-linux-gnu-gcc" ./configure $(CK_CONF_OPTS))
endef

$(eval $(autotools-package))