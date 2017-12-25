def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where('yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5')

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .select(:yr)
    .group(:yr)
    .having('MAX(score) <= 8')
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .select(:id,:name)
    .joins(:movies)
    .where('title = ?', title)
    .order('ord ASC')

    #show actor id and name
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .select(:id, :title, "actors.name")
    .joins(:actors)
    .where('castings.ord = 1 AND movies.director_id = actors.id')
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select(:id, :name, "COUNT(*) AS roles")
    .joins(:castings)
    .where('castings.ord > 1')
    .group(:id)
    .order('roles DESC')
    .limit(2)





end