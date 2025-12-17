class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  def new
    @schedule = Schedule.new
  end
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :memo, :all_day))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました「ID:#{@schedule.id}」"
      redirect_to :schedules
    else
      render "new", status: :unprocessable_entity
    end
  end
  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :memo, :all_day))
      flash[:notice] = "IDが「#{@schedule.id}」の予定を変更しました"
      redirect_to :schedules
    else
      render "edit", status: :unprocessable_entity
    end
end
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定を削除しました「ID:#{@schedule.id}」"
    redirect_to schedules_path
  end
end
