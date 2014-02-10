require 'spec_helper'

describe "Static pages" do

    subject {page}

    before do
        @customer1=  Customer.create!(first_name: "Johny", last_name: "Flow")
        # cstomer2= Customer.create!(first_name: "Raj", last_name: "Jamnis")
        # customer3= Customer.create!(first_name: "Andrew", last_name: "Chung")
        # customer4= Customer.create!(first_name: "Mike", last_name: "Smith")

         10.times do |n|
           created=rand(100000)+n
          amount=rand(100000)+n
           Charge.create!(created: created, amount: amount, 
             paid: true, currency: 'USD', refunded: false, customer_id: @customer1.id)
         end

        

        5.times do |n|
            created=rand(100000)+n
            amount=rand(100000)+n
            Charge.create!(created: created, amount: amount, 
              paid: false, currency: 'USD', refunded: false, customer_id: @customer1.id)
        end
  
        
         7.times do |n|
          created=rand(100000)+n
          amount=rand(100000)+n
          Charge.create!(created: created, amount: amount, 
            paid: true, currency: 'USD', refunded: true, customer_id: @customer1.id)
        end
@charge1=FactoryGirl.create(:charge, customer: @customer1)
      
        visit index_path
    end

    it {@charge1.should respond_to(:created)}
    it {should have_selector('h1', :text=>'Successful charges')}
    it {should have_selector('h1', :text=>'Failed charges')}
    it {should have_selector('h1', :text=>'Disputed charges')}

    
    it {page.all('div#failed table tr').count.should eql(6)}
    it {page.all('div#disputed table tr').count.should eql(8)}
    it {page.all('div#successful table tr').count.should eql(12)}


  end
