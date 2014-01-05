class TopController < ApplicationController
  def index
    #TODO: ページング
    @inspirations = Inspiration.all
  end
end
