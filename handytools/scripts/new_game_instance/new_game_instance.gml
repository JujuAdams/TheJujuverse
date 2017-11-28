var _str = "";
_str += "\nset _folder_=%1";
_str += "\nset _file_=\\handytools.win";
_str += "\nC:\\ProgramData\\GameMakerStudio2\\Cache\\runtimes\\runtime-2.1.1.158\\windows\\Runner.exe  -game %_folder_%%_file_%";

string_save( "new_game_instance.bat", _str );

var _func = external_define( "WinDev.dll", "shell_execute" , dll_cdecl, ty_real, 2, ty_string, ty_string );
external_call( _func, game_save_id + "new_game_instance.bat", working_directory );
external_free( "WinDev.dll" );