class StudentControllerController < ApplicationController
  def index
      @dojo = Dojo.find(params[:dojo_id])
      @students = Student.where(dojo: @dojo)
  end

  def new
      @dojo = Dojo.find(params[:dojo_id])
  end

  def create
      @dojo = Dojo.find(params[:dojo_id])
      student = Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo: @dojo)
      if student.valid?
          flash[:errors] = ["A new student has been added successfully!"]
          redirect_to "/dojos/" + (params[:dojo_id]).to_s + "/students"
      else
          flash[:errors] = student.errors.full_messages
          redirect_to "/dojos/" + (params[:dojo_id]).to_s + "/students/new"
      end

  end

  def show
      @dojo = Dojo.find(params[:dojo_id])
      @student = Student.find(params[:id])
  end

  def edit
      @dojo = Dojo.find(params[:dojo_id])
      @dojos = Dojo.all
      @student = Student.find(params[:id])
  end

  def update
      dojo = Dojo.find(params[:dojo])
      student = Student.find(params[:id])
      student.first_name = params[:first_name]
      student.last_name = params[:last_name]
      student.email = params[:email]
      student.dojo = dojo
      student.save

      if student.valid?
          student.save
          flash[:errors] = ["The student has been updated successfully!"]
          redirect_to "/dojos/" + (dojo.id).to_s + "/students/"
      else
          flash[:errors] = student.errors.full_messages
          redirect_to "/dojos/" + (dojo.id).to_s + "/students/" + (student.id).to_s + "/edit"
      end
  end

  def destroy
      dojo = Dojo.find(params[:dojo_id])
      student = Student.find(params[:id])
      student.destroy
      redirect_to "/dojos/" + (dojo.id).to_s + "/students/"
  end
end
