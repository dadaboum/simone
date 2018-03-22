module PagesHelper
  def nb_pre_op_orange_flag
    Surgery.where("is_done=false").count
  end
  def nb_pre_op_yellow_flag
    Surgery.where("is_done=false and pre_form_answered=false").count
  end
  def nb_pre_op_green_flag
    Surgery.where("is_done=false and pre_form_answered=true").count
  end
  def nb_pre_op_red_flag
    0
  end
end
