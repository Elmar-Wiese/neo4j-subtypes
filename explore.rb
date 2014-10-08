require 'smarter_csv'
require 'csv'


CSV.open("data/dogs.csv", "wb") do |csv|
  csv << ["BreedGroup",
          "PrimaryBreed",
          "TagIdentity",
          "PrimaryColour",
          "YearsOld",
          "MonthsOld",
          "Location",
          "Size"]
end

count = 0
CSV.open("data/dogs.csv", "ab") do |csv|
  CSV.foreach("data/Animal_Tag_DATA.csv", headers:true) do |row|
    next unless row['animal_type'] == "DOG"
    next if row["tag_identity"].nil?

    p row
    csv << [row["breed_group"],
            row["primary_breed"],
            row["tag_identity"],
            row["primary_color"],
            row["years_old"],
            row["months_old"],
            row["location"],
            row["animal_size"]
    ]

    count = count+1
    exit if count > 100
  end
end
#
# rows = SmarterCSV.process('data/Animal_Tag_DATA.csv', {:row_sep => "\n"})
#
# p rows
