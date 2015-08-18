json.array!(@octopi) do |octopus|
  json.extract! octopus, :id, :name, :owner_id, :breed_id, :dob, :vet_name, :vet_phone, :in_daycare
  json.url octopus_url(octopus, format: :json)
end
