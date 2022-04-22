class View
  def welcome
    puts "Welcome to your new favorite Todo list"
  end

  def ask_for_a_task
    puts "Please, insert your task:"
    gets.chomp
  end

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. [#{ task.done ? "X" : " "}] #{task.title}"
    end
  end

  def ask_user_for_index
    puts "Please, insert the index of the task"
    gets.chomp.to_i - 1
  end
end
