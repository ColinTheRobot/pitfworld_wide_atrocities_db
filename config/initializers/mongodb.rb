# Set up database name, appending the environment name
# (e.g., palette-development, palette-production)
MongoMapper.config = {
    Rails.env => { 'uri' => ENV['MONGOHQ_URL'] ||
        'mongodb://localhost/xxxxxxxx' } }
MongoMapper.connect(Rails.env)
name = "pitf-#{Rails.env}"
if ENV['MONGOHQ_URL']
  uri = URI.parse(ENV['MONGOHQ_URL'])
  name = uri.path.gsub(/^\//, '')
  puts "Env = #{ENV['MONGOHQ_URL']}; DB NAME: #{name}"
end
MongoMapper.database = "#{name}"
