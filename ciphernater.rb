def get_string
    puts "Enter the message to be enciphered:"
    string = gets.chomp
end

def get_shift
    puts "Enter the desired shift:"
    shift_amount = gets.chomp.to_i
end

def ciphernate(string, shift_amount)
    string.strip.each_char do |char|
        if char.match?(/\A[A-Za-z]+\z/)
            print (char.ord + shift_amount).chr
        else print char
        end
    end
end

ciphernate(get_string, get_shift)