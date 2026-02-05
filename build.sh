#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}=== APP BUILD MENU ===${NC}"
echo "1 - Initial Setup"
echo "2 - Build Android"
echo "3 - Build iOS"
echo "4 - Build Android & iOS"
echo "0 - Exit"
read -p "Enter your choice: " choice

case $choice in
  1) bash "$(dirname "$0")/scripts/setup.sh" ;;
  2) bash "$(dirname "$0")/scripts/build_android.sh" ;;
  3) bash "$(dirname "$0")/scripts/build_ios.sh" ;;
  4) bash "$(dirname "$0")/scripts/build_android.sh" && bash "$(dirname "$0")/scripts/build_ios.sh" ;;
  0) echo "👋 Exiting menu."; exit 0 ;;
  *) echo "❌ Invalid choice!" ;;
esac