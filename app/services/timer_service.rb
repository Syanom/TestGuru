class TimerService
  attr_reader :time_left

  def start_timer(seconds)
    @time_left = seconds
    Thread.new do
      seconds.downto(1) do
        sleep 1
        @time_left -= 1
      end
    end
  end
end
