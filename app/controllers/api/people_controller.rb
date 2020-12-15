class Api::PeopleController < ApplicationController
  
    def index
        order = Person.order('last ASC, first ASC')
        people = PersonSerializer.new.people_serialize(order)
        render json: {data: people}
    end

    def show
        person_data = Person.find_by(last: params['last'].capitalize, first: params['first'].capitalize)
        if person_data == nil
            render json: {
                errors: "There is no person by that name.",
                status: 400
            }
        else
            person = PersonSerializer.new.person_serialize(person_data)
            render json: {data: person}
        end
    end

    def create
        person_data = {first: params['first'], last: params['last']}
        new_person = Person.new(person_data)
        if new_person.save
            person = PersonSerializer.new.person_serialize(new_person)
            render json: {data: person}
        else
            render json: {
                errors: new_person.errors.full_messages[0]
            }
        end
    end

end