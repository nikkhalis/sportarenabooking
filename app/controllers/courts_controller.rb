class CourtsController < ApplicationController
  def index
    if params[:court_type].present?
      @courts = Court.where(court_type: params[:court_type])
    else
      @courts = Court.all
    end
  end
end
