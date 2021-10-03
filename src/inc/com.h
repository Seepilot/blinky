/**
  ******************************************************************************
  * @file    src/inc/com.h
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __COM_H
#define __COM_H

void COM_Init(void);

 #endif /* __COM_H */