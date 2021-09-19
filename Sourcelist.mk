###################################################################################################
######### Source list
###################################################################################################

-include src/core/Sourcelist.mk

###################################################################################################
######### STM32 HAL sourcefiles
###################################################################################################

SRCS += stm32h7xx_hal_driver/Src/stm32h7xx_hal.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_cortex.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_gpio.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_pwr_ex.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_rcc.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_rtc_ex.c \
	stm32h7xx_hal_driver/Src/stm32h7xx_hal_rtc.c