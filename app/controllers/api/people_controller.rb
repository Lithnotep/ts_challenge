class Api::PeopleController < ApplicationController
  def index
    people = PersonSerializer.new.serialize(Person.all)
    render json: {data: people}
  end
end