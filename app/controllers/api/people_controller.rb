class Api::PeopleController < ApplicationController
  
    def index
         people = PersonSerializer.new.people_serialize(Person.all)
        render json: {data: people}
    end

    def show
        person_data = Person.find_by(last: params['last'], first: params['first'])
        person = PersonSerializer.new.person_serialize(person_data)
        render json: {data: person}
    end

    def create
        person_data = {first: params['first'], last: params['last']}
        new_person = Person.create(person_data)
        person = PersonSerializer.new.person_serialize(new_person)
        render json: {data: person}
    end

end