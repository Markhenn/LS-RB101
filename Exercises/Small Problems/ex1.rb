# Locate the ruby documentation for methods File::path and File#path. How are they different? 

=begin
  Problem: Define difference between two Ruby methods
  Test case:
  Data structure:
  Algorithm: Look up in documentation
=end

File::path -> returns a string representation of the given path
This is a class method and is called on the class like this (File.path(filename))

File#path -> returns a string representation of the given path
This is an instance method and is called on the object like this filename.path