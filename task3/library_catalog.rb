class LibraryItem
  attr_reader :title, :author, :publication_year

  def initialize(title, author, publication_year)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "Publication year: #{@publication_year}"
  end
end

class Book < LibraryItem
  attr_reader :genre

  def initialize(title, author, publication_year, genre)
    super(title, author, publication_year)
    @genre = genre
  end

  def display_info
    puts "Book"
    super
    puts "Genre: #{@genre}"
    puts
  end
end

class DVD < LibraryItem
  attr_reader :director

  def initialize(title, author, publication_year, director)
    super(title, author, publication_year)
    @director = director
  end

  def display_info
    puts "DVD"
    super
    puts "Director: #{@director}"
    puts
  end
end

class CD < LibraryItem
  attr_reader :artist

  def initialize(title, author, publication_year, artist)
    super(title, author, publication_year)
    @artist = artist
  end

  def display_info
    puts "CD"
    super
    puts "Artist: #{@artist}"
    puts
  end
end

class Library
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
    puts "Added: #{item.title}"
  end

  def remove_item(item)
    if @items.delete(item)
      puts "Removed: #{item.title}"
    else
      puts "Item not found: #{item.title}"
    end
  end

  def display_item(item)
    item.display_info
  end

  def display_all_items
    if @items.empty?
      puts "The library is empty."
      return
    end

    @items.each do |item|
      display_item(item)
    end
  end
end

book = Book.new(
  "Concepts of Programming Languages",
  "Robert Sebesta",
  2015,
  "Programming"
)

dvd = DVD.new(
  "Inception",
  "Jonathan Nolan",
  2010,
  "Christopher Nolan"
)

cd = CD.new(
  "A Day at the Races",
  "Freddie Mercury",
  1976,
  "Queen"
)

puts "Individual items:"
puts
book.display_info
dvd.display_info
cd.display_info

library = Library.new

puts "Adding items:"
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)

puts "\nAll library items:"
puts
library.display_all_items

puts "Removing one item:"
library.remove_item(dvd)

puts "\nLibrary items after removal:"
puts
library.display_all_items
