class StarWars::APIService

    BASE_URL = "https://swapi.co/api/"

    def self.get_swapi_categories
        results = RestClient.get(BASE_URL)
        json = JSON.parse(results)

        json.each do |key, value|

            StarWars::Category.new(key, value)
        end
    end

    def self.get_category_items(category)
        results = RestClient.get(category.url)

        json = JSON.parse(results)
        
        case category.name
        when "people"
            StarWars::Person.create_people(json)
        when "planets"
            StarWars::Planet.create_planets(json)
        end

    end
end