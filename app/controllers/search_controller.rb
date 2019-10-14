class SearchController < ApplicationController
  def index
    render locals: {
      facade: HarryPotterCharacters.new(params[:house])
    }
  end
end
