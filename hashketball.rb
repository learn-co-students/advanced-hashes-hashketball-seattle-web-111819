# Write your code here!
require 'pry'
#1. Build a nested data structure from text and data stored in tables
#2. Process the nested data structure to produce INSIGHTS about how various players performed

def game_hash
  game_hash={ #step 1, build the nested data structure
    :home =>{
              :team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players=>[ #array of hashed stats
                        {:player_name=> "Alan Anderson",
                        :number=> 0,
                        :shoe=> 16,
                        :points=> 22,
                        :rebounds=> 12,
                        :assists=> 12,
                        :steals=> 3,
                        :blocks=> 1,
                        :slam_dunks=> 1
                      },
                        {:player_name=> "Reggie Evans",
                        :number=> 30,
                        :shoe=> 14,
                        :points=> 12,
                        :rebounds=> 12,
                        :assists=> 12,
                        :steals=> 12,
                        :blocks=> 12,
                        :slam_dunks=> 7
                      },
                        {:player_name=> "Brook Lopez",
                        :number=> 11,
                        :shoe=> 17,
                        :points=> 17,
                        :rebounds=> 19,
                        :assists=> 10,
                        :steals=> 3,
                        :blocks=> 1,
                        :slam_dunks=> 15
                      },
                        {:player_name=> "Mason Plumlee",
                        :number=> 1,
                        :shoe=> 19,
                        :points=> 26,
                        :rebounds=> 11,
                        :assists=> 6,
                        :steals=> 3,
                        :blocks=> 8,
                        :slam_dunks=> 5
                      },
                        {:player_name=> "Jason Terry",
                        :number=> 31,
                        :shoe=> 15,
                        :points=> 19,
                        :rebounds=> 2,
                        :assists=> 2,
                        :steals=> 4,
                        :blocks=> 11,
                        :slam_dunks=> 1
                      }

              ]
            },

      :away =>{
                :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players=>[ #array of hashed stats
                  {:player_name=> "Jeff Adrien",
                  :number=> 4,
                  :shoe=> 18,
                  :points=> 10,
                  :rebounds=> 1,
                  :assists=> 1,
                  :steals=> 2,
                  :blocks=> 7,
                  :slam_dunks=> 2
                  },
                  {:player_name=> "Bismack Biyombo",
                  :number=> 0,
                  :shoe=> 16,
                  :points=> 12,
                  :rebounds=> 4,
                  :assists=> 7,
                  :steals=> 22,
                  :blocks=> 15,
                  :slam_dunks=> 10
                  },
                  {:player_name=> "DeSagna Diop",
                  :number=> 2,
                  :shoe=> 14,
                  :points=> 24,
                  :rebounds=> 12,
                  :assists=> 12,
                  :steals=> 4,
                  :blocks=> 5,
                  :slam_dunks=> 5
                  },
                  {:player_name=> "Ben Gordon",
                  :number=> 8,
                  :shoe=> 15,
                  :points=> 33,
                  :rebounds=> 3,
                  :assists=> 2,
                  :steals=> 1,
                  :blocks=> 1,
                  :slam_dunks=> 0
                  },
                  {:player_name=> "Kemba Walker",
                  :number=> 33,
                  :shoe=> 15,
                  :points=> 6,
                  :rebounds=> 12,
                  :assists=> 12,
                  :steals=> 7,
                  :blocks=> 5,
                  :slam_dunks=> 12
                  }
                ]
            }
          }
  game_hash
end

def num_points_scored(name_of_player)
  #returns number of points scored for that player

  game_hash.each do | place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name_of_player
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name_of_player)
#returns shoe size for that player
game_hash.each do | place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name_of_player
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(name_of_team)
  #returns an array of that team's colors
  game_hash.each do |place, team|
      if team[:team_name] == name_of_team
        return team[:colors]
    end
  end
end



def team_names
#returns an array of the team names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

#original try that works too, creating a new array:

# def team_names
# #returns an array of the team names
# team_names_array=[]
#   game_hash.each do |place, team|
#     team_names_array.push(team[:team_name])
#   end
#   team_names_array
# end


def player_numbers(name_of_team)
  #returns array of jersey numbers for that team
  jersey_numbers_array = []
  game_hash.each do |place, team|
    if team[:team_name]== name_of_team
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            jersey_numbers_array.push(player[:number])
          end
        end
      end
    end
  end
  jersey_numbers_array
end



def player_stats(name_of_player)
  #returns hash of that player's stats
  stats_hash={}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == name_of_player
            stats_hash = player.delete_if do |key, value|
              key == :player_name
            end
          end
        end
      end
    end
  end
  stats_hash
end


def big_shoe_rebounds
  #find player with largest shoe size
  #then return that player's number of rebounds
  biggest_shoe = 0
  rebounds = 0

  game_hash.each do | place, team|
    team[:players].each do |player|
      size = player[:shoe]
      if size > biggest_shoe
        biggest_shoe= size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end


def most_points_scored
  #return which player has the most points?
  most_points = 0
  most_points_player= ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      size = player[:points]
      if size > most_points
        most_points = player[:points]
        most_points_player = player[:player_name]
      end
    end
  end
  most_points_player
end


def winning_team
  #return team that has most points
  points_total = 0
  winner = ''
  game_hash.each do |place, team|
    team_points = 0
    team_name = game_hash[place][:team_name]
    team[:players].each do |player|
      points = player[:points]
      team_points += points
        end
      winner, points_total = team_name, team_points if team_points > points_total
    end
  return winner
end



def player_with_longest_name
  longest = ''
  longest_name_length = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_name_length = player[:player_name], name_length if name_length > longest_name_length

    end
  end
  return longest
end

def long_name_steals_a_ton?
  #if player_with_longest_name has most steals, return true
  #check if names for both categories match and return true if they do
  steals_most = ''
  number_of_steals = 0

  game_hash.each do |place, team|
    team[:players].each do |player|
      steals_most, number_of_steals = player[:player_name], player[:steals] if player[:steals] > number_of_steals
    end
  end
  return true if steals_most == player_with_longest_name
end
