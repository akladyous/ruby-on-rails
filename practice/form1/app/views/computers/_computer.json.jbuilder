json.extract! computer, :id, :cpu, :ram, :hdd, :cdrom, :created_at, :updated_at
json.url computer_url(computer, format: :json)
