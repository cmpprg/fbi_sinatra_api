module Calculable

  def self.sum_of_attribute(collection, attribute)
    collection.sum { |object| object.send("#{attribute}") }
  end

  def self.percent(part, total)
    percent = ((part / total.to_f) * 100)
    percent.round(1)
  end

end
