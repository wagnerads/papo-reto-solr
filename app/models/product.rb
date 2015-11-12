class Product < ActiveRecord::Base
  def self.attributes
    %w[inch screen_type capacity functions connections type speed power]
  end

  Product.attributes.each do |key|
    store_accessor :properties, key
  end

  searchable :auto_index => true, :auto_remove => true do
    text :title, :boost => 5.0
    text :description, :boost => 2.5
    text :category, :boost => 2.0

    Product.attributes.each do |key|
      string key do
        properties[key] if properties && !properties[key].try(:empty?)
      end
    end
  end
end
# Tv Microondas Rádio Cafeteira Ventilador
