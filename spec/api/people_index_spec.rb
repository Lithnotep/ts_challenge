require 'rails_helper'

describe "People" do
  it "can get all people" do
    person1 = Person.create(first: 'max', last: 'mitrani')
    person2 = Person.create(first: 'ben', last: 'ericson')
    person3 = Person.create(first: 'tyler', last: 'billy')
    person4 = Person.create(first: 'john', last: 'gerno')
    person5 = Person.create(first: 'katie', last: 'rella')

    get '/api/people'

    expect(response).to be_successful
    people = JSON.parse(response.body)
    expect(people['data'].count).to eq(5)
  end
  it "can get one person" do 
    person1 = Person.create(first: 'max', last: 'mitrani')
    person2 = Person.create(first: 'ben', last: 'ericson')
    person3 = Person.create(first: 'tyler', last: 'billy')
    person4 = Person.create(first: 'john', last: 'gerno')
    person5 = Person.create(first: 'katie', last: 'rella')

    get "/api/person/#{person3.last}/#{person3.first}"

    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['data']['id']).to eq(person3.id)
    expect(person['data']['first']).to eq(person3.first)
    expect(person['data']['last']).to eq(person3.last)
  end

end
