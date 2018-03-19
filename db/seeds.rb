Hospital.destroy_all
User.destroy_all
Patient.destroy_all
SurgeryType.destroy_all

puts "Destroyed all"

clinique_du_sport = Hospital.create(name:"Clinique du Sport")

simone = User.new(email: "simone@gmail.com")
simone.hospital = clinique_du_sport
simone.save

puts "created Nurse Simone"

guilhem = Surgeon.create(name:"Guilhem", email:"guilhem@gmail.com")

puts "Created Dr Guilhem"

david = Patient.new(first_name: "David", last_name: "Benamran", phone_number: "0672303881")
david.hospital = clinique_du_sport
david.save

jonathan = Patient.new(first_name: "Jonathan", last_name: "Joubert", phone_number: "0677509667")
jonathan.hospital = clinique_du_sport
jonathan.save

puts "Created patients David and Jonathan"

hip = SurgeryType.new(description: "Prothèse de hanche")
hip.save

puts "Created surgery type Prothèse de hanche"

pre_form_hip = Form.new(pre_or_post: "pre")
pre_form_hip.surgery_type = hip
pre_form_hip.hospital = clinique_du_sport
pre_form_hip.save

post_form_hip = Form.new(pre_or_post: "post")
post_form_hip.surgery_type = hip
post_form_hip.hospital = clinique_du_sport
post_form_hip.save

puts "created pre and post forms for hip surgery in clinique du sport"


