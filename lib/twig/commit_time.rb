class Twig
  class CommitTime

    attr_reader :time

    def initialize(time, time_ago)
      @time = time

      # Shorten relative time
      @time_ago = time_ago.
        sub(' years',   'y').
        sub(' months',  'mo').
        sub(' weeks',   'w').
        sub(' days',    'd').
        sub(' hours',   'h').
        sub(' minutes', 'm').
        sub(' seconds', 's')
    end

    def to_i
      @time.to_i
    end

    def to_s
      time_string = @time.strftime('%F %R %z')
      "#{time_string} (#{@time_ago})"
    end

    def <=>(other)
      to_i <=> other.to_i
    end

  end
end
