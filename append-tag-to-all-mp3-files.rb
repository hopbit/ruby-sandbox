if ARGV.count < 3
	puts "Eror! Wrong arguments!"
	exit 
end

puts "ARGS: "
ARGV.each do | a |
	puts "Argument: #{a}"
end

require 'find'

mp3_folder = ARGV[0] # 'C:\Users\jwalker\Desktop\test'
new_tag = ARGV[1] # '[adzk]'
new_tag_regexp = ARGV[2] #'\[adzk\]'
rename_files = ARGV[3] # '1' rename files; '0' don't rename files
mp3_ext = '.mp3'

old_file_paths = []
Find.find(mp3_folder) do |path|
  old_file_paths << path if (path =~ /.*\.mp3$/ && path !~ /.*#{new_tag_regexp}.*$/)
end

puts "\nold_file_paths: --------------------------"
puts old_file_paths

new_file_paths = []
old_file_paths.each { | old_path |
  new_path = old_path.dup.sub! mp3_ext, (" " + new_tag + mp3_ext)
  new_file_paths << new_path
}
puts "\nnew_file_paths:--------------------------------"
puts new_file_paths

# puts "\nold_file_paths length: #{old_file_paths.count.to_s}"
# puts "\nnew_file_paths length: #{new_file_paths.count.to_s}"

if rename_files == "1"
	puts "rename files"
	if old_file_paths.count == new_file_paths.count
		puts "arrays are same"
		old_file_paths.each_with_index do | old_path, idx | 
			puts "old_path: " + old_path
			new_path = new_file_paths[idx]
			puts "new_path: " + new_path
			File.rename(old_path, new_path)
		end
	else
		puts "arrays are not the same size, files won't be renamed"
		exit
	end
=begin
=end
else 
	puts "dry run no rename files"
end

puts "------------------- end"