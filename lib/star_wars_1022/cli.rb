class StarWars::CLI

    def start
        puts "Welcome to Star Wars CLI!!!"
        StarWars::APIService.get_swapi_categories
        menu
    end

    def menu
        puts "Here are all the categories. Please select one to view the individual items for that category:"
        StarWars::Category.all.each.with_index(1) do |category, index|
            puts "#{index}. #{category.name.capitalize}"
        end

        input = gets.chomp

        category = StarWars::Category.all[input.to_i - 1]
        items = StarWars::APIService.get_category_items(category)
        case category.name
        when "people"
            display_people(items)
        when "planets"
            display_planets(items)
        end
    end

    def display_people(people)
        people.each do |person|
            puts "Name: #{person.name}"
            puts "Birth Year: #{person.birth_year}"
            puts "Skin Color: #{person.skin_color}"
            puts "================================"
            puts ""
        end 
    end
    
    def display_planets(planets)
        planets.each do |planet|
            puts "Name: #{planet.name}"
            puts "Climate: #{planet.climate}"
            puts "Population: #{planet.population}"
            puts "================================"
            puts ""
        end 
    end
end