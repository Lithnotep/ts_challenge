class Person < ApplicationRecord
    validates_presence_of :first, :last
end
