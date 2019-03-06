# Sometimes, the documentation is going to leave you scratching your head.

# In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with YAML::load_file:

=begin
  Problem: find documetation for a required method
  Test case: see below
  Data structure: number
  Algorithm: look up documentation then see below
=end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

# Go to YAML in Ruby doc -> Go to Psych in Ruby doc -> find load_file
# http://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file