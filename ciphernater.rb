def get_string
    puts "Enter the message to be enciphered:"
    string = gets.strip
end

def get_shift
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
    string.each_char do |char|
        if char.match?(/\A[A-Za-z]+\z/)
            shifted_char = ((char.downcase.ord + shift_amount - 19) % 26 + 97).chr
            if char == char.upcase
                print shifted_char.upcase
            else
                print shifted_char
            end 
        else
            print char
        end
    end
end

ciphernate(get_string, get_shift)