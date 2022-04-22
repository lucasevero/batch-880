class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      puts "please, enter an action"
      puts "1 - add a task"
      puts "2 - list all tasks"
      puts "3 - mark a task as done"
      puts "4 - delete a task"
      puts "5 - quit the app"

      input = gets.chomp.to_i

      case input
      when 1 then @controller.add_task
      when 2 then @controller.list_tasks
      when 3 then @controller.mark_as_done
      when 4 then @controller.remove_task
      when 5 then break
      else
        puts 'wrong input... :('
      end
    end
  end
end
