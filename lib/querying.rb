def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books INNER JOIN series ON books.series_id = series.id WHERE series.id=1 ORDER BY year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto FROM characters GROUP BY motto HAVING MAX(LENGTH(characters.motto)) LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS theTag FROM characters GROUP BY species ORDER BY theTag DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series JOIN subgenres ON series.subgenre_id = subgenres.id JOIN authors ON author_id = authors.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series WHERE series.id = (SELECT characters.series_id FROM characters WHERE species = 'human' GROUP BY series_id ORDER BY COUNT(species) DESC LIMIT 1);"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(book_id) FROM character_books JOIN characters ON character_books.character_id = characters.id GROUP BY character_id ORDER BY COUNT(book_id) DESC, characters.name ASC;"
end
