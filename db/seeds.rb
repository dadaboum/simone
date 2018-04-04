FormAnswer.destroy_all
Event.destroy_all
Surgery.destroy_all
Form.destroy_all
SurgeryType.destroy_all
Patient.destroy_all
Surgeon.destroy_all
User.destroy_all
Hospital.destroy_all

# FYI : surgeries_statuses = ["alerte", "à vérifier", "ok", "non répondu"]

puts "Destroyed all DB"

clinique_du_sport = Hospital.create(name:"Hôpital Américain", photo: "gdka47htfsn2nsg2jsq1.jpg")

puts "Created hospital Clinique du sport"

simone = User.new(email: "simone@gmail.com", password: "motdepasse")
simone.hospital = clinique_du_sport
simone.last_name = "Benamran"
simone.first_name = "Paul"
simone.save

puts "Created Nurse Simone"



guilhem = Surgeon.create(name:"Dr Guilhem Devert", email:"davidbenamran@gmail.com")
pierre = Surgeon.create(name:"Dr Pierre Leroy", email:"davidbenamran@gmail.com")
jacques = Surgeon.create(name:"Dr Jacques Lecoq", email:"davidbenamran@gmail.com")

puts "Created Dr Guilhem, Dr Paul and Jacques"



david = Patient.new(first_name: "David", last_name: "Benamran", phone_number: "0672303881")
david.hospital = clinique_du_sport
david.save

david2 = Patient.new(first_name: "Yves", last_name: "Daval", phone_number: "0672306881")
david2.hospital = clinique_du_sport
david2.save

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

herve = Patient.new(first_name: "Pierre-Alexandre", last_name: "de la Rochefoucault", phone_number: "0677509667")
herve.hospital = clinique_du_sport
herve.save

paula = Patient.new(first_name: "Paula", last_name: "Vandemeulebroucke", phone_number: "0677509667")
paula.hospital = clinique_du_sport
paula.save

jeremy = Patient.new(first_name: "Jeremy", last_name: "Merlot", phone_number: "0677509667")
jeremy.hospital = clinique_du_sport
jeremy.save

puts "Created patients David, Jonathan, Marie, Jean, PA and Paula"


knee = SurgeryType.create(description: "Ligamentoplastie du genou")
rtij = SurgeryType.create(description: "Rupture des tendons ischio-jambier")
arthro = SurgeryType.create(description: "Arthroscopie")

puts "Created surgery type Ligamentoplastie, RTIJ and Arthroscopie"



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



david_operation = Surgery.new(is_done: true, date: Date.yesterday)
david_operation.patient = david
david_operation.surgery_type = knee
david_operation.surgeon = jacques
david_operation.pre_form = pre_form_knee
david_operation.pre_form_answered = true
david_operation.status = "non répondu"
david_operation.post_form_answered = false
david_operation.post_form = post_form_knee
david_operation.validated = false
david_operation.save!

david_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
david_event.surgery = david_operation
david_event.save!
david_event = Event.new(description: "Formulaire rempli : Ok - Rien à signaler", flag: "green")
david_event.surgery = david_operation
david_event.save!
david_event = Event.new(description: "SMS post-opératoire envoyé", flag: "green")
david_event.surgery = david_operation
david_event.save!


david2_operation = Surgery.new(is_done: true, date: Date.yesterday)
david2_operation.patient = david2
david2_operation.surgery_type = knee
david2_operation.surgeon = guilhem
david2_operation.pre_form = pre_form_knee
david2_operation.pre_form_answered = true
david2_operation.status = "non répondu"
david2_operation.post_form_answered = false
david2_operation.post_form = post_form_knee
david2_operation.validated = false
david2_operation.save!

david2_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
david2_event.surgery = david2_operation
david2_event.save!
david2_event2 = Event.new(description: "Formulaire rempli : Ok - Rien à signaler", flag: "green")
david2_event2.surgery = david2_operation
david2_event2.save!
david2_event3 = Event.new(description: "SMS post-opératoire envoyé", flag: "green")
david2_event3.surgery = david2_operation
david2_event3.save!


jonathan_operation = Surgery.new(is_done: false, date: Date.tomorrow)
jonathan_operation.patient = jonathan
jonathan_operation.surgery_type = knee
jonathan_operation.surgeon = jacques
jonathan_operation.pre_form_answered = false
jonathan_operation.post_form_answered = false
jonathan_operation.status = "non répondu"
jonathan_operation.pre_form = pre_form_knee
jonathan_operation.post_form = post_form_knee
jonathan_operation.validated = false
jonathan_operation.save!

jonathan_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
jonathan_event.surgery = jonathan_operation
jonathan_event.save!


paul_operation = Surgery.new(is_done: false, date: Date.tomorrow)
paul_operation.patient = paul
paul_operation.surgery_type = knee
paul_operation.surgeon = pierre
paul_operation.pre_form = pre_form_knee
paul_operation.status = "non répondu"
paul_operation.post_form = post_form_knee
paul_operation.validated = false
paul_operation.save!

paul_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
paul_event.surgery = paul_operation
paul_event.save!



marie_operation = Surgery.new(is_done: false, date: Date.tomorrow)
marie_operation.patient = marie
marie_operation.surgery_type = rtij
marie_operation.surgeon = pierre
marie_operation.pre_form = pre_form_knee
marie_operation.pre_form_answered = false
marie_operation.status = "non répondu"
marie_operation.post_form_answered = false
marie_operation.post_form = post_form_knee
marie_operation.validated = false
marie_operation.save!

marie_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
marie_event.surgery = marie_operation
marie_event.save!



paula_operation = Surgery.new(is_done: false, date: Date.tomorrow)
paula_operation.patient = paula
paula_operation.surgery_type = rtij
paula_operation.surgeon = jacques
paula_operation.pre_form = pre_form_knee
paula_operation.pre_form_answered = false
paula_operation.status = "non répondu"
paula_operation.post_form_answered = false
paula_operation.post_form = post_form_knee
paula_operation.validated = false
paula_operation.save!

paula_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
paula_event.surgery = paula_operation
paula_event.save!



jean_operation = Surgery.new(is_done: false, date: Date.tomorrow)
jean_operation.patient = jean
jean_operation.surgery_type = arthro
jean_operation.surgeon = pierre
jean_operation.pre_form = pre_form_knee
jean_operation.pre_form_answered = false
jean_operation.status = "à vérifier"
jean_operation.post_form_answered = false
jean_operation.post_form = post_form_knee
jean_operation.validated = false
jean_operation.save!

jean_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
jean_event.surgery = jean_operation
jean_event.save!

jean_event2 = Event.new(description: "Formulaire non complété", flag: "orange")
jean_event2.surgery = jean_operation
jean_event2.save!



herve_operation = Surgery.new(is_done: false, date: Date.tomorrow)
herve_operation.patient = herve
herve_operation.surgery_type = arthro
herve_operation.surgeon = guilhem
herve_operation.pre_form = pre_form_knee
herve_operation.pre_form_answered = false
herve_operation.status = "non répondu"
herve_operation.post_form_answered = false
herve_operation.post_form = post_form_knee
herve_operation.validated = false
herve_operation.save!

herve_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
herve_event.surgery = herve_operation
herve_event.save!


jeremy_operation = Surgery.new(is_done: true, date: Date.yesterday)
jeremy_operation.patient = jeremy
jeremy_operation.surgery_type = knee
jeremy_operation.surgeon = guilhem
jeremy_operation.pre_form = pre_form_knee
jeremy_operation.pre_form_answered = true
jeremy_operation.status = "non répondu"
jeremy_operation.post_form_answered = false
jeremy_operation.post_form = post_form_knee
jeremy_operation.validated = false
jeremy_operation.save!

jeremy_event = Event.new(description: "SMS pré-opératoire envoyé", flag: "green")
jeremy_event.surgery = jeremy_operation
jeremy_event.save!
jeremy_event2 = Event.new(description: "Formulaire rempli : Ok - Rien à signaler", flag: "green")
jeremy_event2.surgery = jeremy_operation
jeremy_event2.save!
jeremy_event3 = Event.new(description: "SMS post-opératoire envoyé", flag: "green")
jeremy_event3.surgery = jeremy_operation
jeremy_event3.save!


puts "Created patients entries"

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

# Bonjour, je suis infirmier à la clinique du Sport, au sein du service de chirurgie orthopédique.
# Ce que j'aime dans mon métier, c'est le contact avec les patients, avec mon expérience, en un coup d'oeil je peux évaluer leur état
# Mais le métier change, la médecine change. Plus d'un patient sur deux est aujourd'hui opéré chez nous en ambulatoire,
# arrivé le matin, opéré dans la journée, le patient dort chez lui le soir
# et moi, votre infirmier, on me demande d'assurer la meme suivi, à distance pour mes 80 patients quotidiens
# Heureusement nous utilisons le service de suivi CareOn
# Tous les matins à 9h15, le service prend des nouvelles de chaque patient, selon un questionnaire adopté à la chirurgie qu'ils viennent d'avoir.
# Les réponses sont traités et priorisés, et en un coup d'oeil je peux évaluer leur état
# par exemple voici la fiche, opéré hier il n'a pas répondu je l'appelle, rempli le questionnaire avec lui qu'il vienne aux urgence,
# je préviens le chirurgien et je valide la fiche, qui a été traité
# je retourne sur mes opérations, un niveau d'urgence moindre mais à suivre Paul je l'appelle pas de fievre tout est ok,
# je le mets en vert et le valide
# Tout ces patients vont tres bien, je vous lance je vais donner un coup de main en pédiatrie

# la side bar diminue quand mobile
# Il faut reprendre le texte du formulaire, reorganiser les questions

# Alerte signe warning (rouge)/ A vérifier Signe Point d interrogation (orange)/ Non répondu Signe horloge (gris)/ Ok Signe pouce up (vert)
