class UserStepsController < ApplicationController
  def first
    @user_choice = UserChoice.new
  end

  def second
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:vehicle] = user_choice_params[:vehicle]
    else
      render action: :first
    end
  end

  def third
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:cleaning] = user_choice_params[:cleaning]
    else
      render action: :second
    end
  end

  def fourth
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:active] = user_choice_params[:active]
    else
      render action: :third
    end
  end

  def fifth
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:exercise] = user_choice_params[:exercise]
    else
      render action: :fourth
    end
  end

  def sixth
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:home] = user_choice_params[:home]
    else
      render action: :fifth
    end
  end

  def create
    unless params[:user_choice]
      @user_choice = UserChoice.new
      render action: :sixth
    end
    @user_choice = current_user.build_user_choice(
      vehicle: session[:vehicle],
      cleaning: session[:cleaning],
      active: session[:active],
      exercise: session[:exercise],
      home: session[:home],
      house: user_choice_params[:house]
    )
    if @user_choice.save
      session[:id] = @user_choice.user_id
      redirect_to  matching_results_dogs_path
    else
      render 'new'
    end
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:vehicle, :cleaning, :active, :exercise, :home, :house, :user_id)
  end
end
