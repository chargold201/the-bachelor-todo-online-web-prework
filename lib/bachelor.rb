require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |season_number, contestant_array|
    if season_number == season
      contestant_array.each do |contestant_data|
        contestant_data.each do |attribute, value|
          if attribute == "status"
            if value == "Winner"
              return data[season][contestant_array.index(contestant_data)]["name"].split.first
            end
          end
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_number, contestant_array|
    contestant_array.each do |contestant_data|
      contestant_data.each do |attribute, value|
        if attribute == "occupation"
          if value == occupation
            return data[season_number][contestant_array.index(contestant_data)]["name"]
          end
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_number, contestant_array|
    contestant_array.each do |contestant_data|
      contestant_data.each do |attribute, value|
        if attribute == "hometown"
          if value == hometown
            count += 1
          end
        end
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season_number, contestant_array|
    contestant_array.each do |contestant_data|
      contestant_data.each do |attribute, value|
        if attribute == "hometown"
          if value == hometown
            return data[season_number][contestant_array.index(contestant_data)]["occupation"]
          end
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data.each do |season_number, contestant_array|
    if season_number == season
      contestant_array.each do |contestant_data|
        contestant_data.each do |attribute, value|
          if attribute == "age"
            age_array << value.to_f
          end
        end
      end
    end
  end
  total = 0.0
  age_array.each {|age| total += age}
  average = (total / age_array.length).round
end
