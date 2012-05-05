require 'rubygems'
require 'aws-sdk'
require 'yaml'

YAML::load(File.open('aws_config.yml'))
#AWS.config(
#	YAML::load(File.open('aws_config.yml'))
#	)
	
	#create the basic S3 object
AWS.config({
	:access_key_id => 'AKIAJVG3NHOJGID6X55Q',
	:secret_access_key => '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',
})
	S3 = AWS::S3.new
	bucket_name = "extractedwexnatet"
	bucket = S3.buckets[bucket_name]
	unless bucket.exists?
		puts "Making bucket #{bucket_name}.."
		S3.buckets.create(bucket_name)
	end
directory = "/home/ubuntu/WikiData"
d = Dir.new(directory)
Dir.chdir directory
d.each do |file|
	base_name = File.basename(file)
	puts "Uploading #{file} as #{base_name} to #{bucket.inspect}"
	S3.store(base_name,File.open(file),bucket)
end
	
