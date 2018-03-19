PatientAnswer.destroy_all
AlertRaiser.destroy_all
SuggestedAnswer.destroy_all
Question.destroy_all
AnswerType.destroy_all
Surgery.destroy_all
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

knee = SurgeryType.create(description: "Ligamentoplastie du genou")

puts "Created surgery type Ligamentoplastie"

pre_form_knee = Form.new(pre_or_post: "pre")
pre_form_knee.surgery_type = knee
pre_form_knee.hospital = clinique_du_sport
pre_form_knee.save

post_form_knee = Form.new(pre_or_post: "post")
post_form_knee.surgery_type = knee
post_form_knee.hospital = clinique_du_sport
post_form_knee.save

yes_or_no_mandatory = AnswerType.create(description: "Yes or No", has_photo: false, accept_multiple_answers: false, is_mandatory: true)

question_anesth = Question.new(content: "Avez vous eu la consultation avec l anesthesiste ?")
question_anesth.form = pre_form_knee
question_anesth.answer_type = yes_or_no_mandatory
question_anesth.save

yes = SuggestedAnswer.new(content: "Yes")
yes.question = question_anesth
yes.save

no = SuggestedAnswer.new(content: "No")
no.question = question_anesth
no.save

first_alert = AlertRaiser.new(alert_type: 1, field_to_check: "No")
first_alert.question = question_anesth
first_alert.save

puts "Created pre and post forms for Ligamentoplasty surgery in clinique du sport"

patient_pre = Surgery.new(is_done: false, date: Date.today)
patient_pre.patient = david
patient_pre.surgery_type = knee
patient_pre.surgeon = guilhem
patient_pre.pre_form = pre_form_knee
patient_pre.post_form = post_form_knee
patient_pre.save

puts "Created a patient entry"

david_answer = PatientAnswer.new(content: "No")
david_answer.question = question_anesth
david_answer.surgery = patient_pre
david_answer.save

puts "David has answered!"

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
