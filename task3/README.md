# Task 3: Library Catalog System in Ruby

## About the task

In this task I created a small library catalog system in Ruby. It can store different types of items, add and remove them, and display their information. I used classes, inheritance, encapsulation and polymorphism.

The base class is `LibraryItem`. It stores the properties that are common for every item:

```ruby
attr_reader :title, :author, :publication_year
```

The values are stored in instance variables such as `@title`. I used `attr_reader` so they can be read outside the class, but they cannot be directly changed. This is how encapsulation is used in the program.

There are three classes that inherit from `LibraryItem`:

```ruby
class Book < LibraryItem
class DVD < LibraryItem
class CD < LibraryItem
```

They get the common properties by calling `super` in their constructors. They also have their own properties. A book has a genre, a DVD has a director, and a CD has an artist.

Each class has its own `display_info` method. It first calls `super` to display the common information and then displays its specific property.

The `Library` class stores the items in an array:

```ruby
@items = []
```

It has methods called `add_item`, `remove_item`, `display_item`, and `display_all_items`. The `display_item` method can receive any library item:

```ruby
def display_item(item)
  item.display_info
end
```

Ruby calls the correct `display_info` method depending on whether the item is a `Book`, `DVD`, or `CD`. This demonstrates polymorphism.

## Running and result

I ran the program with:

```text
ruby library_catalog.rb
```

This was my output:

```text
hacizadarufat@KapMac334-M A3 % cd task3
hacizadarufat@KapMac334-M task3 % ruby library_catalog.rb
Individual items:

Book
Title: Concepts of Programming Languages
Author: Robert Sebesta
Publication year: 2015
Genre: Programming

DVD
Title: Inception
Author: Jonathan Nolan
Publication year: 2010
Director: Christopher Nolan

CD
Title: A Day at the Races
Author: Freddie Mercury
Publication year: 1976
Artist: Queen

Adding items:
Added: Concepts of Programming Languages
Added: Inception
Added: A Day at the Races

All library items:

Book
Title: Concepts of Programming Languages
Author: Robert Sebesta
Publication year: 2015
Genre: Programming

DVD
Title: Inception
Author: Jonathan Nolan
Publication year: 2010
Director: Christopher Nolan

CD
Title: A Day at the Races
Author: Freddie Mercury
Publication year: 1976
Artist: Queen

Removing one item:
Removed: Inception

Library items after removal:

Book
Title: Concepts of Programming Languages
Author: Robert Sebesta
Publication year: 2015
Genre: Programming

CD
Title: A Day at the Races
Author: Freddie Mercury
Publication year: 1976
Artist: Queen
```

The first part displays every item separately. After that, the same objects are added to the library and displayed together. The library calls the same method for all item types, but each object prints its own details. Finally, the DVD is removed and only the book and CD remain in the library.
