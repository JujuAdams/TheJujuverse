/*
	Installing a service:
	1. Import/Create all scripts and objects relevant for the service
	2. Set up a SERVICE_ON macro in master_config()
	3. Execute service_init() in master_init()
	4. Execute service_start_service() in master_start_services()
	5. Run the project; check the compile output for initialisation and instantiation of the service
	
	
	
	Services must...
	1. be toggleable with a unique SERVICE_ON macro
	2. have service_init() and service_start_service() scripts
	3. report when its service_init() script is run
	4. report when service_start_service() is run if service_start_service() executes any code
	5. report if service_init() sets default values even when SERVICE_ON is set to <false>
	6. use distinct prefixed scripts and objects throughout
	7. use distinct macros defined in service_config() and service_definitions()
	8. section off non-customisable internal macros in service_definitions()
	9. if using User Events, have a configuration for which User Event(s) to execute
*/