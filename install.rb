# Automates installing applications by category group.
#
# Note: This will require homebrew and cask. It will go ahead and install them
#  if brew is missing.
#
# See: http://caskroom.io/
#
# Help: ruby install.rb -h
#
# Author::    Richard Sumilang <me@richardsumilang.com>
# URL::       https://github.com/rsumilang/casks
# Homepage::  http://richardsumilang.com
# License::   http://creativecommons.org/licenses/by-sa/3.0/


require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

#
# Parses out options taken in from the CLI.
#
class CaskOptionsParser


  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.appdir = "/Applications"
    options.category = false
    options.install = true

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: install.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # Application Directory
      opts.on("--appdir PATH",
              "Target location for Application links.",
              "  The default value is /Applications") do |appdir|
        options.appdir << appdir
      end

      # Category Option
      opts.on("-c", "--category [NAME]",
              "Name of application category to install",
              "  (should reference filename in ./category)",
              "  All categories will be installed if not specified.") do |cat|
        options.category = cat
      end

      # Uninstall option
      opts.on("-u", "--uninstall", "Run uninstall rather than install") do |u|
        options.install = false
      end


      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end

    opts.parse!(args)
    options
  end  # parse()

end  # class OptparseExample


# Cross-platform way of finding an executable in the $PATH.
#
#   which('ruby') #=> /usr/bin/ruby
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    }
  end
  return nil
end



#
# Our options. Lets rock in roll
#
options = CaskOptionsParser.parse(ARGV)
#pp options



#
# Check if brew is installed, else install it.
#
if !which("brew")
  puts "Installing homebrew..."
  puts `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

  puts "Updating brew recipes..."
  puts `brew update`

  puts "Installing cask..."
  puts `brew install caskroom/cask/brew-cask`
end


#
# Install cmd
#
installCmd = "brew cask " << (options.install ? "install" : "uninstall") << " --appdir=#{options.appdir}"



#
# Runs either specified category of apps
# or all of them if none specified.
#
if options.category
  category = "./category/#{options.category}.sh"
  cmd = "#{category} \"#{installCmd}\""
  puts "Processing #{category}..."
  puts `#{cmd}`
else
  files = Dir["./category/*.sh"]
  files.each do |category|
    cmd = "#{category} \"#{installCmd}\""
    puts "Processing #{category}..."
    puts `#{cmd}`
  end
end
