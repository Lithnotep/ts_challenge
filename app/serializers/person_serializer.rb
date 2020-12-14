class PersonSerializer
    
    def people_serialize(people)
        people.map do |person|
            [person.last, person.first]
        end
    end

    def person_serialize(person)
        {
            id: person.id,
            first: person.first,
            last: person.last
        }
    end

end