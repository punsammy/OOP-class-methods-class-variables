#Book Lending
require 'date'
class Books

  @@on_shelf = []

  @@on_loan = []

  attr_accessor :due_date

  def initialize(title)
    @title = title
  end

  def borrow
    if lent_out
      return "#{@title} is already out"
    else
      @@on_loan << self
      @@on_shelf.delete(self)
      @@borrow_date = Time.now.to_date
    end
  end

  def return_to_library
    if lent_out
      @@on_shelf << self
      @@on_loan.delete(self)
      @@due_date = nil
      @@borrow_date = nil
      puts "#{@title} has been returned"
      return @@on_loan
    else
      "#{@title} is not on loan"
    end
  end

  def name
    return @title
  end

  def lent_out
    if @@on_loan.include?(@title) == true
      puts "#{@title} is alreaedy lent out"
      return true
    else
      puts "#{@title} is available"
      return false
    end
  end

  def current_due_date
    return @@borrow_date + 5
  end

  # def self.overdue_books
  #
  # end

  def self.browse
    return @@on_shelf.sample.name
  end

  def self.print_shelf
    @@on_shelf.each do |book|
      puts book.name
    end
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def self.create(title)
    new_book = Books.new(title)
    @@on_shelf << new_book
    return new_book
  end

end

newbook = Books.create('newbook')
bottle = Books.create('bottle')
puts bottle.name
pen = Books.create('pen')
puts Books.browse
puts newbook.borrow
puts newbook.current_due_date
puts newbook.return_to_library
