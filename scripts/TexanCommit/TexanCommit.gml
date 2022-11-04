/// Flushes and fetches texture groups (as directed by calling texan_flush() / texan_fetch() etc.)
/// The fetch and flush queues are cleared at the end of this function

function TexanCommit()
{
    while(!TexanCommitStep()) {}
}

function TexanYeehaw()
{
    TexanCommit();
}