class Task
  attr_reader :title, :done

  def initialize(title)
    # STATE ???

    @title = title
    @done = false
  end

  def mark_as_done!
    @done = true
  end
end
