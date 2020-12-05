namespace :csv_import do
  desc "Seed mock_data_csv.csv from db/data in to database"
  task seed_data: ['db:drop', 'db:create', 'db:migrate'] do
        require "csv"
         CSV.foreach('db/data/mock_data_csv.csv', headers: true) do |row|
          Person.create!(first: row['first'], last: row['last'])
        end
        puts "Created #{Person.all.length} People!"
    end
end