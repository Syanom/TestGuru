class TimerService
  attr_reader :time_left, :time_spent

  def initialize
    @time_spent = 0
  end

  def start_timer(seconds)
    @time_left = seconds
    Thread.new do
      seconds.downto(1) do
        sleep 1
        @time_left -= 1
        @time_spent += 1
      end
    end
  end
end
