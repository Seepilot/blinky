#############################################################################################################
######### Build configuration file
#############################################################################################################
######### Project infos
#############################################################################################################

PROJECT := blinky
OUTPUT_DIR := output

#############################################################################################################
######### Target specific options
#############################################################################################################

# Selecting Core
CPU := -mcpu=cortex-m7
# Options for specific architecture. Everthing that start with -m* is a ARM specific option
ARCH_FLAGS := --specs=nano.specs \
    -mfloat-abi=hard \
    -mthumb \
    -mfpu=fpv5-d16 \
    

#############################################################################################################
######### Compiler tools
#############################################################################################################

CC := arm-none-eabi-gcc
CXX := arm-none-eabi-g++
OBJCOPY := arm-none-eabi-objcopy

#############################################################################################################
######### Linker options 
############################################################################################################# 

# Link for code size
GC := -Wl,--gc-sections
# Create map file
MAP := -Wl,-Map=$(OUTPUT_DIR)/$(PROJECT).map

USE_CMATH := -Wl,--start-group -lc -lm -Wl,--end-group

LFLAGS := --specs=nosys.specs \
    $(MAP) \
    $(GC) \
    -static \
    $(USE_CMATH)

#############################################################################################################
######### Compiler options
#############################################################################################################

STD :=-std=gnu11

DBG_LVL := -g3
#Debug level
#Minimial   -g1
#Default    -g
#Maximum    -g3

OPTIMIZE := -Os 
#Optimize 
#None       -O0, 
#For Debug  -Og 
#Normal     -O1
#More       -O2
#Most       -O3
#For size   -Os
#For speed  -Ofast

CFLAGS := -ffunction-sections \
        -fdata-sections \
        -fstack-usage \
        -Wall \
        -Wno-strict-aliasing
        #-fno-builtin

CXXFLAGS := $(CFLAGS)

#############################################################################################################
######### Assembler options
#############################################################################################################

AFLAGS:= $(DBG_LVL) \
    -x assembler-with-cpp

#############################################################################################################
######### Linker and startup file
#############################################################################################################

STARTUP := startup/startup.s
LINKER := -T ldscript/linker.ld

#############################################################################################################
######### Defines
#############################################################################################################

DEFINES := STM32H7\
	STM32H743xx\
	USE_HAL_DRIVER\
	__STARTUP_CLEAR_BSS\
	__START=main

DEFINES := $(addprefix -D ,$(DEFINES))

###################################################################################################
######### Include directories
###################################################################################################

INC_DIRS := src/inc \
	system/stm32h7xx_hal_driver/Inc \
	system/stm32h7xx_hal_driver/Inc/Legacy \
	system/cmsis_device_h7/Include \
	system/CMSIS_5/CMSIS/Core/Include

INC_DIRS := $(addprefix -I ,$(INC_DIRS))

###################################################################################################
######### Inlcude all Sourcelists.mk
###################################################################################################

SRCS :=
-include src/com/Sourcelist.mk
-include src/core/Sourcelist.mk
-include src/Sourcelist.mk
-include system/Sourcelist.mk