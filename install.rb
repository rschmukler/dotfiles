#!/usr/bin/env ruby

HOME = File.expand_path('~')


def symlink_files
  Dir['*'].each do |file|
    next if file =~ /install/
    target = File.join(HOME, ".#{file}")
    unless File.exists? target
      `ln -s #{File.expand_path file} #{target}`
    end
  end
end

def make_vim_tmp
  vim_tmp = File.join(HOME, '.vim-tmp')
  unless File.exists? vim_tmp
    `mkdir #{vim_tmp}`
  end
end

symlink_files
make_vim_tmp
