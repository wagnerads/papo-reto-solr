class SearchController < ApplicationController
  def index
  end

  def find
    @solr = Sunspot.search(Product) do
      fulltext params[:q]

      any_of do
        with(:brand, params[:brand]) if params[:brand].present?
      end
      facet :brand

      Product.attributes.each do |attribute|
        any_of do
          with(attribute, params[attribute]) if params[attribute].present?
        end
        facet attribute
      end

      paginate page: params[:page], per_page: 30
    end
  end
end
