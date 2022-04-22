require_relative 'task'

class Controller
  def initialize(view, repository)
    @view = view
    @repository = repository
  end

  def add_task
    # 1. ask the user for the name of the task
    task_name = @view.ask_user_for_task
    # 2. create the new task with the info provided
    task = Task.new(task_name)
    # 3. add the new task to the repository
    @repository.add(task)
  end

  def list_tasks
    tasks = @repository.all
    @view.display_tasks(tasks)
  end

  def mark_as_done
    # display the tasks to the user
    list_tasks
    # ask which task the user wants to mark => index
    index = @view.ask_for_index
    # take the task in the repo
    task = @repository.find(index)
    # mark it as done
    task.mark_as_done!
  end

  def remove_task

  end
end
