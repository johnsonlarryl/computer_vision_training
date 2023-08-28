disp("Loading file utils...")

function file_location =  get_image_file_location(relative_file_name)
  python_path = strsplit (getenv ("PYTHONPATH"), ":")

  for path_element = python_path
    if endsWith(path_element,"Images")
        file_location = strcat(path_element{:}, "/", relative_file_name)
        return
      endif
  endfor
endfunction
