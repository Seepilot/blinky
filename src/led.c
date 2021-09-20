/**
  ******************************************************************************
  * @file    src/led.c 
  * @author  Andreas Ritter
  * @brief   LED control of the NUCLEO-H743ZI board.
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

#include "led.h"
#include "stm32h7xx_hal.h"

/**
  * @brief  LED initialization on the NUCLEO-H743ZI board.
  *         PB0     = Green
  *         PE1     = Yellow
  *         PB14    = Red
  * @param  None
  * @retval None
  */
void led_init(void)
{
    GPIO_InitTypeDef GPIO_Init;

    __GPIOB_CLK_ENABLE();
    __GPIOE_CLK_ENABLE();

    GPIO_Init.Pin = GPIO_PIN_0 | GPIO_PIN_14;
    GPIO_Init.Pull = GPIO_NOPULL;
    GPIO_Init.Mode  = GPIO_MODE_OUTPUT_PP;
    GPIO_Init.Speed = GPIO_SPEED_FREQ_LOW;
   
    HAL_GPIO_Init(GPIOB, &GPIO_Init);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_RESET);

    GPIO_Init.Pin = GPIO_PIN_1;
    GPIO_Init.Pull = GPIO_NOPULL;
    GPIO_Init.Mode  = GPIO_MODE_OUTPUT_PP;
    GPIO_Init.Speed = GPIO_SPEED_FREQ_LOW;
   
    HAL_GPIO_Init(GPIOE, &GPIO_Init);
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_0, GPIO_PIN_RESET);
}

/**
  * @brief  Turn green LED on.
  * @param  None
  * @retval None
  */
void green_led_on(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_SET);
}

/**
  * @brief  Turn green LED off.
  * @param  None
  * @retval None
  */
void green_led_off(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_RESET);
}

/**
  * @brief  Turn yellow LED on.
  * @param  None
  * @retval None
  */
void yellow_led_on(void)
{
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_1, GPIO_PIN_SET);
}

/**
  * @brief  Turn yellow LED off.
  * @param  None
  * @retval None
  */
void yellow_led_off(void)
{
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_1, GPIO_PIN_RESET);
}

/**
  * @brief  Turn red LED on.
  * @param  None
  * @retval None
  */
void red_led_on(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
}

/**
  * @brief  Turn red LED off.
  * @param  None
  * @retval None
  */
void red_led_off(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
}