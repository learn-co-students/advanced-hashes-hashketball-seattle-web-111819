# Write your code here!
def game_hash()
  {
    home: { team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
          {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
          {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
          {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
          {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
          {player_name: "Jason Terry",
        number: 31,	
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [        
          {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2},
          {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10},
          {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5},
          {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0},
          {player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12},
        
        ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_away, team|
    team[:players].each do |player_array|
      player_array.each do |key, value|
       if player_array[:player_name] == player_name
         return player_array[:points]
        end
      end    
    end
  end
end

def shoe_size(player_name) 
  game_hash.each do |home_away, team|
  team[:players].each do |each_player|
  each_player.each do |key, value|
    if each_player[:player_name] == player_name
      return each_player[:shoe]
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
 name_array =[]
 
 game_hash.each do |home_away,team|
 name_array << team[:team_name]
 end
 name_array
end

def player_numbers(team_name)
  team_array = []
  
  game_hash.each do |home_away, team|
  if team[:team_name] == team_name
    team[:players].each do |each_player|
      team_array << each_player[:number]
      end
    end
  end
  team_array
end

def player_stats(player_names)
  player_stat = {}
  game_hash.each do |home_away,team|
    team[:players].each do |each_player|
      next if each_player[:player_name] != player_names
        player_stat = each_player
        player_stat.delete(:player_name)
    end
  end
  player_stat
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
game_hash.each do |home_away, team|
  team[:players].each do |each_player|
      shoes = each_player[:shoe]
      if shoes > big_shoe
        big_shoe = shoes
        rebounds = each_player[:rebounds]
    end
  end
end
  rebounds
end

def most_points_scored
  most_points = 0
  mvp = nil
  game_hash.each do |home_away, team|
    team[:players].each do |each_player|
      each_player.each do |key, value|
      current_points = each_player[:points]
      if current_points > most_points
        most_points = current_points
        mvp = each_player[:player_name]
        end
      end
    end
  end
  mvp
end

def winning_team
points_hash = Hash.new(0)
game_hash.each do |home_away,team|
  team[:players].each do |each_player|
    each_player.each do |key, value|
    points_hash[team[:team_name]] += each_player[:points]
  end
end
end
  points_hash.key(points_hash.values.max)    
end

def player_with_longest_name
  name_size = 0
  longest_name = nil
  game_hash.each do |home_away,team|
  team[:players].each do |each_player|
    each_player.each do |key, value|
      long_name = each_player[:player_name].size
    if long_name > name_size
      name_size = long_name
      longest_name = each_player[:player_name]
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_name = nil
  game_hash.each do |home_away, team|
    team[:players].each do |each_player|
      each_player.each do |key, value|
      steals = each_player[:steals]
      if steals > most_steals
        most_steals = steals
        most_steals_name = each_player[:player_name]
        end
      end
    end
  end
 most_steals_name == player_with_longest_name ? true : false
end






















