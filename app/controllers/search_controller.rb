class SearchController < ApplicationController
  def index
  end

  def find
    @solr = Sunspot.search(Product) do
      fulltext params[:q]

      Product.attributes.each do |attribute|
        unless params[attribute.to_sym].blank?
          filter = []
          filter.push(params[attribute.to_sym])

          with(attribute.to_sym).any_of(filter)
        end

        facet attribute.to_sym
      end

    end
  end
end
