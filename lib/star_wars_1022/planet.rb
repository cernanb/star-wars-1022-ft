class StarWars::Planet
    attr_accessor :name, :climate, :population
    @@all = []
    def initialize(name, climate, population)
        @name = name
        @climate = climate
        @population = population

        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_planets(json)
        json["results"].map do |planet_hash|
            self.new(planet_hash["name"], planet_hash["climate"], planet_hash["population"])
        end
    end
end