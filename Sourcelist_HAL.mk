###################################################################################################
######### STM32 HAL sourcefiles
###################################################################################################

# Firmware source files directory for the STM32H743
STM32_CUBE_DIR=~/STM32/STM32CubeH7/Drivers

SRC += $(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr_ex.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rtc.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rtc_ex.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cortex.c \
	$(STM32_CUBE_DIR)/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_gpio.c