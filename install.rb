require 'fileutils'

files = Dir.entries('.')

print "Overwrite any existing links (y/n): "
force = gets.strip!

files.each do |f|
  if f.include? '.sym'
    puts "Found #{f} to symlink!"
    to_sym = f
    to_sym.slice! '.sym'
    puts "Going to symlink #{to_sym}.sym into ~/.#{to_sym}!"
    FileUtils::ln_s("#{Dir.pwd}/#{to_sym}.sym", "#{File.expand_path('~')}/.#{to_sym}", :force => true)
    puts "Linked!"
  end
end
