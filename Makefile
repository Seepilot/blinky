-include Conf.mk
-include Sourcelist.mk

STARTUP := startup/startup.s
LINKER := ldscript/linker.ld

LFLAGS+= -T $(LINKER)

#############################################################################################################
######### Defines
#############################################################################################################

DEFINES := STM32H7\
	STM32H743xx\
	USE_HAL_DRIVER\
	__STARTUP_CLEAR_BSS\
	__START=main\
	DEBUG
DEFINES := $(addprefix -D ,$(DEFINES))

OBJDIR := $(if $(filter DEBUG,$(DEFINES)),debug,release)

OBJS := $(SRC:.c=.o)
OBJS += $(STARTUP:.s=.o)
OBJS := $(addprefix $(OBJDIR)/,$(OBJS))

###################################################################################################
######### Include directories
###################################################################################################
INC_DIRS := src/inc \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Inc \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Inc/Legacy \
	$(STM32_CUBE_DIR)/CMSIS/Include \
	$(STM32_CUBE_DIR)/CMSIS/Device/ST/STM32H7xx/Include \
	$(STM32_CUBE_DIR)/CMSIS/Core/Include

CFLAGS += $(addprefix -I ,$(INC_DIRS))

.SECONDEXPANSION:

all: $(OBJDIR)/$(PROJECT).bin

$(OBJDIR)/%.o: %.s $$(@D)/.f
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJDIR)/%.o: %.c $$(@D)/.f
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJDIR)/$(PROJECT).bin: $(OBJDIR)/$(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

$(OBJDIR)/$(PROJECT).elf: $(OBJS)
	$(CC) $(LFLAGS) $^ $(CFLAGS) -o $@
	
clean: 
	rm -fr debug release

print: $(OBJS)
	@echo $^

%/.f:
	mkdir -p $(dir $@)
	touch $@

.PRECIOUS: %/.f