# encoding: UTF-8
# XXX : 
# Quick script to seed.
# Should be improved.
require 'rest-client'

CLIENT_ID          = "da4013ca5a4a696ca740c9e16b55650ca984f81bf86dc2bd8dc122dc0f3d0079"
CLIENT_SECRET      = "0e953030d6135eb6cf8c64d2fd6686b40cf6619daa08b40b8a122aa31e996ba0"
DOORKEEPER_APP_URL = "http://localhost:3004"

USER_EMAIL         = "tbishop@total.com"
USER_PASSWORD      = "pleaseplease"

## That account will be the owner of the azendoo app:
user1 = User.create(email: "robin@azendoo.com", password: "pleaseplease")
puts "User #{user1.email} account created."

puts "Create an app for #{user1.email} :"
app = Doorkeeper::Application.new :name => 'Azendoo', :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob'
app.owner = user1
app.save!

## Set same application credentials than those present in our PoC (config/config.yml) :
app.uid = CLIENT_ID
app.secret = CLIENT_SECRET
puts "App created" if app.save!

## Create a test user and request a default bearer token :
puts "Lets create #{USER_EMAIL} with a default bearer token."

user = User.new(email: USER_EMAIL, password: USER_PASSWORD)
puts "#{user.email} account created." if user.save!

# Ask for a bearer token :
response  = RestClient.post("#{DOORKEEPER_APP_URL}/oauth/token", \
                            grant_type: "password", \
                            client_id: CLIENT_ID, \
                            client_secret: CLIENT_SECRET, \
                            username: USER_EMAIL, \
                            password: USER_PASSWORD)

puts "Account now has a default bearer access token" if response
