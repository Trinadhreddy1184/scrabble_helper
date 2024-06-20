echo "Welcome to the Scrabble Helper!"
echo "Which version would you like to run?"
echo "1) Ruby Version"
echo "2) Elixir Version"

read -p "Enter a version (1 or 2): " selection

if [ "$selection" == "1" ]; then
  echo "Running Ruby version..."
  ruby bin/ruby_ver.rb
elif [ "$selection" == "2" ]; then
  echo "Running Elixir version..."
  elixir bin/elixir_ver.exs
else
  echo "Invalid choice. Please enter 1 or 2."
fi