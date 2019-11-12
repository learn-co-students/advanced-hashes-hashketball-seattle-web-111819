# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => [
        "Black",
        "White"
      ],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    ],},
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => [
        "Turquoise",
        "Purple"
      ],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    ],} }
end

def num_points_scored(name)
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |key, value|
    if value[:team_name] == team
      return value[:colors]
    end
  end
end

def team_names
  array = []
  game_hash.each do |key, value|
    array << value[:team_name]
  end
  array
end

def player_numbers(team_name)
  jersey_num_array = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
    value[:players].each do |player|
      jersey_num_array << player[:number]
    end
    end
  end
  jersey_num_array
end

def player_stats(name)
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        player.delete(:player_name)
        return player
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = 0
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        most_points_player = player[:player_name]
      end
    end
  end
  most_points_player
end

def winning_team
  team_1_points = 0
  team_2_points = 0
  game_hash[:home][:players].each do |player|
    team_1_points += player[:points]
  end
  game_hash[:away][:players].each do |player|
    team_2_points += player[:points]
  end
  if team_1_points > team_2_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  longest_name_by_num = 0
  longest_name_by_name = nil
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name].length > longest_name_by_num
        longest_name_by_num = player[:player_name].length
        longest_name_by_name = player[:player_name]
      end
    end
  end
  longest_name_by_name
end

def long_name_steals_a_ton?
  longest_name_by_num = 0
  player_with_longest_name_steals = nil
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name].length > longest_name_by_num
        longest_name_by_num = player[:player_name].length
        player_with_longest_name_steals = player[:steals]
      end
    end
  end
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player_with_longest_name_steals < player[:steals]
        return false
      end
    end
  end
  return true
end
