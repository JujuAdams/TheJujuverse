/*
    We do not include "mouse" or "sensitivity" as these are handled differently (and presumed common to all games)
*/
ds_list_add( global.control_master_list, "strafe left"  );
ds_list_add( global.control_master_list, "strafe right" );
ds_list_add( global.control_master_list, "forwards"     );
ds_list_add( global.control_master_list, "backwards"    );
ds_list_add( global.control_master_list, "ascend"       );
ds_list_add( global.control_master_list, "descend"      );
ds_list_add( global.control_master_list, "back"         );