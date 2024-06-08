# Determine architecture
ARCH=$(dpkg --print-architecture)
export ARCH

# Be fancy
source ~/.local/share/omakub/ascii.sh

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git unzip

# Run installers
for script in ~/.local/share/omakub/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Logout to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && sudo shutdown -r now
