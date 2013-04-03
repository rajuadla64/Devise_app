
class DashboardController < ApplicationController

  layout "homepage"
  before_filter :authenticate_user!

  def index
    if current_user.admin?
    redirect_to :controller=>"admin",:action=>"admin"
    end
    if current_user.vendor?

      redirect_to :controller=>"vendor",:action=>"vendor"
    end
    if current_user.learner?
      redirect_to :controller=>"learner",:action=>"learner"
    end

  end
  def create

    @addcourse=Coursedetails.new
    if request.post?
      @addcourse=Coursedetails.new(params[:addcourse])
      if @addcourse.save
        redirect_to :action=>"index"
      end
    end

    end
end
