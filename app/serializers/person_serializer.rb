class PersonSerializer
    
    def serialize(people)
        people.map do |person|
            {
                id: person.id,
                first_name: person.first_name,
                last_name: person.last_name
             }
        end
    end

end