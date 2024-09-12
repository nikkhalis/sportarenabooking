
arena1 = Arena.find_or_create_by!(name: 'BDM Arena') do |arena|
  arena.location = 'BDM'
end

arena2 = Arena.find_or_create_by!(name: 'FTS Arena') do |arena|
  arena.location = 'FTS'
end

4.times do |i|
  Court.create!(name: "Badminton Court #{i + 1}", arena: arena1, court_type: 0, available: Time.now)
end

4.times do |i|
  Court.create!(name: "Futsal Court #{i + 1}", arena: arena2, court_type: 1, available: Time.now)
end
