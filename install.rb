#!/usr/bin/env ruby

home = File.expand_path('~')


def symlink_files
  Dir['*'].each do |file|
    next if file =~ /install/
    target = File.join(home, ".#{file}")
    unless File.exists? target
      `ln -s #{File.expand_path file} #{target}`
    end
  end
end

def make_vim_tmp
  vim_tmp = File.join(home, '.vim-tmp')
  unless File.exists? vim_tmp
    `mkdir #{vim_tmp}`
  end
end


symlink_files
make_vim_tmp
