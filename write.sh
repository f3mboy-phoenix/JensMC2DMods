#!/bin/sh

mod="$1"
module="$2"

# 1. Create folder if it doesn't exist
mkdir -p "$mod"

# 2. Create (touch) the module file
touch "$mod/$module"

# 3. Open the module in nano
nano "$mod/$module"

# 4. Append module name to mod/loadorder if not already listed
loadorder="$mod/loadorder"

# Create loadorder file if missing
touch "$loadorder"

# Add module only if not already present
if ! grep -Fxq "$module" "$loadorder"; then
    echo "$module" >> "$loadorder"
fi

# 5. git add everything
git add .
