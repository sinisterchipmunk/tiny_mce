require 'fileutils'
require 'find'

current = File.dirname(__FILE__)
['doc', 'public', 'db'].each do |dir|
  path = File.join(current, dir)
  Dir.glob(File.join(path, "/**/*")) do |src| # all files, recursively
    next if src =~ /\.svn/
    dest = src.sub(/^#{Regexp::escape(current)}/, "#{File.join(current, '../../..')}")
    if File.file?(src)
      puts "Copy\tFile\t#{dest}"
      FileUtils.copy(src, dest)
    else
      puts "Create\tDir\t#{dest}"
      FileUtils.mkdir_p(dest)
    end
  end
end
