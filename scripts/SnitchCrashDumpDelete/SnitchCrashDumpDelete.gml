// Feather disable all
/// Deletes the crash dump from disk, if one exists

function SnitchCrashDumpDelete()
{
    if ((SNITCH_CRASH_DUMP_FILENAME != "") && file_exists(SNITCH_CRASH_DUMP_FILENAME)) file_delete(SNITCH_CRASH_DUMP_FILENAME);
}
