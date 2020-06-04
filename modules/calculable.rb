module Calculable

  def self.sum_of_attribute(collection, attribute)
    collection.sum { |object| object.send("#{attribute}") }
  end

  def self.percent(part, total)
    percent = ((part / total.to_f) * 100)
    percent.round(1)
  end

  def self.last_ten_years(collection, attribute)
    collection.find_all do |object|
      ((this_year - 10)..this_year).include?(object[attribute])
    end
  end

  def self.this_year
    Time.now.year
  end
end
