#!/bin/bash

# Prompt for username and password (hidden input for password)
read -p "Enter username for the first user: " user1
read -sp "Enter password for $user1 (password won't be shown): " -r password1

# Validate username length (optional, adjust minimum length as needed)
if [[ ${#user1} -lt 6 ]]; then
  echo "Username must be at least 6 characters long."
  exit 1
fi

# Create the first user with strong password hashing (use a secure algorithm)
sudo useradd -m -p $(mkpasswd <<<"$password1") "$user1"

# Repeat for the second user (replace prompts with desired values)
read -p "Enter username for the second user: " user2
read -sp "Enter password for $user2 (password won't be shown): " -r password2

sudo useradd -m -p $(mkpasswd <<<"$password2") "$user2"

# Informative message
echo "Users '$user1' and '$user2' have been created successfully."

# Optional: Set default shell (if desired)
# sudo chsh -s /bin/bash "$user1"  # Replace /bin/bash with the desired shell
# sudo chsh -s /bin/bash "$user2"
