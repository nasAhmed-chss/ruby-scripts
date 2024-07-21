#!/usr/bin/env ruby

# Command-line Parsing
filename = ARGV.shift
options = {}
pattern = nil
invalid_options = []
# Option Handling
while arg = ARGV.shift
  case arg
  when '-w', '-p', '-v', '-c', '-m'
    options[arg] = true
  when /^-/
    invalid_options << arg
  else
    pattern = arg
  end
end


# Option Validation
valid_options = %w(-w -p -v -c -m)

if invalid_options.any?
  if invalid_options.size > 1
    puts "Invalid combination of options"
  else
    puts "Invalid option"
  end
  exit
end
#puts "Invalid options: #{invalid_options.inspect}"

# Error Handling
if filename.nil? || pattern.nil?
  puts "Missing required arguments"
  exit
end



# File Reading
begin
  file_contents = File.readlines(filename)
rescue Errno::ENOENT
  puts "File not found: #{filename}"
  exit
end

# Search Logic and Result Printing
matching_lines = file_contents.select do |line|
  case
  when options['-w']
    line.split.include?(pattern)
  when options['-p'], options.empty?  # Set -p as default if options are empty
    line.match?(Regexp.new(pattern))
  when options['-v']
    !line.match?(Regexp.new(pattern))
  else
    puts "Invalid option"
    return
  end

end



# Check for valid combination of options
if options['-m'] && !options['-p'] && !options['-w']
  puts "Invalid combination of options"
  exit
end

# Output based on options
if options['-c']
  puts matching_lines.size
elsif options['-m']
  matching_lines.each { |line| puts line.match(Regexp.new(pattern))[0] }
else
  puts matching_lines
end