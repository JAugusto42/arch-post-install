#!/usr/bin/env ruby

def tools
  puts `clear`
  puts <<-EOT
  --------------------------
  --- Select extra tools ---
  --------------------------
  1 - Docker
  2 - Compactação de arquivos # TODO  Colocar em ingles hue
    0 - Back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy docker`
  else
    puts `clear`
    puts 'Wrong input! Try again'
    sleep 1
    return tools
  end
end

def fonts
  puts `clear`
  # TODO
  puts <<-EOT

EOT
end

def communication
  puts `clear`
  puts <<-EOT
  -----------------------------------
  --- Select tools to communicate ---
  -----------------------------------
  1 - Telegram-desktop
  2 - slack-desktop
    0 - back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy telegram-desktop`
    return communication
  when 2
    return communication
  else
    puts `clear`
    puts 'Wrong input! Try Again...'
    sleep 1
    return communication
  end
end

def text_editor
  puts `clear`
  puts <<-EOT
  --------------------------
  --- Select text editor ---
  --------------------------
  1 - Mousepad
  2 - leafpad
    0 - back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy mousepad`
    return text_editor
  when 2
    puts `sudo pacman -Sy leafpad`
    return text_editor
  else
    puts `clear`
    puts 'Wrong Input! Try again..'
    sleep 1
    return text_editor
  end
end

def office
  puts `clear`
  puts <<-EOT
  ---------------------------
  --- Select office tools ---
  ---------------------------
  1 - LibreOffice
    0 - Back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy libreoffice-fresh-pt-br`
    return office
  else
    puts `clear`
    puts 'Wrong Input! Try again..'
    sleep 1
    return office
  end
end

def development
  puts `clear`
  puts <<-EOT
  -------------------------------
  --- Select develpment tools ---
  -------------------------------
  1 - atom
  2 - visual studio code
  3 - sublime text 3
  4 - gvim
    0 - Back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy atom`
    return development
  when 2
    return development
  when 3
    return development
  when 4
    puts `sudo pacman -Sy gvim`
  else
    puts `clear`
    puts 'Wrong Input! Try again...'
    sleep 1
    return development
  end
end

def terminals
  puts `clear`
  puts <<-EOT
  -------------------------
  --- Select a terminal ---
  -------------------------
  1 - Terminator
  2 - Tilix
  3 - Termite
    0 - Back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy terminator`
    return terminals
  when 2
    puts `sudo pacman -Sy tilix`
    return terminals
  when 3
    puts `sudo pacman -Sy termite`
  else
    puts `clear`
    puts 'Wrong Input! Try again..'
    sleep 1
    return terminals
  end
end

def browser
  puts `clear`
  puts <<-EOT
  -------------------------
  --- Select a Browser  ---
  -------------------------
  1 - Firefox
  2 - Google Chrome (AUR)
  3 - Opera
    0 - back
EOT

  input = gets.chomp.to_i

  case input
  when 0
    return main
  when 1
    puts `sudo pacman -Sy firefox`
    return browser
  when 2
    # TODO using aur helper
    return browser
  when 3
    puts `sudo pacman -Sy opera`
    return browser
  else
    puts `clear`
    puts 'Wrong Input! Try again...'
    sleep 1
    return browser
  end
end

def main
  puts `clear`
  puts <<-EOT
  -------------------------------
  --- Arch Linux Post Install ---
  -------------------------------
  1 - Browsers
  2 - Terminals
  3 - Development
  4 - Office
  5 - Text Editors
  6 - Communication
  7 - Fonts
  8 - Tools

    0 - Exit

EOT

  input = gets.chomp.to_i

  case input
  when 0
    puts `clear`
    exit 0
  when 1
    browser
  when 2
    terminals
  when 3
    development
  when 4
    office
  when 5
    text_editor
  when 6
    communication
  when 7
    fonts
  when 8
    tools
  else
    puts `clear`
    puts 'Wrong input! Try again...'
    sleep 1
    main
  end
end

main
