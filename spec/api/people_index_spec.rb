require 'rails_helper'

describe "People Index" do
  it "can get all people" do
    person1 = Person.create(first_name: 'max', last_name: 'mitrani')
    person2 = Person.create(first_name: 'ben', last_name: 'ericson')
    person3 = Person.create(first_name: 'tyler', last_name: 'billy')
    person4 = Person.create(first_name: 'john', last_name: 'gerno')
    person5 = Person.create(first_name: 'katie', last_name: 'rella')

    get '/api/people'

    expect(response).to be_successful
    people = JSON.parse(response.body)
    expect(people['data'].count).to eq(5)
  end
end
