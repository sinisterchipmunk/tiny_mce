require 'fileutils'
require 'find'

current = File.dirname(__FILE__)
['doc', 'public', 'db'].each do |dir|
  path = File.join(current, dir)
  another = true
  while another
    another = false
    Dir.glob(File.join(path, "/**/*")) do |src| # all files, recursively
      next if src =~ /\.svn/
      dest = src.sub(/^#{Regexp::escape(current)}/, "#{File.join(current, '../../..')}")
      if File.exist?(dest)
        if File.file?(dest)
          puts "Remove\tFile\t#{dest}"
          File.delete(dest)
        else
          if Dir[File.join(dest, "*")].empty?
            puts "Remove\tDir\t#{dest}"
            Dir.rmdir(dest)
            another = true
          end
        end
      end
    end
  end
end
