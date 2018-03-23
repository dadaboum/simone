module PagesHelper

  def nb_pre_op_orange_flag
    a = 0
    # a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and is_done=false").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and is_done=false and pre_form_answered=false").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and is_done=false and pre_form_answered=true").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_red_flag
    0
  end

  def nb_post_op_orange_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and is_done=false").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and is_done=? and post_form_answered=?", "true","false").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and is_done=true and pre_form_answered=true").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
    # Surgery.where("is_done=true and post_form_answered=false").count
  end

  def nb_post_op_red_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and is_done=true and pre_form_answered=true").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    # sprintf("%.2f", a / b * 100).to_f
    0
  end
end
