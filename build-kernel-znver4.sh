#!/bin/bash
# build-kernel-znver4.sh - Build automatico kernel cachyos znver4

SPEC="sources/kernel-cachyos-bore/kernel-cachyos.spec"

echo "Checking CachyOS/linux latest tag..."
TAG=$(curl -s https://api.github.com/repos/CachyOS/linux/tags | jq -r '.[0].name')
echo "Latest tag: $TAG"

# Estrai _stablekver dal tag (es: cachyos-7.0-9 -> 9)
STABLEKVER=$(echo "$TAG" | sed 's/.*-\([0-9]\+\)-.*/\1/')
echo "Stable kver: $STABLEKVER"

echo "Building with _stablekver=$STABLEKVER..."
rpmbuild -ba --define "_stablekver $STABLEKVER" --define "_tag $TAG" "$SPEC"

echo "Build complete. RPMS in ~/rpmbuild/RPMS/"
