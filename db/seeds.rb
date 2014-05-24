# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Blog.create({owner_id: 1, title: 'hello', url: 'something.com'})
Blog.create({owner_id: 1, title: 'test2', url: 'something2.com'})
Post.create({blog_id: 1, post_type: 'Text'})
Post.create({blog_id: 1, post_type: 'Text'})
Post.create({blog_id: 1, post_type: 'Video'})
Post.create({blog_id: 1, post_type: 'Video'})