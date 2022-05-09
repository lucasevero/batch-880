class View
  def welcome
    puts 'welcome to our app!!!'
  end

  def ask_user_for_task
    puts 'please, insert your task'
    gets.chomp
  end

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      done = task.done ? "X" : " "
      puts "#{index + 1}. [#{done}] #{task.title}"
    end
  end

  def ask_for_index
    puts 'please, insert the index of the task'
    gets.chomp.to_i - 1
  end
end
