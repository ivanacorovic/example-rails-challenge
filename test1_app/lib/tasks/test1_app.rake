namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      Customer.create!(first_name: "Johny",
                   last_name: "Flow")
     Customer.create!(first_name: "Raj",
                   last_name: "Jamnis")
      Customer.create!(first_name: "Andrew",
                   last_name: "Chung")
      Customer.create!(first_name: "Mike",
                   last_name: "Smith")


      5.times do |n|
        created=rand(100000)+n
       amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: true, currency: 'USD', refunded: false, customer_id: 1)
      end

       3.times do |n|
        created=rand(100000)+n
       amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: true, currency: 'USD', refunded: false, customer_id: 2)
      end
        Charge.create!(created: rand(1000000), amount: rand(100000), 
          paid: true, currency: 'USD', refunded: false, customer_id: 3)
       Charge.create!(created: rand(1000000), amount: rand(100000), 
          paid: true, currency: 'USD', refunded: false, customer_id: 4)

 3.times do |n|
        created=rand(100000)+n
        amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: false, currency: 'USD', refunded: false, customer_id: 3)
      end
       2.times do |n|
        created=rand(100000)+n
        amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: false, currency: 'USD', refunded: false, customer_id: 4)
      end
       3.times do |n|
        created=rand(100000)+n
        amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: true, currency: 'USD', refunded: true, customer_id: 1)
      end

       2.times do |n|
        created=rand(100000)+n
        amount=rand(100000)+n
        Charge.create!(created: created, amount: amount, 
          paid: true, currency: 'USD', refunded: true, customer_id: 2)
      end

    

    


      
        




end
end