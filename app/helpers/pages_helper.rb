module PagesHelper
                                  # HELPER POUR LE DASHBOARD COTE PRE OPERATION
  def nb_pre_op_orange_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and (status is null or status='à traiter'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='non répondu'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='ok'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_pre_op_red_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}' and status='urgent'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.tomorrow}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end
                              # HELPER POUR LE DASHBOARD COTE POST OPERATION
  def nb_post_op_orange_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and (status='à traiter' or status is null)").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_yellow_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='non répondu'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end

  def nb_post_op_green_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='ok'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
    # Surgery.where("is_done=true and post_form_answered=false").count
  end

  def nb_post_op_red_flag
    a = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}' and status='urgent'").count).to_f
    b = sprintf("%.2f", Surgery.where("date='#{Date.yesterday}'").count).to_f
    sprintf("%.2f", a / b * 100).to_f
  end
end
