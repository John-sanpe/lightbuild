# SPDX-License-Identifier: GPL-2.0
# ==========================================================================
# bin rule
# ==========================================================================

########################################
# Always build                         #
########################################

# bin-always-y += foo
# ... is a shorthand for
# bin += foo
# always-y  += foo
bin         += $(bin-always-y)
bin-always  += $(bin-always-y)

bin_dis     += $(bin-always-)

########################################
# Sort files                           #
########################################

bin         := $(sort $(bin))

########################################
# Bin options                          #
########################################

bin-flags-y ?= -O binary

########################################
# Add path                             #
########################################

bin         := $(addprefix $(obj)/,$(bin))
bin-always  := $(addprefix $(obj)/,$(bin-always))
bin_dis     := $(addprefix $(obj)/,$(bin_dis))

########################################
# Always rule                          #
########################################

always-y    += $(bin-always)

########################################
# clean rule                           #
########################################

clean-files += $(bin) $(bin_dis)
