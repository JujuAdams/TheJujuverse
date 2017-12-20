/*
	Installing a service:
	1. Import all scripts and objects relevant for the service
	2. Set up a SERVICE_ON macro in master_config()
	3. Execute service_init() in master_init()
	4. Execute service_start_service() in master_start_services()
	5. Run the project; check the compile output for initialisation and instantiation of the service
	
	
	
	Services must...
	1. be toggleable with a unique SERVICE_ON macro
	2. have service_init() and service_start_service() scripts
	3. report when service_init() and service_start_service() scripts are run
	4. report if service_init() sets defaults values even when SERVICE_ON is set to <false>
	5. use distinct prefixed scripts and objects throughout
	6. use distinct macros defined in service_config() and service_definitions()
	7. section off non-customisable macros in service_definitions()
*/