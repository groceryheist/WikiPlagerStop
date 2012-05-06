require 'rubygems'
#require 'aws-sdk'
require 'aws/s3'
debug = true
#require 'yaml'

#YAML::load(File.open('aws_config.yml'))
#AWS.config(
#	YAML::load(File.open('aws_config.yml'))
#	)
	
	#create the basic S3 object
 AWS::S3::Base.establish_connection!(
	:access_key_id => 'AKIAJVG3NHOJGID6X55Q',
	:secret_access_key => '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',
)
	bucket_name = "extractedwexnatet"

	bucket = AWS::S3::Bucket.create(bucket_name,{})

  puts "#{bucket.inspect}"
  puts "Creating Bucket #{bucket_name}"

directory = "WikiData"
d = Dir.new(directory)
Dir.chdir directory
d.each do |file|
	next if file =='.' or file == '..'
  base_name = File.basename(file)
	puts "Uploading #{file} as #{base_name} to #{bucket.inspect}"
	AWS::S3::S3Object.store(file,open(file),bucket_name)


end
	
