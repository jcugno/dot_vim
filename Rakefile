# Rakefile
#
# Simple tasks for managing my .vim files

require 'open-uri'
require 'json'


PLUGIN_LIST_TAG = '## Plugin List'
PLUGIN_LIST_NOTE = '_Note: Auto generated by `rake plugins:update_readme`_'
VIMRC_FILE = 'vimrc'
README_FILE = 'README.md'

namespace :vim do 
  desc 'Create symlinks'
  task :link do
    begin
      File.symlink(".vim/#{VIMRC_FILE}", File.expand_path('~/.vimrc'))
    rescue NotImplementedError
      puts "File.symlink not supported, you must do it manually."
      if RUBY_PLATFORM.downcase =~ /(mingw|win)(32|64)/
        puts 'Windows 7 use mklink, e.g.'
        puts '  mklink _vimrc .vim\vimrc'
      end
    end
    
  end
end

namespace :plugins do

  desc 'Update the list of plugins in README.md'
  task :update_readme do
    plugins = parse_plugins_from_vimrc
    delete_old_plugins_from_readme
    add_plugins_to_readme(plugins)
  end
end


# ----------------------------------------
# Helper Methods
# ----------------------------------------


# Just takes an array of strings that resolve to plugins from Vundle
def add_plugins_to_readme(plugins = [])
  lines = File.readlines(README_FILE).map{|l| l.chomp}
  index = lines.index(PLUGIN_LIST_TAG)
  unless index.nil?
    lines.insert(index+1, "\n#{PLUGIN_LIST_NOTE}\n\n")
    lines.insert(index+2, plugins.map{|p| " * [#{p[:name]}](#{p[:uri]}) - #{p[:description]}"})
    write_lines_to_readme(lines)
  else
    puts "Error: Plugin List Tag (#{PLUGIN_LIST_TAG}) not found"
  end
  
end

def delete_old_plugins_from_readme
  lines = []
  File.readlines(README_FILE).map do |line|
    line.chomp!
    lines << line
    if line == PLUGIN_LIST_TAG
      break
    end
  end

  write_lines_to_readme(lines)
end

def write_lines_to_readme(lines)
  readme_file = File.open(README_FILE, 'w')
  readme_file << lines.join("\n")
  readme_file.close
end

# Returns an array of plugins denoted with Bundle
def parse_plugins_from_vimrc
  plugins = []
  File.new(VIMRC_FILE).each do |line|
    if line =~ /^Bundle\s+["'](.+)["']/
      plugins << convert_to_link_hash($1)
    end
  end

  plugins
end

# Converts a Vundle link to a URI
def convert_to_link_hash(link)
  link_hash = {}

  if link =~ /([a-zA-Z0-9\-]*)\/([a-zA-Z0-9\-\._]*)/
    user = $1
    name = $2
    link_hash[:user] = user
    link_hash[:name] = name
    link_hash[:uri] = "https://github.com/#{user}/#{name}"
    link_hash[:description] = fetch_github_repo_description(user, name)
  else
    name = link
    link_hash[:name] = name
    link_hash[:uri] = "https://github.com/vim-scripts/#{name}"
    link_hash[:description] = fetch_github_repo_description('vim-scripts', name)
  end
  
  link_hash
end

def fetch_github_repo_description(user, name)
  response = open("https://api.github.com/repos/#{user}/#{name}").read
  repo = JSON.parse response
  repo['description']
end

