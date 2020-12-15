require 'rails_helper'

describe "People" do
  it "can get all people" do
    person1 = Person.create(first: 'Max', last: 'Mitrani')
    person2 = Person.create(first: 'Men', last: 'Ericson')
    person3 = Person.create(first: 'Tyler', last: 'Billy')
    person4 = Person.create(first: 'John', last: 'Gerno')
    person5 = Person.create(first: 'Katie', last: 'Rella')

    get '/api/people'

    expect(response).to be_successful
    people = JSON.parse(response.body)
    expect(people['data'].count).to eq(5)
  end
  it "can get one person" do 
    person1 = Person.create(first: 'Max', last: 'Mitrani')
    person2 = Person.create(first: 'Ben', last: 'Ericson')
    person3 = Person.create(first: 'Tyler', last: 'Billy')
    person4 = Person.create(first: 'John', last: 'Gerno')
    person5 = Person.create(first: 'Katie', last: 'Rella')
    
    get "/api/person/#{person3.last}/#{person3.first}"

    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['data']['id']).to eq(person3.id)
    expect(person['data']['first']).to eq(person3.first)
    expect(person['data']['last']).to eq(person3.last)
  end
  it "can list people in order last then first" do
    person3 = Person.create(first: 'Sarah', last: 'Ericson')
    person1 = Person.create(first: 'Max', last: 'Mitrani')
    person5 = Person.create(first: 'Derek', last: 'Rella')
    person2 = Person.create(first: 'Ben', last: 'Ericson')
    person4 = Person.create(first: 'Billy', last: 'Gerno')
    person6 = Person.create(first: 'Katie', last: 'Rella')

    get '/api/people'
    people = JSON.parse(response.body)
    expect(people['data'][0][0]).to eq(person2.last)
    expect(people['data'][1][0]).to eq(person3.last)
    expect(people['data'][2][0]).to eq(person4.last)
    expect(people['data'][3][0]).to eq(person1.last)
    expect(people['data'][4][0]).to eq(person5.last)
    expect(people['data'][5][0]).to eq(person6.last)


  end
  it "can create a person" do
    
    post "/api/person", :params => { first: "Tommy", last: "Johnson"}
    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['data']['first']).to eq("Tommy")
    expect(person['data']['last']).to eq("Johnson")
  end
  it "can return sad paths for person GET " do
    person1 = Person.create(first: 'max', last: 'mitrani')
    person2 = Person.create(first: 'ben', last: 'ericson')
    person3 = Person.create(first: 'tyler', last: 'billy')
    person4 = Person.create(first: 'john', last: 'gerno')
    person5 = Person.create(first: 'katie', last: 'rella')
    
    get "/api/person/illy/tom"

    
    person = JSON.parse(response.body)
    expect(person['errors']).to eq("There is no person by that name.")
  end
  it "can't create a person without last name" do
    
    post "/api/person", :params => { first: "Tommy"}
    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['errors']).to eq("Last can't be blank")
  end
  it "can't create a person without last first" do
    
    post "/api/person", :params => { last: "tyler"}
    expect(response).to be_successful
    person = JSON.parse(response.body)
    expect(person['errors']).to eq("First can't be blank")
  end
end
