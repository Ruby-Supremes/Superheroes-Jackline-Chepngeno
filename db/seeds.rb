hero_strength = ['Strong', 'Weak', 'Average']

puts "🌱 Seeding data..."
8.times do
    Hero.create(name: Faker::Name.unique.name, super_name: Faker::Games::Heroes.unique.name)
end

Hero.all.each do |hero|
    rand(1..8).times do
        power=Power.create(name: Faker::Games::Heroes.unique.artifact,description: Faker::Lorem.paragraph(sentence_count: 3))

        hero = Hero.order('RANDOM()').first

        HeroPower.create(strength: Faker::Games::Heroes.unique.specialty, power_id:power.id, hero_id:hero.id)
    end
end
puts "🌱 Done seeding!"