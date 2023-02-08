/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/* FreeRTOS kernel includes. */
/* Freescale includes. */
#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"

#include "CoreSystem.h"
#include "CoreSystemServices.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/

int main(void)
{
    char a[10];
    a[10] = 0;

    /* Init board hardware. */
    BOARD_ConfigMPU();
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    if (CoreSystemInitialization() == false)
    {
    	PRINTF("\n\n\r Failed To Initialize The System");
    }
    else
    {
    	if (CreateSystemServices() == false)
        {
        	PRINTF("\n\n\r Failed To Create System Services");
        }
        else
        {
        	vTaskStartScheduler();
        }
    }

    return 0;
}

