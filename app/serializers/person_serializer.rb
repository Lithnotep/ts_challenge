class PersonSerializer
    
    def serialize(people)
        people.map do |person|
            {
                id: person.id,
                first: person.first,
                last: person.last
             }
        end
    end

end