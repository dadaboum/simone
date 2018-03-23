module PagesHelper
                                  # HELPER POUR LE DASHBOARD COTE PRE OPERATION
  def nb_pre_op_orange_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status is null").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='yellow'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='green'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_red_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='red'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end
                              # HELPER POUR LE DASHBOARD COTE POST OPERATION
  def nb_post_op_orange_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and (status='orange' or status is null)").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='yellow'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='green'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
    # Surgery.where("is_done=true and post_form_answered=false").count
  end

  def nb_post_op_red_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='red'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end
end
