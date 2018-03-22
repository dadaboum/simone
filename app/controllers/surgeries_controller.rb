class SurgeriesController < ApplicationController
before_action :set_surgery, only: [:show, :update]

  def show
    @surgery = Surgery.find(params[:id])
    @surgeries = current_user.hospital.surgeries
    # Return array of forms
    answers = FormAnswer.where(surgery_id: @surgery.id)
    answers.each do |answer|
      @pre_form_answer = answer if answer.form.pre_or_post == "pre"
      @post_form_answer = answer if answer.form.pre_or_post == "post"
    end
  end

  def update
    @surgery = Surgery.find(params[:id])
    @surgery.update(surgery_params)
    redirect_to "#{surgery_path(@surgery)}?feature=form"
  end

  private

  def set_surgery
    @surgery = Surgery.find(params[:id])
  end

  def surgery_params
    params.require(:surgery).permit(:pre_comments)
  end
end


# surgery_path(surgery, flag: "red")

# (surgery.date < Date.today ? POST : PRE)
