class ActivityController < ApplicationController
  def index
    Activity
      .order()
      .limit(limit_param)
  end

  private

  def limit_param
    activity_params[:limit]
  end

  def activity_params
    params.permit(:limit)
  end

end 