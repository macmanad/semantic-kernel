set -ex

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SOURCE="https://nuget.bigtincan.net/v3/index.json"


CONFIG=Debug
SLN=.
APIKEY=""

OUTDIR=$SCRIPT_DIR/src/SemanticKernel.Abstractions/bin/$CONFIG
rm -f "$OUTDIR/*.nupkg"
dotnet pack "$SCRIPT_DIR/src/SemanticKernel.Abstractions/SemanticKernel.Abstractions.csproj" --configuration $CONFIG --include-symbols --include-source
dotnet nuget push -s "${SOURCE}" $OUTDIR/*.nupkg --skip-duplicate ${APIKEY}

OUTDIR=$SCRIPT_DIR/src/SemanticKernel.Core/bin/$CONFIG
rm -f "$OUTDIR/*.nupkg"
dotnet pack "$SCRIPT_DIR/src/SemanticKernel.Core/SemanticKernel.Core.csproj" --configuration $CONFIG --include-symbols --include-source
dotnet nuget push -s "${SOURCE}" $OUTDIR/*.nupkg --skip-duplicate ${APIKEY}

OUTDIR=$SCRIPT_DIR/src/Connectors/Connectors.OpenAI/bin/$CONFIG
rm -f "$OUTDIR/*.nupkg"
dotnet pack "$SCRIPT_DIR/src/Connectors/Connectors.OpenAI/Connectors.OpenAI.csproj" --configuration $CONFIG --include-symbols --include-source
dotnet nuget push -s "${SOURCE}" $OUTDIR/*.nupkg --skip-duplicate ${APIKEY}
