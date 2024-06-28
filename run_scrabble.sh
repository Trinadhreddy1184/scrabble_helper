echo "Welcome to the Scrabble Helper!"
echo "Which version would you like to run?"
echo "1) Ruby Version"
echo "2) Elixir Version"
echo "3) Python Version"

read -p "Enter a version (1 or 2 or 3): " selection

if [ "$selection" == "1" ]; then
  echo "Running Ruby version..."
  ruby bin/ruby_ver.rb
elif [ "$selection" == "2" ]; then
  echo "Running Elixir version..."
  elixir bin/elixir_ver.exs
elif [ "$selection" == "3" ]; then
  echo "Running Python version..."
  pyhton bin/python_ver.py  
else
  echo "Invalid choice. Please enter 1 or 2 or 3."
fi
