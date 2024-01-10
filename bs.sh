
#!/bin/bash

# welcome message
echo "Welcome to the registration system"

# user input
read -p "Please enter your username: " username
read -p "Please enter your password: " email

# registration message
echo "User $username has been registered with email $email"

# file creation option
read -p "Would you like to create a new file? (y/n): " create_file

# create file if chosen
if [ $create_file = "y" ]; then
  read -p "Enter the name of the file: " file_name

  # user input for file content
  echo "Please enter the content of the file. Press Ctrl+D when you're done."
  cat > $file_name
  echo "File $file_name has been created"

  # backup creation option
  read -p "Would you like to create a backup of the file? (y/n): " create_backup

  # create backup if chosen
  if [ $create_backup = "y" ]; then
    cat $file_name >> $file_name.backup
    echo "Backup of $file_name has been created as $file_name.backup"
  fi

  # file conversion option
  read -p "Would you like to convert the file to a different format? (y/n): " convert_file

  # convert file if chosen
  if [ $convert_file = "y" ]; then
    read -p "Enter the format you would like to convert to (e.g. doc, pdf, etc.): " convert_format
    mv $file_name $file_name.$convert_format
    echo "$file_name has been converted to $file_name.$convert_format"
  fi
fi
