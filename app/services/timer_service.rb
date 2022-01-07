class TimerService
  attr_reader :time_left, :time_spent

  def initialize(seconds)
    @time_spent = 0
    start_timer(seconds)
  end

  def self.translate_time(hours, minutes, seconds)
    hours * 3600 + minutes * 60 + seconds
  end

  private

  def start_timer(seconds)
    @time_left = seconds.positive? ? seconds : 0
    Thread.new do
      seconds.downto(1) do
        sleep 1
        @time_left -= 1
        @time_spent += 1
      end
    end
  end
end
