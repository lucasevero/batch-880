class Repository
  def initialize
    @tasks = [] # Instances of Task
  end

  # CRUD
  # Create
  def add(task)
    @tasks << task
  end

  # Read
  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  # Update XXX
  # Not responsability of the repo

  # Destroy
  def remove(index)
    @tasks.delete_at(index)
  end
end
