module Calculable

  def self.sum_of_attribute(collection, attribute)
    collection.sum { |object| object.send("#{attribute}") }
  end
end
