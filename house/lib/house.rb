class House

  DATA =
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      ""]

  attr_reader :orderer, :data

  def initialize(orderer=DefaultOrderer.new)
    @orderer   = orderer
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is #{phrase(num)}the house that Jack built.\n"
  end

  def phrase(num)
    orderer.order(DATA).last(num).join(" ")
  end
end

class DefaultOrderer
  def order(data)
    data
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class MostlyRandomOrderer
  def order(data)
    data[0...-1].shuffle + data.last
  end
end

puts
puts House.new.line(12)
puts
puts House.new(RandomOrderer.new).line(12)
puts