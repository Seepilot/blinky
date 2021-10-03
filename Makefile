#############################################################################################################
######### Main Makefile with Targets and Rules to build the project
#############################################################################################################

-include Conf.mk

###################################################################################################
######### Object files
###################################################################################################

OBJS := $(SRCS:.c=.o)
OBJS += $(STARTUP:.s=.o)
OBJS := $(addprefix $(OUTPUT_DIR)/,$(OBJS))

###################################################################################################
######### Rules and Targets
###################################################################################################

.SECONDEXPANSION:

all: $(OUTPUT_DIR)/$(PROJECT).bin

$(OUTPUT_DIR)/%.o: %.s $$(@D)/.f
	$(CC) $< $(CPU) $(STD) $(DBG_LVL) $(DEFINES) -c $(INC_DIRS) $(OPTIMIZE) $(CFLAGS) $(ARCH_FLAGS) -o "$@"

$(OUTPUT_DIR)/%.o: %.c $$(@D)/.f
	$(CC) $< $(CPU) $(STD) $(DBG_LVL) $(DEFINES) -c $(INC_DIRS) $(OPTIMIZE) $(CFLAGS) $(ARCH_FLAGS) -o "$@"

$(OUTPUT_DIR)/$(PROJECT).bin: $(OUTPUT_DIR)/$(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

$(OUTPUT_DIR)/$(PROJECT).elf: $(OBJS)
	$(CC) -o $@ $^ $(INC_DIRS) $(CPU) $(LINKER) $(LFLAGS) $(USE_CMATH) $(ARCH_FLAGS) 

clean: 
	rm -fr $(OUTPUT_DIR)

print_objects: 
	@echo $(OBJS)

print_includes:
	@echo $(INC_DIRS)

flash: $(OUTPUT_DIR)/$(PROJECT).bin
	st-flash --reset write $(OUTPUT_DIR)/$(PROJECT).bin 0x08000000

%/.f:
	mkdir -p $(dir $@)
	touch $@

.PRECIOUS: %/.f