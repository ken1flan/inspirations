class InspirationsController < ApplicationController
  before_action :set_inspiration, only: [:show, :edit, :update, :destroy]

  def index
    @inspirations = Inspiration.all
  end

  def show
  end

  def new
    @inspiration = Inspiration.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @inspiration = Inspiration.new(inspiration_params)
    @inspiration.user_id = current_user.id

    respond_to do |format|
      if @inspiration.save
        format.html { redirect_to @inspiration, notice: 'Inspiration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inspiration }
      else
        format.html { render action: 'new' }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inspiration.update(inspiration_params)
        format.html { redirect_to @inspiration, notice: 'Inspiration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inspiration.destroy
    respond_to do |format|
      format.html { redirect_to inspirations_url }
      format.json { head :no_content }
    end
  end

  private
    def set_inspiration
      @inspiration = Inspiration.where(user_id: current_user.id).find(params[:id])
    end

    def inspiration_params
      params.require(:inspiration).permit(:title, :contents)
    end
end
