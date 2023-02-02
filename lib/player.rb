class Player
  attr_accessor :firstname, :type

  def initialize(firstname, type)
    @firstname = firstname
    @type = type
    puts "#{@firstname}, you will play with the #{@type}"
  end
end
