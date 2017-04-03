#Book Lending
class Book

  @@on_shelf = []

  @@on_loan = []

  attr_accessor :due_date

  def initialize(title, author=N/A,isbn=N/A)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow
    if title.lent_out? == false
      return "#{@title} is already out"
    else
      @@on_shelf.delete(self)
      @@on_loan << self
      time = Time.now
      @@borrow_date = Time.day
    end
  end

  def return_to_library
    if self.lent_out? == true
      @@on_loan.delete(self)
      @@on_shelf << self
      @@due_date = nil
      @@borrow_date = nil
      puts "#{@title} has been returned"
      return @@on_loan
    else
      "#{@title} is not on loan"
    end
  end

  def lent_out?
    if @@on_loan.include?(self) == true
      puts "#{@title} is alreaedy lent out"
      return true
    else
      puts "#{@title} is available"
      return false
    end
  end

  def self.create
    new_book = Books.new
    @@on_shelf << new_book
    return on_shelf
  end

  def self.current_due_date
    @@due_date = @@borrow_date + 5
  end

  def self.overdue_books

  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

end
