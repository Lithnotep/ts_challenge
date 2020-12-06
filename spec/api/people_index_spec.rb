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
  it "can list people in order last then first" do
    person3 = Person.create(first: 'sarah', last: 'ericson')
    person1 = Person.create(first: 'max', last: 'mitrani')
    person5 = Person.create(first: 'derek', last: 'rella')
    person2 = Person.create(first: 'ben', last: 'ericson')
    person4 = Person.create(first: 'billy', last: 'gerno')
    person6 = Person.create(first: 'katie', last: 'rella')

    get '/api/people'
    people = JSON.parse(response.body)
    expect(people['data'][0]['id']).to eq(person2.id)
    expect(people['data'][1]['id']).to eq(person3.id)
    expect(people['data'][2]['id']).to eq(person4.id)
    expect(people['data'][3]['id']).to eq(person1.id)
    expect(people['data'][4]['id']).to eq(person5.id)
    expect(people['data'][5]['id']).to eq(person6.id)


  end
  it "can create a person" do
    
    post "/api/person", :params => { first: "Tommy", last: "Johnson"}
    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['data']['first']).to eq("Tommy")
    expect(person['data']['last']).to eq("Johnson")
  end
end
