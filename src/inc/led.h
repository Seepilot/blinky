/**
  ******************************************************************************
  * @file    src/inc/led.h
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LED_H
#define __LED_H

 void led_init(void);
 void green_led_on(void);
 void green_led_off(void);
 void yellow_led_on(void);
 void yellow_led_off(void);
 void red_led_on(void);
 void red_led_off(void);

 #endif /* __LED_H */