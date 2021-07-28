# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Destroying old Icons"
Icon.destroy_all
puts "Old Icons destroyed"

icons = [{name: 'default', image: "https://e7.pngegg.com/pngimages/451/517/png-clipart-computer-icons-program-optimization-computer-software-source-code-symbol-miscellaneous-angle.png"},
         {name: 'ruby', image: "https://image.flaticon.com/icons/png/512/919/919842.png"},
         {name: 'javascript', image: "https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png"},
         {name: 'java', image: "https://brandslogos.com/wp-content/uploads/images/large/java-logo-1.png"},
         {name: 'c++', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/306px-ISO_C%2B%2B_Logo.svg.png"},
         {name: 'python', image: "http://assets.stickpng.com/images/5848152fcef1014c0b5e4967.png"},
         {name: 'c#', image: "https://www.freeiconspng.com/uploads/c-logo-icon-18.png"},
         {name: 'go', image: "https://e7.pngegg.com/pngimages/762/331/png-clipart-go-programming-language-computer-programming-programmer-programming-language-miscellaneous-computer-program.png"},
         {name: 'swift', image: "https://brandslogos.com/wp-content/uploads/thumbs/swift-logo-vector.svg"},
         {name: 'php', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/2560px-PHP-logo.svg.png"},
         {name: 'objective-c', image: "https://www.pinclipart.com/picdir/middle/396-3965102_swiftify-saves-thousands-of-work-hours-by-converting.png"},
         {name: 'obj-c', image: "https://www.pinclipart.com/picdir/middle/396-3965102_swiftify-saves-thousands-of-work-hours-by-converting.png"},
         {name: 'visual studio', image: "https://1000logos.net/wp-content/uploads/2020/08/Visual-Studio-Logo.png"},
         {name: 'pearl', image: "https://cdn.freebiesupply.com/logos/large/2x/perl-programming-language-logo-png-transparent.png"},
         {name: 'scratch', image: "https://w1.pngwing.com/pngs/925/885/png-transparent-scratch-logo-cat-programming-language-computer-programming-scratching-mit-media-lab-coderdojo-blend-t-yellow-line.png"},
         {name: 'vue', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1200px-Vue.js_Logo_2.svg.png"},
         {name: 'angular', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/1024px-Angular_full_color_logo.svg.png"},
         {name: 'jquery', image: "https://www.pikpng.com/pngl/m/440-4404136_jquery-jquery-logo-transparent-background-clipart.png"},
         {name: 'ruby on rails', image: "https://image.pngaaa.com/154/4122154-middle.png"},
         {name: 'rails', image: "https://image.pngaaa.com/154/4122154-middle.png"},
         {name: 'bootstrap', image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/2560px-Bootstrap_logo.svg.png"},
         {name: 'django', image: "https://pngimage.net/wp-content/uploads/2018/05/django-png-9.png"},
         {name: 'react', image: "https://image.pngaaa.com/875/2507875-middle.png"},
         {name: 'figma', image: "https://cdn.freebiesupply.com/logos/thumbs/2x/figma-1-logo.png"},
         {name: 'photoshop', image: "https://logos-world.net/wp-content/uploads/2020/11/Adobe-Photoshop-Logo.png"}
        ]


icons.each do |icon|
  file = URI.open(icon[:image])
  icon = Icon.create!(name: icon[:name])
  icon.photo.attach(io: file, filename: "#{icon[:name]}.png", content_type: 'image/png')
  p "created icon with NAME: #{icon[:name]} and ID: #{icon.id}"
end

puts "created #{Icon.count} new icons"
