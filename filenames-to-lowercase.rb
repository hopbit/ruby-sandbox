# parse command line args

if ARGV.count < 2
	puts "Eror! Wrong arguments!"
	exit 
end

puts "ARGS: "
ARGV.each do | a |
	puts "Argument: #{a}"
end

require 'find'

mp3_folder = ARGV[0] # 'C:\Users\jwalker\Desktop\test'
rename_files = ARGV[1] # '1' rename files; '0' don't rename files

# prepare list of existing mp3 paths

old_file_paths = []
Find.find(mp3_folder) do |path|
  old_file_paths << path if path =~ /.*\.mp3$/
end

puts "\nold_file_paths: --------------------------"
puts old_file_paths

# convert all collected mp3 paths to lowercase & put them to new list

new_file_paths = []
old_file_paths.each { | old_path |
  new_path = old_path.downcase
  new_file_paths << new_path
}
puts "\nnew_file_paths:--------------------------------"
puts new_file_paths

# puts "\nold_file_paths length: #{old_file_paths.count.to_s}"
# puts "\nnew_file_paths length: #{new_file_paths.count.to_s}"

# if "rename_files" flag is set to true (1) then do the rename 
# to lower case on each mp3 file

if rename_files == "1"
	puts ">>> rename files"
	if old_file_paths.count == new_file_paths.count
		puts ">>> arrays are same"
		old_file_paths.each_with_index do | old_path, idx | 
			puts ">> old_path: " + old_path
			new_path = new_file_paths[idx]
			puts ">> new_path: " + new_path
			File.rename(old_path, new_path)
		end
	else
		puts ">>> arrays are not the same size, files won't be renamed"
		exit
	end
=begin
=end
else 
	puts ">>> dry run no rename files"
end

puts "------------------- end"