require 'rails_helper'

describe "People Index" do
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
end
