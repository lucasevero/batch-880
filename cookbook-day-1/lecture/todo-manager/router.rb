class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do

      puts "1 - Display all tasks"
      puts "2 - Add a new task"
      puts "3 - Mark a task as done"
      puts "4 - Remove a task"
      puts "5 - To quit the app"

      input = gets.chomp.to_i

      case input
      when 1
        @controller.list_tasks
      when 2
        @controller.add_task
      when 3
        @controller.mark_as_done
      when 4
        @controller.remove_task
      when 5
        break
      else
        puts "Invalid input..."
      end

    end
  end
end
