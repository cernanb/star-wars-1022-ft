class StarWars::Person
    attr_accessor :name, :birth_year, :skin_color
    @@all = []

    def initialize(name, birth_year, skin_color)
        @name = name 
        @birth_year = birth_year
        @skin_color = skin_color
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_people(json)
        json["results"].map do |person_hash|
            self.new(person_hash["name"], person_hash["birth_year"], person_hash["skin_color"])
        end
    end
end