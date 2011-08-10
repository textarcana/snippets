module BadThings
  def do_something_bad
    begin
      nil.bad_method
    rescue NoMethodError => e
      puts %{EXCEPTION ENCOUNTERED.  REMAIN CALM.}
      puts %{Exception Message:    #{e.message}}
      puts %{Exception Backtrace:\n    #{e.backtrace.join("\n    ")}}
    ensure
      if e
        puts %{\nRaising Exception, Stand By...}
        raise e
      end
    end
  end

  def throw_an_exception
    do_something_bad
  end
end

include BadThings

BadThings::throw_an_exception
