class HomesController < ApplicationController
  def index
    @all_catecory = Category.all_category
  end
end
