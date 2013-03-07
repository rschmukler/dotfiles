#!/usr/bin/env ruby

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/
  target = File.join(home, ".#{file}")
  `ln -s #{File.expand_path file} #{target}`
end


vim_tmp = File.join(home, '.vim-tmp')
unless File.exists? vim_tmp
  `mkdir #{vim_tmp}`
end
