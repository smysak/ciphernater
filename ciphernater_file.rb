def get_string
    puts "Enter the message to be enciphered:"
    puts "(When finished, enter Ctrl+D on a new line. Use Ctrl+Z on Windows.)"
    string = ARGF.read
end

def get_shift
    puts ""
    puts "Enter the desired shift:"
    shift_amount = gets.strip
    if shift_amount.match?(/\A-?[0-9]+\z/)
        shift_amount = shift_amount.to_i % 26
    else
        puts "Enter a number only, please."
        exit(1)
    end
    shift_amount
end


def ciphernate(string, shift_amount)
    puts ""
    output = []

    string.each_char do |char|
        if char.match?(/\A[A-Za-z]+\z/)
            shifted_char = ((char.downcase.ord + shift_amount - 19) % 26 + 97).chr
            if char == char.upcase
                output << shifted_char.upcase
            else
                output << shifted_char
            end 
        else
            output << char
        end
    end
    puts ""
    encrypted_message = output.join
    File.write("enciphernated_message.txt", encrypted_message)
    puts "Your message has been saved to 'enciphernated_message.txt'."
end

ciphernate(get_string, get_shift)