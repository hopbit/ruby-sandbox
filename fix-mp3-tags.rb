if ARGV.count < 4
	puts "Eror! Wrong arguments!"
	exit 
end

puts "ARGS: "
ARGV.each do | a |
	puts "Argument: #{a}"
end

require 'find'

mp3_folder = ARGV[0] #'C:\Users\jwalker\Desktop\test'
old_tag = ARGV[1] # '[evgs]'
old_tag_regexp = ARGV[2] #'\[evgs\]'
new_tag = ARGV[3] #'[awsl][alov][aslw][gold]'
rename_files = ARGV[4]

old_file_paths = []
Find.find(mp3_folder) do |path|
  old_file_paths << path if path =~ /.*#{old_tag_regexp}.*\.mp3$/
end

puts "\nold_file_paths: --------------------------"
puts old_file_paths

new_file_paths = []
old_file_paths.each { | old_path |
  new_path = old_path.dup.sub! old_tag, new_tag
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

# Links: 
# http://stackoverflow.com/questions/13659696/find-indices-of-elements-that-match-a-given-condition
# http://ruby-doc.org/core-2.2.0/Array.html#class-Array-label-Obtaining+Information+about+an+Array
# http://stackoverflow.com/questions/14895594/cant-convert-fixnum-into-string-typeerror
# http://stackoverflow.com/questions/3498539/searching-a-folder-and-all-of-its-subfolders-for-files-of-a-certain-type
# http://stackoverflow.com/questions/7983533/recursive-file-list-in-ruby 
# http://stackoverflow.com/questions/7983533/recursive-file-list-in-ruby
# http://stackoverflow.com/questions/2370702/one-liner-to-recursively-list-directories-in-ruby 
# http://stackoverflow.com/questions/536760/block-commenting-in-ruby
# http://stackoverflow.com/questions/8381499/replace-words-in-string-ruby
# http://stackoverflow.com/questions/10758694/how-to-mass-rename-files-in-ruby
# http://stackoverflow.com/questions/5530479/how-to-rename-a-file-in-ruby
# http://stackoverflow.com/questions/310634/what-is-the-right-way-to-iterate-through-an-array-in-ruby
# http://stackoverflow.com/questions/2846313/finding-out-current-index-in-each-loop-ruby
# http://www.howtogeek.com/howto/programming/ruby/ruby-if-else-if-command-syntax/
# http://stackoverflow.com/questions/6766878/what-is-the-difference-between-gsub-and-sub-methods-for-ruby-strings
# http://stackoverflow.com/questions/1465569/ruby-how-can-i-copy-a-variable-without-pointing-to-the-same-object
# http://stackoverflow.com/questions/5582196/different-way-of-creating-ruby-strings 
# http://stackoverflow.com/questions/4244611/pass-variables-to-ruby-script-via-command-line
# http://stackoverflow.com/questions/4432506/stop-execution-of-ruby-script