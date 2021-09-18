#############################################################################################################
######### Project infos
#############################################################################################################

PROJECT := blinky
OUTPUT_DIR := output

#############################################################################################################
######### Architecture flags
#############################################################################################################

# Selecting Core
CORTEX_M := 7
# Options for specific architecture. Everthing that start with -m* is a ARM specific option
ARCH_FLAGS := -mcpu=cortex-m$(CORTEX_M) -mfloat-abi=hard -mthumb

#############################################################################################################
######### Compiler & Linker
#############################################################################################################

CC := arm-none-eabi-gcc
CXX := arm-none-eabi-g++
OBJCOPY := arm-none-eabi-objcopy

# Use newlib-nano. In addition to standard C library, newlib-nano also added to the toolchain package.
USE_NANO := --specs=nano.specs

# Use seimhosting or not
USE_SEMIHOST := --specs=rdimon.specs
USE_NOHOST := --specs=nosys.specs

#############################################################################################################
######### Linker options 
############################################################################################################# 

# Link for code size
GC := -Wl,--gc-sections
# Create map file
MAP := -Wl,-Map=$(OUTPUT_DIR)/$(PROJECT).map

LFLAGS := $(USE_NOHOST) $(GC) $(MAP)

# -Wl Pass options to the linker. Test these options!!!!!
    # -Wl,--start-group 
    # -lc -lm 
    # -Wl,--end-group
    #-static
    #-mfpu=fpv5-d16

#############################################################################################################
######### Compiler options
#############################################################################################################

CFLAGS := $(ARCH_FLAGS) $(USE_NANO)\
    -Og\
    -flto\
    -ffunction-sections\
    -fdata-sections\
    -Wall\
    -fno-builtin

CXXFLAGS := $(CFLAGS)

#CFLAGS:= 
    # -std=gnu11
    # -g3
    # --specs=nano.specs
    # -mfpu=fpv5-d16
    # -mfloat-abi=hard -mthumb
    # -O0 
    # -ffunction-sections 
    # -fdata-sections 
    # -Wall 
    # -fstack-usage 
    # -MMD -MP -MF
    # -std=gnu11 
    # -g3

#############################################################################################################
######### Assembler options
#############################################################################################################

#AFLAGS:= -mcpu=cortex-m7 
    #-g3 
    #-x assembler-with-cpp 
    #--specs=nano.specs 
    #-mfpu=fpv5-d16 
    #-mfloat-abi=hard 
    #-mthumb