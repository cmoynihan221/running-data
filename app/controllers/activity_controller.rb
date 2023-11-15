class ActivityController < ApplicationController
  def index
    render json: activities.select(:id, :external_id).order(order).limit(limit)
  end

  def show
    render json: activities.find_by(external_id: activity_params[:id])
  end

  private

  def activities
    if activity_params[:user_id]
      User.find(activity_params[:user_id]).activities
    else
      Activity.all
    end
  end

  def limit
    activity_params[:limit]
  end

  def order
    case activity_params[:order]
    when 'fastest'
      return { average_speed: :asc }
    when 'longest'
      return { total_distance: :desc }
    else
      return { start_time: :desc }
    end
  end

  def activity_params
    params.permit(:limit, :id, :order, :user_id)
  end

end 