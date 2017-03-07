def guess_number(guess)
    number = 25
    if guess < number
        puts "Your guess is too low!"
    elsif guess > number
        puts "Your guess is too high!"
    else
        puts "You get it right!"
    end
end

guess_number(25)
