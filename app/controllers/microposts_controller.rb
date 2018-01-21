class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  NOTICE_MSG = { create: "つぶやきました", edit: "つぶやきを更新しました", destroy: "つぶやきを削除しました" } 

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
      redirect_to microposts_path, notice: NOTICE_MSG[:create]
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
      redirect_to microposts_path, notice: NOTICE_MSG[:edit]
    else
      render 'edit'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to microposts_path, notice: NOTICE_MSG[:destroy]
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
