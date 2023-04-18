#!/bin/bash

openssl base64 -in "$YYprojectDir/notes/__VinylConfig/__VinylConfig.txt" | tr -d '\n' > "$YYprojectDir/datafiles/vinyl.dat"

exit 0
