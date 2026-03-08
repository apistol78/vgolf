#!/bin/bash

# Get normalized path to game home, excluding file name.
GAME_HOME="`dirname \"$BASH_SOURCE\"`/.."
GAME_HOME="`(cd \"$GAME_HOME\" && pwd)`"
export GAME_HOME

# Setup traktor home.
. "$GAME_HOME/../traktor/scripts/config.sh"

pushd $GAME_HOME

if [[ "$1" == "Linux" ]]; then
	"$TRAKTOR_HOME/bin/latest/linux/releaseshared/Traktor.Editor.Build.App" VolleyGolf.workspace -standalone -verbose -force -avalanche-cache=pn-tambor-ws.pistol.one
	STATUS=$?
elif [[ "$1" == "macOS" ]]; then
	"$TRAKTOR_HOME/bin/latest/osx/releaseshared/Traktor.Editor.Build.App" VolleyGolf.workspace -standalone -verbose -force -avalanche-cache=pn-tambor-ws.pistol.one
	STATUS=$?
fi

popd
exit $STATUS
