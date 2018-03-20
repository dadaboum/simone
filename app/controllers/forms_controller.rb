class FormsController < ApplicationController

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.create(form_params)
    redirect_to forms_path
  end

  private

  def form_params
    params.require(:form).permit(:hospital_id, :typeform_id, :surgery_type_id)
  end
end
