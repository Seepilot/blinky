/**
  ******************************************************************************
  * @file    src/com/com.c 
  * @author  Andreas Ritter
  * @brief   This file provides the initialisation of the USART2 and retargets
  *          the printf() function. After initialisation, it is
  *          possible to send messages with printf() through the USB interface 
  *          of the NUCLEO-H743ZI board to a terminal.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2017 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */

#include "com.h"
#include "stm32h7xx_hal.h"

/* UART handler declaration */
static UART_HandleTypeDef uartHandle = {0};

#ifdef __GNUC__
/* With GCC/RAISONANCE, small printf (option LD Linker->Libraries->Small printf
   set to 'Yes') calls __io_putchar() */
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

/**
  * @brief UART Initialization
  *        This function configures the hardware resources used in this example:
  *           - Peripheral's clock enable
  *           - Peripheral's GPIO Configuration
  * @param None
  * @retval None
  */
void COM_Init(void)
{
  /*##-1- Configure the UART peripheral ######################################*/
  /* Put the USART peripheral in the Asynchronous mode (UART Mode) */
  /* UART configured as follows:
      - Word Length = 8 Bits (7 data bit + 1 parity bit) : 
                      BE CAREFUL : Program 7 data bits + 1 parity bit in PC HyperTerminal
      - Stop Bit    = One Stop bit
      - Parity      = ODD parity
      - BaudRate    = 9600 baud
      - Hardware flow control disabled (RTS and CTS signals) */
  uartHandle.Instance        = USART3;

  uartHandle.Init.BaudRate   = 9600;
  uartHandle.Init.WordLength = UART_WORDLENGTH_8B;
  uartHandle.Init.StopBits   = UART_STOPBITS_1;
  uartHandle.Init.Parity     = UART_PARITY_ODD;
  uartHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
  uartHandle.Init.Mode       = UART_MODE_TX_RX;
  uartHandle.Init.OverSampling = UART_OVERSAMPLING_16;
  uartHandle.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  uartHandle.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  uartHandle.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

  if(HAL_UART_Init(&uartHandle) != HAL_OK)
  {
    /* Initialization Error */
    //Error_Handler();
  }
}

/**
  * @brief UART MSP Initialization
  *        This function configures the hardware resources used in this example:
  *           - Peripheral's clock enable
  *           - Peripheral's GPIO Configuration
  * @param huart: UART handle pointer
  * @retval None
  */
void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
  GPIO_InitTypeDef  GPIO_InitStruct = {0};

  RCC_PeriphCLKInitTypeDef RCC_PeriphClkInit = {0};

  /*##-1- Enable peripherals and GPIO Clocks #################################*/
  /* Enable GPIO TX/RX clock and USART3 clock */
  __HAL_RCC_USART3_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /* Select SysClk as source of USART3 clocks */
  RCC_PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART234578;
  RCC_PeriphClkInit.Usart234578ClockSelection = RCC_USART234578CLKSOURCE_D2PCLK1;
  HAL_RCCEx_PeriphCLKConfig(&RCC_PeriphClkInit);

  /*##-2- Configure peripheral GPIO ##########################################*/
  /* UART TX/RX GPIO pin configuration  */
  GPIO_InitStruct.Pin       = GPIO_PIN_8 | GPIO_PIN_9;
  GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull      = GPIO_PULLUP;
  GPIO_InitStruct.Speed     = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF7_USART3;

  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);
}

/**
  * @brief UART MSP De-Initialization
  *        This function frees the hardware resources used in this example:
  *          - Disable the Peripheral's clock
  *          - Revert GPIO and NVIC configuration to their default state
  * @param None
  * @retval None
  */
void HAL_UART_MspDeInit(UART_HandleTypeDef *huart)
{
  /*##-1- Reset peripherals ##################################################*/
  __HAL_RCC_USART3_FORCE_RESET();
  __HAL_RCC_USART3_RELEASE_RESET();

  /*##-2- Disable peripherals and GPIO Clocks ################################*/
  HAL_GPIO_DeInit(GPIOD, GPIO_PIN_8 | GPIO_PIN_9);
}

/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  None
  * @retval None
  */
PUTCHAR_PROTOTYPE
{
  /* Place your implementation of fputc here */
  /* e.g. write a character to the USART and Loop until the end of transmission */
  HAL_UART_Transmit(&uartHandle, (uint8_t *)&ch, 1, 0xFFFF);

  return ch;
}