function! ElixirTestPath(file_path)
  let path = a:file_path
  let path = substitute(path, '\(^|/\)lib/', '/test/', 'g')
  let path = substitute(path, '/\(\w+\)\.exs', '\1_test.exs', 'g')
  return path
endfunction
