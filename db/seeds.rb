
8.times { |n| FireReport.create(street: "Rua #{n}", district: "Jardim #{n}", size: "pequeno") }
10.times { |n| FireReport.create(street: "Alameda #{n}", district: "Vila #{n}", size: "medio") }
6.times { |n| FireReport.create(street: "Avenida #{n}", district: "Parque #{n}", size: "grande") }
