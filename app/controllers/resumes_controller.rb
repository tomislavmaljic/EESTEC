class ResumesController < ApplicationController

  def index
    @resumes = Resume.all
    if params[:search]
      @resumes = Resume.search(params[:search]).order("created_at DESC")
    else
      @resumes = Resume.all.order('created_at DESC')
    end
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
       @resume = Resume.find(params[:id])
       if @resume.update_attributes(resume_params)
         redirect_to resumes_path(@resume), notice: "Podaci uspješno izmjenjeni!"
       else
         render 'edit'
       end
  end

  def show
      @resume = Resume.find(params[:id])
  end

private
  def resume_params
    params.require(:resume).permit(:name,:surname, :college, :year, :course, :email, :keywords, :member, :attachment)
  end
end
