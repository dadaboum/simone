FormAnswer.destroy_all
Event.destroy_all
Surgery.destroy_all
Form.destroy_all
SurgeryType.destroy_all
Patient.destroy_all
Surgeon.destroy_all
User.destroy_all
Hospital.destroy_all

# FYI : surgeries_statuses = ["red", "orange", "yellow", "green"]

puts "Destroyed all DB"

clinique_du_sport = Hospital.create(name:"Clinique du Sport")

puts "Created hospital Clinique du sport"

simone = User.new(email: "simone@gmail.com", password: "motdepasse")
simone.hospital = clinique_du_sport
simone.save

puts "Created Nurse Simone"

guilhem = Surgeon.create(name:"Dr Guilhem", email:"guilhem@gmail.com")
paul = Surgeon.create(name:"Dr Paul", email:"paul@gmail.com")

puts "Created Dr Guilhem and Dr Paul"

david = Patient.new(first_name: "David", last_name: "Benamran", phone_number: "0672303881")
david.hospital = clinique_du_sport
david.save

jonathan = Patient.new(first_name: "Jonathan", last_name: "Joubert", phone_number: "0677509667")
jonathan.hospital = clinique_du_sport
jonathan.save

paul = Patient.new(first_name: "Paul", last_name: "Ehrhardt", phone_number: "0677509667")
paul.hospital = clinique_du_sport
paul.save

marie = Patient.new(first_name: "Marie", last_name: "Robert", phone_number: "0677509667")
marie.hospital = clinique_du_sport
marie.save

jean = Patient.new(first_name: "Jean", last_name: "Laplace", phone_number: "0677509667")
jean.hospital = clinique_du_sport
jean.save

herve = Patient.new(first_name: "Herve", last_name: "Courland", phone_number: "0677509667")
herve.hospital = clinique_du_sport
herve.save

paula = Patient.new(first_name: "Paula", last_name: "Vande", phone_number: "0677509667")
paula.hospital = clinique_du_sport
paula.save

puts "Created patients David, Jonathan, Marie, Jean, Herve and Paula"

knee = SurgeryType.create(description: "Ligamentoplastie du genou")
ivf = SurgeryType.create(description: "FIV")
arthro = SurgeryType.create(description: "Arthroscopie")

puts "Created surgery type Ligamentoplastie, fiv and Arthroscopie"

pre_form_knee = Form.new(pre_or_post: "pre")
pre_form_knee.surgery_type = knee
pre_form_knee.hospital = clinique_du_sport
pre_form_knee.typeform_id = "Dcyfaj"
pre_form_knee.save

puts "Created J-1 form for the knee surgery"

post_form_knee = Form.new(pre_or_post: "post")
post_form_knee.surgery_type = knee
post_form_knee.hospital = clinique_du_sport
post_form_knee.typeform_id = "yccqO5"
post_form_knee.save

puts "Created J+1 form for the knee surgery"

david_operation = Surgery.new(is_done: false, date: Date.yesterday)
david_operation.patient = david
david_operation.surgery_type = knee
david_operation.surgeon = guilhem
david_operation.pre_form = pre_form_knee
david_operation.pre_form_answered = true
david_operation.status = "red"
david_operation.post_form_answered = false
david_operation.post_form = post_form_knee
david_operation.save!

david_event = Event.new(description: "Le questionnaire pré-opération a bien été envoyé", flag: "green")

david_event.surgery = david_operation
david_event.save!

david_event2 = Event.new(description: "Le patient a répondu au questionnaire. Une action est requise", flag: "orange")
david_event2.surgery = david_operation
david_event2.save!

david_event2 = Event.new(description: "Le patient a appelé directement le médecin, indiquant qu'il était pris de fièvre et ressentait des douleurs soudaines", flag: "red")
david_event2.surgery = david_operation
david_event2.save!

jonathan_operation = Surgery.new(is_done: true, date: Date.yesterday)
jonathan_operation.patient = jonathan
jonathan_operation.surgery_type = knee
jonathan_operation.surgeon = guilhem
jonathan_operation.pre_form_answered = true
jonathan_operation.post_form_answered = true
jonathan_operation.is_done = true
jonathan_operation.pre_flag = "green"
jonathan_operation.status = "orange"
jonathan_operation.pre_form = pre_form_knee
jonathan_operation.post_form = post_form_knee
jonathan_operation.save!


jonathan_event = Event.new(description: "message pré-opération envoyé", flag: "green")
jonathan_event.surgery = jonathan_operation
jonathan_event.save!

jonathan_event = Event.new(description: "formulaire pre op bien rempli", flag: "green")
jonathan_event.surgery = jonathan_operation
jonathan_event.save!

jonathan_event = Event.new(description: "message post-opération envoyé", flag: "green")
jonathan_event.surgery = jonathan_operation
jonathan_event.save!

jonathan_event = Event.new(description: "formulaire post op bien rempli", flag: "green")
jonathan_event.surgery = jonathan_operation
jonathan_event.save!

paul_operation = Surgery.new(is_done: false, date: Date.tomorrow)
paul_operation.patient = paul
paul_operation.surgery_type = knee
paul_operation.surgeon = guilhem
paul_operation.pre_form = pre_form_knee
paul_operation.status = "yellow"
paul_operation.post_form = post_form_knee
paul_operation.save!


marie_operation = Surgery.new(is_done: false, date: Date.tomorrow)
marie_operation.patient = marie
marie_operation.surgery_type = ivf
marie_operation.surgeon = guilhem
marie_operation.pre_form = pre_form_knee
marie_operation.pre_form_answered = true
marie_operation.status = "green"
marie_operation.post_form_answered = false
marie_operation.post_form = post_form_knee
marie_operation.save!

marie_event = Event.new(description: "message pré-opération envoyé")
marie_event.surgery = marie_operation
marie_event.save!

marie_event2 = Event.new(description: "Still no answer")
marie_event2.surgery = marie_operation
marie_event2.save!

paula_operation = Surgery.new(is_done: false, date: Date.tomorrow)
paula_operation.patient = paula
paula_operation.surgery_type = ivf
paula_operation.surgeon = guilhem
paula_operation.pre_form = pre_form_knee
paula_operation.pre_form_answered = true
paula_operation.status = "green"
paula_operation.post_form_answered = false
paula_operation.post_form = post_form_knee
paula_operation.save!

paula_event = Event.new(description: "message pré-opération envoyé")
paula_event.surgery = paula_operation
paula_event.save!

paula_event2 = Event.new(description: "Still no answer")
paula_event2.surgery = paula_operation
paula_event2.save!

jean_operation = Surgery.new(is_done: false, date: Date.tomorrow)
jean_operation.patient = jean
jean_operation.surgery_type = arthro
jean_operation.surgeon = guilhem
jean_operation.pre_form = pre_form_knee
jean_operation.pre_form_answered = true
jean_operation.status = "green"
jean_operation.post_form_answered = false
jean_operation.post_form = post_form_knee
jean_operation.save!

jean_event = Event.new(description: "message pré-opération envoyé")
jean_event.surgery = jean_operation
jean_event.save!

jean_event2 = Event.new(description: "Still no answer")
jean_event2.surgery = jean_operation
jean_event2.save!

herve_operation = Surgery.new(is_done: false, date: Date.tomorrow)
herve_operation.patient = herve
herve_operation.surgery_type = arthro
herve_operation.surgeon = guilhem
herve_operation.pre_form = pre_form_knee
herve_operation.pre_form_answered = true
herve_operation.status = "green"
herve_operation.post_form_answered = false
herve_operation.post_form = post_form_knee
herve_operation.save!

herve_event = Event.new(description: "message pré-opération envoyé")
herve_event.surgery = herve_operation
herve_event.save!

herve_event2 = Event.new(description: "Still no answer")
herve_event2.surgery = herve_operation
herve_event2.save!

puts "Created patients entries"

#Fill David's form answer
david_answer = FormAnswer.new(
  answer_array:
    [{"text"=>"Paul",
      "type"=>"text",
      "field"=>{"id"=>"BwkrCAIZf9zq", "type"=>"short_text"}},
     {"type"=>"boolean",
      "field"=>{"id"=>"rsQYJ9O2HGTl", "type"=>"yes_no"},
      "boolean"=>false},
     {"type"=>"boolean",
      "field"=>{"id"=>"OwPttXRme0l4", "type"=>"yes_no"},
      "boolean"=>false},
     {"text"=>"Je teste le weebook",
      "type"=>"text",
      "field"=>{"id"=>"ao3VeIldYuW0", "type"=>"long_text"}},
     {"type"=>"boolean",
      "field"=>{"id"=>"ojzWDYIPq11H", "type"=>"yes_no"},
      "boolean"=>true},
     {"type"=>"boolean",
      "field"=>{"id"=>"hbYvshy1Y5s6", "type"=>"yes_no"},
      "boolean"=>true},
     {"text"=>"Webhooktesting",
      "type"=>"text",
      "field"=>{"id"=>"OTOFL68Qk05p", "type"=>"short_text"}},
     {"type"=>"boolean",
      "field"=>{"id"=>"DX2VOxlsaWkH", "type"=>"yes_no"},
      "boolean"=>true},
     {"type"=>"boolean",
      "field"=>{"id"=>"C3MW1kwGj4z7", "type"=>"yes_no"},
      "boolean"=>false},
     {"text"=>"Eh",
      "type"=>"text",
      "field"=>{"id"=>"Uo8nUKpsBX5q", "type"=>"short_text"}}]
)
david_answer.form = pre_form_knee
david_answer.surgery = david_operation
david_answer.save!

puts "David has answered!"

puts "WARNING: you have to click on update for both forms on /forms"
# Formulaire pre operatoire - Ambulatoire Main
# Avez vous eu la consultation avec l'anesthesiste ? OUI(ok)/NON
# Avez vous eu un probleme de sante depuis la derniere consultation avec l'anesthesiste OUI/NON(ok) FIEVRE (>=38°C) VOMISSEMENT DIARHEE AUTRES
# Pouvez vous me confirmer l'intitule de votre intervention ? ***
# Avez vous prevu un accompagnant pour votre retour a domicile ? OUI(ok)/NON
# Avez vous prevu de ne pas rester seul(e) la nuit de votre intervention ? OUI(ok)/NON
# Avez vous besoin:
# Arret de travail ? OUI/NON(ok)
# Bon de transport Si oui prévoir un taxi ou VSL ? OUI/NON(ok)

# Rappel:
# Une douche et un shampoing avec vos produits habituels doivent etre pris la veille au soir ou le matin de votre intervention, une douche a la betadine sera prise a la clinique
# Depilez la zone a operer si besoin avec une tondeuse ou de la creme depilatoire
# Le vernis a ongles et le maquillage doivent etre retires la veille de l'intervention
# Il est deconseille de garder avec vous bijoux et objets de valeurs le jour de votre intervention
# Un jeune strict (interdiction de manger, de boire et de fumer) doit etre respecte 6h avant l'heure de convocation a la clinique
# Les derniers examens radiologiques et ou biologiques demandes par l'anesthesiste doivent etre apportes le jour de l'intervention
# Votre traitement habituel et l'ordonnance associee doivent etre apportes le jour de l'intervention
# Porter des vetements amples car le pansement peut etre volumineux

# Heure de convocation: 9h30

# Commentaires: par l'infirmiere

# Formulaire post operatoire Ligamentoplastie du genou
# Avez vous eu mal ? OUI/NON(ok) ECHELLE O a 10
# Avez vous pris vos medicaments pour la douleur ? OUI/NON(ok)
# Comment avez vous dormi, vous etes vous reveille cette nuit ? N'A PAS DORMI/NON(ok)/OUI
# Votre jambe est elle reveillee, votre pied bouge t il ? OUI(ok)/NON
# Avez vous enleve la sangle anti equin ? OUI(ok)/NON
# Avez vous mis de la glace sur votre genou ? OUI(ok)/NON
# Avez vous eu :
# Nausees  OUI/NON(ok)
# Vomissements OUI/NON(ok)
# Vertiges OUI/NON(ok)
# de l'anxiete OUI/NON(ok)
# Est que le pansement est tache OUI/NON(ok)
# Le genou est il gonfle ? OUI/NON(ok)
# Avez vous mal au mollet ? OUI/NON(ok)
# Avez vous eu de la fievre ? OUI/NON(ok)
# Avez vous un autre probleme medical ? OUI/NON(ok)

# Commentaires: par l'infirmiere
