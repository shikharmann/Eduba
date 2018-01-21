Aws.config.update({
  region: 'ap-south-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
})