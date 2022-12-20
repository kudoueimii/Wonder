class LanguagesController < ApplicationController
  def locale
    return unless %w[ja en].include?(params[:locale])

    cookies[:locale] = params[:locale]
    redirect_to :root
  end
end
