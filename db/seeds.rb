Form.destroy_all
SurgeryType.destroy_all
Patient.destroy_all
Surgeon.destroy_all
User.destroy_all
Hospital.destroy_all

puts "Destroyed all DB"

clinique_du_sport = Hospital.create(name:"Clinique du Sport")

puts "Created hospital Clinique du sport"

simone = User.new(email: "simone@gmail.com", password: "motdepasse")
simone.hospital = clinique_du_sport
simone.save

puts "Created Nurse Simone"

guilhem = Surgeon.create(name:"Guilhem", email:"guilhem@gmail.com")

puts "Created Dr Guilhem"

david = Patient.new(first_name: "David", last_name: "Benamran", phone_number: "0672303881")
david.hospital = clinique_du_sport
david.save

jonathan = Patient.new(first_name: "Jonathan", last_name: "Joubert", phone_number: "0677509667")
jonathan.hospital = clinique_du_sport
jonathan.save

puts "Created patients David and Jonathan"

hip = SurgeryType.create(description: "Prothèse de hanche")

puts "Created surgery type Prothèse de hanche"

pre_form_hip = Form.new(pre_or_post: "pre")
pre_form_hip.surgery_type = hip
pre_form_hip.hospital = clinique_du_sport
pre_form_hip.save

post_form_hip = Form.new(pre_or_post: "post")
post_form_hip.surgery_type = hip
post_form_hip.hospital = clinique_du_sport
post_form_hip.save

puts "Created pre and post forms for hip surgery in clinique du sport"
