class PersonSerializer
    
    def people_serialize(people)
        people.map do |person|
            {
                id: person.id,
                first: person.first,
                last: person.last
             }
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