class SessionView
  def ask_for_username
    puts "username?"
    gets.chomp
  end

  def ask_for_password
    puts "password"
    gets.chomp
  end

  def signed_in
    puts "Signed in!"
  end

  def wrong_credentials
    puts "Worng credential, try again"
  end
end
