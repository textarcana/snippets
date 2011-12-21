# log what's building and queued

jobs_in_the_all_tab = JSON.load(open('http://ci.example.com/view/All/api/json?tree=' + CGI.escape("name,url,jobs[name,inQueue,color]")))

jobs_in_the_all_tab['jobs'].each do | job  |
  if job['color'] =~ /.*_anime/
     puts "currently building: #{job['name']}"
  end
end

jobs_in_the_all_tab['jobs'].each do | job |
  if job['inQueue']
      puts "currently queued: #{job['name']}"
  end
end
