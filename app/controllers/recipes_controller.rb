class RecipesController < ApplicationController
  before_action :set_space

  def index
    api_call = ContentfulClientCreator.new(space: @space, content_type: 'recipe').call
    redirect_to :back, flash[:error] = api_call.error if api_call.data.nil?

    @recipes = api_call.data
  end

  def show
    api_call = ContentfulClientCreator.new(space: @space, entry_id: params[:id]).call
    redirect_to recipes_path, flash[:error] = api_call.error if api_call.data.nil?

    @recipe = Recipe.new(api_call.data).decorate
  end

  private
  def set_space
    @space = 'kk2bw5ojx476'
  end
end
