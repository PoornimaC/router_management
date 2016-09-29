# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

############Default Routers###################

(1..9000).each do |p|
  puts "***************"
  puts "Creating Router_#{p}"
  router = Router.create(name: "Router_#{p}", location: "Router_#{p}_location")
  Strength.create(strength: p+10, router_id: router.id)
end
