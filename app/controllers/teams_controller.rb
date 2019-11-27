class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index 
    @teams = Team.all
  end

  def show 
  end

  def new 
    @team = Team.new
  end

  def create 
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team successfully created"
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit 
    
  end 

  def update 
    if @team.update(team_params)
      flash[:success] = "Team successfully updated"
      redirect_to team_path(@team)
    else 
      render :edit
    end
  end

  def destroy 
    @team.destroy
    redirect_to teams_path
  end

  private 

  def set_team 
    @team = Team.find_by_slug(params[:slug])
  end

  def team_params 
    params.require(:team).permit(:city, :name, :coach, :sport)
  end
end
