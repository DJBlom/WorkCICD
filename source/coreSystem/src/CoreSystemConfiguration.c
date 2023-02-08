/*******************************************************************************
 * Contents: Implementation of the core systems getters and setters used to
 * relay data upon initialization.
 * Author: Dawid Blom.
 * Date: January 25, 2023.
 *
 * NOTE: CoreSystemMembers are used in all the core system files,
 * A.K.A CoreSystem, CoreSystemConfiguration, CoresystemServices, and
 * CoreSystemWatchdog.
 *******************************************************************************/
#include <CoreSystemConfiguration.h>


struct CoreSystemMembers
{
	uint16_t* watchdog;
	TaskHandle_t* serviceHandle[NUMBER_OF_SERVICES];
	SemaphoreHandle_t serviceSemaphore[NUMBER_OF_SERVICES];
	SemaphoreHandle_t watchdogMutex;
};


struct CoreSystemMembers coreSystemMembers;
static uint8_t serviceHandleIndex = 0;
static uint8_t serviceSemaphoreIndex = 0;





bool SetWatchdog(uint16_t value)
{
	bool success = false;
	if ((*coreSystemMembers.watchdog = value))
	{
		success = true;
	}

	return success;
}


uint16_t* GetWatchdog()
{
	return coreSystemMembers.watchdog;
}


bool SetServiceHandle(TaskHandle_t serviceHandle)
{
	bool success = false;
	if ((*coreSystemMembers.serviceHandle[serviceHandleIndex] = serviceHandle))
	{
		serviceHandleIndex++;
		success = true;
	}

	return success;
}


TaskHandle_t* GetServiceHandle(uint8_t serviceNumber)
{
	return coreSystemMembers.serviceHandle[serviceNumber];
}


bool SetServiceSemaphore(SemaphoreHandle_t serviceSemaphore)
{
	bool success = false;
	if ((coreSystemMembers.serviceSemaphore[serviceSemaphoreIndex] = serviceSemaphore))
	{
		serviceSemaphoreIndex++;
		success = true;
	}

	return success;
}


SemaphoreHandle_t GetServiceSemaphore(uint8_t serviceNumber)
{
	return coreSystemMembers.serviceSemaphore[serviceNumber];
}


bool SetWatchdogMutex(SemaphoreHandle_t watchdogMutex)
{
	bool success = false;
	if ((coreSystemMembers.watchdogMutex = watchdogMutex))
	{
		success = true;
	}

	return success;
}


SemaphoreHandle_t GetWatchdogMutex()
{
	return coreSystemMembers.watchdogMutex;
}







