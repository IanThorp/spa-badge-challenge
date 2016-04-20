class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :update, :destroy]

  # GET /badges
  # GET /badges.json
  def index
    p params
    p "------------------------------------------------------------------"
    @badges = Badge.find_by(teacher_id: params[:id])

    render json: @badges
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    render json: @badge
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      render json: @badge, status: :created, location: @badge
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    @badge = Badge.find(params[:id])

    if @badge.update(badge_params)
      head :no_content
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy

    head :no_content
  end

  private

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:votes, :title)
    end
end
