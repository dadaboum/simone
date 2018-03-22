class FormsController < ApplicationController

require 'open-uri'
require 'json'

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    add_questions_to_form(@form.typeform_id, @form)
    @form.save
    redirect_to forms_path
  end

  def update
    @form = Form.find(params[:id])
    add_questions_to_form(@form.typeform_id, @form)
    @form.save
    redirect_to forms_path
  end

  private

  def form_params
    params.require(:form).permit(:hospital_id, :typeform_id, :surgery_type_id)
  end

  def add_questions_to_form(typeform_id, form)
    url = "https://api.typeform.com/v1/form/#{typeform_id}?key=#{ENV['TYPEFORM_API_KEY']}"
    data = JSON.parse(open(url).read)
    form.question_array = data["questions"]
  end
end
