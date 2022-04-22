class Repository
  def initialize
    # STATE

    @tasks = []
  end

  # BEHAVIOR ?? CRUD

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

  # X Update X
  # Updating a single task is NOT a job for the repo

  # Destroy
  def remove(index)
    @tasks.delete_at(index)
  end
end
