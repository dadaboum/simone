class MessagePostOpJob < ApplicationJob
  queue_as :default

  def perform
    req_pre_op1 = "SELECT last_name, first_name, phone_number, sg.id as id_s From Patients INNER JOIN Surgeries sg on Patients.id=sg.patient_id and sg.date='#{Date.yesterday}'"
    req_pre_op2 = "SELECT last_name, first_name, phone_number, description, id_s FROM (" + req_pre_op1 + ")T1 LEFT JOIN Events ev ON id_s=ev.surgery_id and description='message post-opératoire envoyé'"
    results = ActiveRecord::Base.connection.exec_query(req_pre_op2)

    # creation d'un hash avec le result de la requete (ensemble des patients avec une surgery is_done=false et description='TEXT MESSAGE').
    results.rows.each do |result|
      # result est un array avec [last_name, first_name, phone_number, description, id de la table surgeries]
      if result[3].nil?
        surgery = Surgery.find(result[3])
        typeform_post = Form.find(surgery.post_form_id).typeform_id
        message = "Bonjour #{result[1]} #{result[0]}, formulaire post-opératoire : https://davidbenamran.typeform.com/to/#{typeform_post}?surgery_id=#{result[3]}"
        TwilioTextMessenger.new(result[2], message).call
        event = Event.new(description: "SMS post-opératoire envoyé", flag: "green")
        surgery_patient = Surgery.find(result[4])
        surgery_patient.status = "non répondu"
        surgery_patient.save
        event.surgery = surgery_patient
        event.save
      end
    end
  end
end
