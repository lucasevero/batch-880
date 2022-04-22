require_relative "task"

class Controller
  def initialize(view, repository)
    @view = view
    @repo = repository
  end

  def add_task
    # ask the user: what is the task???
    task_title = @view.ask_for_a_task
    # create a new task with the information provided
    task = Task.new(task_title)
    # add the task to the repository aka. store the information
    @repo.add(task)
  end

  def list_tasks
    tasks = @repo.all
    @view.display_tasks(tasks)
  end

  def mark_as_done
    # display all tasks
    list_tasks
    # ask user for the index of the task
    index = @view.ask_user_for_index
    # get the requested task
    task = @repo.find(index)
    # mark it as done
    task.mark_as_done!
  end

  def remove_task
    # display all tasks
    list_tasks
    # ask user for the index of the task
    index = @view.ask_user_for_index
    # delete it form the repo
    @repo.remove(index)
  end
end
