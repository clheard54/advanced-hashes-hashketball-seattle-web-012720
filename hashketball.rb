require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1,
        },
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe =>14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7,
        },
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
        },
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26, 
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5,
        },
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19, 
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      ],
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2,
        },
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10,
        },
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5,
        },
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0,
        },
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12,
        }
      ]
    }
  }
end

def num_points_scored(players_name)
  game_hash.each {|team_location, team_data|
    team_data[:players].each {|players_stats|
      if players_stats[:player_name] == players_name
        return players_stats[:points]
      end
    }
  }
end


def shoe_size(player)
  game_hash.each {|team_location, team_data|
    team_data[:players].each {|players_stats|
      if players_stats[:player_name] == player
        return players_stats[:shoe]
      end
    }
    }
end

def team_colors(teams_name)
  game_hash.each {|team_location, team_data|
    if team_data[:team_name] == teams_name
      return team_data[:colors]
    end
  }
end

def team_names
  game_hash.map {|team_location, team_data|
    team_data[:team_name]
  }
end

def player_numbers(teams_name)
  game_hash.each {|team_location, team_data|
    if team_data[:team_name] == teams_name
      numbers = team_data[:players].map {|players_stats|
        players_stats[:number]
      }
      return numbers
    end
  }
end

def player_stats(players_name)
  game_hash.each {|team_location, team_data|
    team_data[:players].each {|players_stats|
      if players_stats[:player_name] == players_name
        stats = {
          :number => players_stats[:number],
          :shoe => players_stats[:shoe],
          :points => players_stats[:points],
          :rebounds => players_stats[:rebounds],
          :assists => players_stats[:assists],
          :steals => players_stats[:steals],
          :blocks => players_stats[:blocks],
          :slam_dunks => players_stats[:slam_dunks]
        }
        return stats
      end
    }
  }
end

def big_shoe_rebounds
  biggest_size = 0;
  game_hash.each {|place, team|
    team[:players].each {|player_stats|
      if player_stats[:shoe] >= biggest_size
        biggest_size = player_stats[:shoe]
      end
    }
  }
  game_hash.each {|place, team|
    team[:players].each {|player_stats|
      if player_stats[:shoe] == biggest_size
        return player_stats[:rebounds]
      end
    }
  }
end

def most_points_scored
  points = 0;
  scorer = '';
  game_hash.each {|place, team|
    team[:players].each {|player_stats|
      if player_stats[:points] >= points
        points = player_stats[:points]
        scorer = player_stats[:player_name]
      end
    }
  }
  return scorer
end

def winning_team
  team_totals = {}
  game_hash.each {|place, team|
    name = team[:team_name]
    place_points = 0;
    team[:players].each {|player_stats|
    place_points += player_stats[:points]
    }
    team_totals[name]= place_points
  }
  winner = '';
  total = 0;
  team_totals.each {|key, value|
    if value >= total
      total = value
      winner = key
    end
  return winner
  }
end


def player_with_longest_name
  names = []
  game_hash.each {|place, team|
    team[:players].each {|players_stats|
      names << players_stats[:player_name]
    }
  }
  return names.max_by {|x| x.length}
end

def most_steals
  steals = 0;
  who = ''
  game_hash.each {|place, team|
  team[:players].each {|players_stats|
    if players_stats[:steals] >= steals
      steals = players_stats[:steals]
      who = players_stats[:player_name]
    end
  }
  }
  return who
end

def long_name_steals_a_ton?
  stealer = most_steals
  long_name = player_with_longest_name
  if stealer == long_name
    return true
  else
    return false
  end
end
