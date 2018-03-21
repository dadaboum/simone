module PagesHelper
  def nb_pre_op_yellow_flag
    Surgery.where("is_done=false and pre_form_answered=false").count
  end
  def nb_pre_op_green_flag
    Surgery.where("is_done=true and pre_form_answered=true").count
  end
end
