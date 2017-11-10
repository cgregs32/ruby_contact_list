def program

  contact_list = [{name: "chris", email: "ariel@gmail.com", phone: "5567892342"}, {name: "ariel", email: "chris@gmail.com", phone: "9999999999"}]

  display_nav
  input = gets.chomp.to_i

  while input != 5

    case input
      when 1
        if contact_list.length === 0
          puts "You have no contacts!"
        else
          display_contacts(contact_list)
        end
        display_nav()
        input = gets.chomp.to_i
      when 2
        create_new_contact(contact_list)
        display_nav()
        input = gets.chomp.to_i
      when 3
        remove_contact_list(contact_list)
        display_nav()
        input = gets.chomp.to_i
      when 4
        update_contact_list(contact_list)
        display_nav()
        input = gets.chomp.to_i
      else
        puts "Please enter a valid option"
        display_nav()
        input = gets.chomp.to_i
    end
  end

exit

end

def create_new_contact(contact_list)
  contact_hash = {}
  puts "What is the contact name?"
  contact_name = gets.chomp
  contact_hash[:name] = contact_name

  puts "What is #{contact_name}'s email?"
  email = gets.chomp
  contact_hash[:email] = email

  puts "What is #{contact_name}'s phone number?"
  phone = gets.chomp
  contact_hash[:phone] = phone

  puts "You have added #{contact_name} to contact list"
  contact_list << contact_hash
end

def remove_contact_list(contact_list)

  if contact_list.length === 0
    puts "You have no contacts!"
  else
    puts "What contact do you want to remove?"
    remove_name = gets.chomp
    contact_list.each do |i|
      if i.has_value?(remove_name)
        contact_list.delete_if {|val| val[:name] === remove_name}
        puts "You have removed #{remove_name}"
      else
        puts "That is not an active contact"
      end
    end
  end

end

def update_contact_list(contact_list)

  if contact_list.length === 0
    puts "You have no contacts!"

  else
    puts "Name the contact you want to update"
    update_contact = gets.chomp

    contact_list.each do |val|

      if val.has_value?(update_contact)

        puts "What do you want to change?"
        puts "1) Name"
        puts "2) Email"
        puts "3) Phone Number"

        update = gets.chomp.to_i

        case update
          when 1
            puts "What is the new name?"
            new_name = gets.chomp
            val[:name] = new_name
          when 2
            puts "What is the new Email?"
            new_email = gets.chomp
            val[:email] = new_email
          when 3
            puts "What is the new Phone Number?"
            new_number = gets.chomp
            val[:number] = new_number
        end

        puts "contact updated for #{update_contact}"
        return 0

      else
        puts "That contact does not exist!"
      end

    end
  end
end

def display_contacts(contact_list)
  contact_list.each_with_index do |val, i|
    puts "Contact: #{i + 1}"
    puts "================"
    puts "#{val[:name]}"
    puts "#{val[:email]}"
    puts "#{val[:phone]}"
  end
end

def display_nav
  puts "--Contact List--"
  puts "1) View All Contacts"
  puts "2) Add A Contact"
  puts "3) Remove Contact"
  puts "4) Update Contact"
  puts "5) Exit"

end

program
