class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  def new
    if params[:back]
      @micropost = Micropost.new(micropost_params)
    else
      @micropost = Micropost.new
    end
  end
  
  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: "ツイートしました。"
    else
      render 'new'
    end
  end

  def index
    @microposts = Micropost.all
  end
  
  def edit
  end
  
  def update
    if @micropost.update(micropost_params)
      redirect_to root_path, notice: "ツイートを更新しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to root_path, notice: "ツイートを削除しました"
  end

  def show
  end
  
  def confirm
    @micropost = Micropost.new(micropost_params)
    render 'edit' if @micropost.invalid?
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
