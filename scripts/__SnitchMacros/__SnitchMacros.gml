// Feather disable all
// Log4j - https://logging.apache.org/log4j/2.x/manual/layouts.html

#macro SNITCH_VERSION               "4.3.0"
#macro SNITCH_DATE                  "2023-08-09"
#macro SNITCH_OS_NAME               (__SnitchState().__OSName)
#macro SNITCH_OS_VERSION            (__SnitchState().__OSVersion)
#macro SNITCH_ENVIRONMENT_NAME      (__SnitchState().__EnvironmentName)
#macro SNITCH_BROWSER               (__SnitchState().__Browser)
#macro SNITCH_OS_INFO               (__SnitchState().__OSInfo)
#macro SNITCH_BOOT_PARAMETERS       (__SnitchState().__BootParameters)
#macro SNITCH_SESSION_ID            (__SnitchState().__SessionID)
#macro SNITCH_RUNNING_FROM_IDE      (__SnitchState().__RunningFromIDE)
#macro SNITCH_SESSION_START_TIME    (__SnitchState().__SessionBootTime)
#macro SNITCH_FRAMES                (__SnitchState().__Frames)
#macro SNITCH_FOCUS_FRAMES          (__SnitchState().__FocusFrames)
#macro SNITCH_SESSION_TIME          (current_time - __SnitchState().__SessionStartTime)
#macro SNITCH_FOCUS_TIME            (__SnitchState().__FocusTime)
#macro SNITCH_GA_PLATFORM           (__SnitchState().__GAPlatform)
#macro SNITCH_GA_OS_VERSION         (__SnitchState().__GAOSVersion)
#macro SNITCH_GA_GAMEMAKER_VERSION  (__SnitchState().__GAGameMakerVersion)

#macro __SNITCH_HTTP_TEST_TIMEOUT  5000
