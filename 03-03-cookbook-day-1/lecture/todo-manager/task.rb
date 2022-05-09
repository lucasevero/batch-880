class Task
  attr_reader :title, :done

  def initialize(title)
    # States
    @title = title
    @done = false
  end

  # Behavior
  def mark_as_done!
    @done = true
  end
end
