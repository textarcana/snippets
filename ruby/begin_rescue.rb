def foo

  begin
    nil.bad_method
  rescue NoMethodError => e
    puts %{EXCEPTION ENCOUNTERED.  REMAIN CALM.}
    puts %{Exception Message:    #{e.message}}
    puts %{Exception Backtrace:\n    #{e.backtrace.join("\n    ")}}
  end

end

def bar
  foo
end

bar
