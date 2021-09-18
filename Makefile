-include Conf.mk
-include Sourcelist.mk

STARTUP := startup/startup.s
LINKER := ldscript/linker.ld

LFLAGS += -T $(LINKER)

#############################################################################################################
######### Defines
#############################################################################################################

DEFINES := STM32H7\
	STM32H743xx\
	USE_HAL_DRIVER\
	__STARTUP_CLEAR_BSS\
	__START=main

CFLAGS += $(addprefix -D ,$(DEFINES))

###################################################################################################
######### Include directories
###################################################################################################
INC_DIRS := src/inc \
	stm32h7xx_hal_driver/Inc \
	stm32h7xx_hal_driver/Inc/Legacy \
	cmsis_device_h7/Include \
	CMSIS_5/CMSIS/Core/Include

CFLAGS += $(addprefix -I ,$(INC_DIRS))

###################################################################################################
######### Object files
###################################################################################################

OBJS := $(SRC:.c=.o)
OBJS += $(STARTUP:.s=.o)
OBJS := $(addprefix $(OUTPUT_DIR)/,$(OBJS))

.SECONDEXPANSION:

all: $(OUTPUT_DIR)/$(PROJECT).bin

$(OUTPUT_DIR)/%.o: %.s $$(@D)/.f
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUTPUT_DIR)/%.o: %.c $$(@D)/.f
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUTPUT_DIR)/$(PROJECT).bin: $(OUTPUT_DIR)/$(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

$(OUTPUT_DIR)/$(PROJECT).elf: $(OBJS)
	$(CC) $(LFLAGS) $^ $(CFLAGS) -o $@
	
clean: 
	rm -fr $(OUTPUT_DIR)

print: 
	@echo $(CFLAGS)

%/.f:
	mkdir -p $(dir $@)
	touch $@

.PRECIOUS: %/.f