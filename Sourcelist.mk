###################################################################################################
######### Source list
###################################################################################################

-include src/core/Sourcelist.mk

###################################################################################################
######### STM32 HAL sourcefiles
###################################################################################################

SRCS += system/stm32h7xx_hal_driver/Src/stm32h7xx_hal.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_cortex.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_gpio.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_pwr_ex.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_rcc.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_rtc_ex.c \
	system/stm32h7xx_hal_driver/Src/stm32h7xx_hal_rtc.c