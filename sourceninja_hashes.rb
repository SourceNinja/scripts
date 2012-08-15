#!/usr/bin/env ruby
# Script for returning a list of filenames, md5, and sha1 when pointed at a directory

require 'digest/md5'
require 'digest/sha1'
require 'optparse'

options = {}

optparse = OptionParser.new do|opts|
	opts.banner = "Usage: sourceninja_hashes.rb [options] file1 file2 ..."

	options[:directory] = nil
		opts.on( '-d', '--directory DIRECTORY', 'Use this directory for the files, if not present uses the root directory' ) do|basedir|
		options[:directory] = basedir
	end

	opts.on( '-h', '--help', 'Display this screen' ) do
		puts opts
		exit
	end
end

optparse.parse!
 

## Main part of the script
if options[:directory]
	Dir.chdir(options[:directory])
end

files = Dir.glob("*")

files.each do |file|
	md5 = Digest::MD5.hexdigest(file)
	sha1 = Digest::SHA1.hexdigest(file)

	puts file + 
		"," + 
		md5 + 
		"," +
		sha1 
end




