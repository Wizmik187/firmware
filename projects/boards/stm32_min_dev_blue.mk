# SPDX-License-Identifier: Apache-2.0

PORT_ROOT := ports/stm32
INCS += $(PORT_ROOT)

include projects/arch/cm3.mk
include $(PORT_ROOT)/f1/$(BOARD).mk

.PHONY: flash erase gdbserver
flash: $(OUTHEX)
	pyocd flash -t stm32f103c8 $<
erase:
	pyocd erase -t $(PROJECT) --chip
gdbserver:
	$(Q)pyocd $@ -t stm32f103c8
	#pyocd pack install stm32f103c8
