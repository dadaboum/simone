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
    3
  end

  def nb_post_op_orange_flag
    Surgery.where("is_done=false").count
  end

  def nb_post_op_yellow_flag
    Surgery.where("is_done=? and post_form_answered=?", "false","false").count
  end

  def nb_post_op_green_flag
    Surgery.where("is_done=false and post_form_answered=true").count
  end

  def nb_post_op_red_flag
    sprintf("%.2f", 10.0 / 12.0 * 100).to_f
  end
end
