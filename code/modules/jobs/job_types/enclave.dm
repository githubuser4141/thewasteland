//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#323232"
	faction = FACTION_ENCLAVE
	exp_type = EXP_TYPE_ENCLAVE

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)
	forbids = "Enclave taboos: Female front line soldiers. Fraternizing with outsiders beyond what is absolutly necessary. Aiding Brotherhood members in any way no matter how small."
	enforces = "Enclave rules: You must maintain the secrecy of the bunker location. Stay in uniform. Act mature and respectful. Obey orders and always remember you are fighting for the only true legitimate power in this land of savages. Wearing gasmasks outside the compound is encouraged but not required."
	objectivesList = list("Department of Defense advisory: Collect resources and produce more Patribots, attrition is depleting our reserves.","Department of Defense advisory: Establish checkpoints to show presence, they must not forget who is the legitimate goverment.", "Science Divison advisory: Capture human subjects for experiments, alive. We have some new neurotoxin grenades we wish to do final tests with before field deployment.")

/datum/outfit/job/enclave
	id = null
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night/f13/enclave
	box = 			/obj/item/storage/survivalkit_aid

/datum/outfit/job/enclave/peacekeeper
	id = 			/obj/item/card/id/dogtag/enclave/trooper
	mask =			/obj/item/clothing/mask/gas/enclave
	neck =			/obj/item/storage/belt/holster/legholster
	backpack = 		/obj/item/storage/backpack/enclave
	satchel = 		/obj/item/storage/backpack/satchel/enclave
	belt = 			/obj/item/storage/belt/military/assault/enclave
	uniform = 		/obj/item/clothing/under/f13/enclave/peacekeeper
	r_pocket =		/obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves =		/obj/item/clothing/gloves/f13/military

/datum/outfit/job/enclave/noncombat
	id = 			/obj/item/card/id/dogtag/enclave/noncombatant
	backpack = 		/obj/item/storage/backpack/enclave
	satchel = 		/obj/item/storage/backpack/satchel/enclave
	belt = 			/obj/item/storage/belt/military/assault/enclave
	uniform = 		/obj/item/clothing/under/f13/enclave/science
	r_pocket =		/obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots

/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

/datum/outfit/job/enclave/peacekeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()



//Lieutenant
/datum/job/enclave/enclavelt
	title = "Enclave Lieutenant"
	flag = F13USLT
	total_positions = 1
	spawn_positions = 1
	description = "You are in command of the post, holding the rank of First Lieutenant- albiet honourably. Conduct research and help rebuild America with your Scientists aswell as any research your Scientists wish to pursue, utilise any resources available to you to achieve this."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavelt
	exp_requirements = 3000


	loadout_options = list(
		/datum/outfit/loadout/ballistics,	// FN FAL and Deagle
		/datum/outfit/loadout/plasmaman, 	// Plasma Rifle and Compliance Regulator
		)


/datum/outfit/job/enclave/peacekeeper/enclavelt
	name = "Enclave Lieutenant"
	jobtype = /datum/job/enclave/enclavelt
	head = 		/obj/item/clothing/head/f13/enclave
	uniform = 	/obj/item/clothing/under/f13/enclave/officer
	suit = 		/obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	accessory = /obj/item/clothing/accessory/ncr/LT1
	id = 		/obj/item/card/id/dogtag/enclave/officer

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/ballistics
	name = "Good Old Reliable"
	suit_store = /obj/item/gun/ballistic/automatic/fnfal
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m44= 2,
		/obj/item/ammo_box/magazine/m762 = 2,
		/obj/item/gun/ballistic/automatic/pistol/deagle = 1,
		)

/datum/outfit/loadout/plasmaman
	name = "The New Ordinary"
	suit_store = /obj/item/gun/energy/laser/plasma
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/energy/laser/complianceregulator  = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		)

/datum/outfit/job/enclave/peacekeeper/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


//Gunnery Sergeant

/datum/job/enclave/f13gysergeant
	title = "Enclave Gunnery Sergeant"
	flag = F13USGYSGT
	total_positions = 1
	spawn_positions = 1
	description = "You are the Quartermaster and Logistics Specialist. Your role is an advisory one that sees that the bunker has everything it needs; soldiers, medicine and food. These roles are yours, along with commanding the Sergeants and helping direct their squads."
	supervisors = "The Lieutenant."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13gysergeant
	exp_requirements = 2800

	loadout_options = list(
		/datum/outfit/loadout/usmc,	// LSW, MK23 and Riot Gear
		/datum/outfit/loadout/armoredinfantry, 	// AER12 and APA
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant
	name = "Enclave Gunnery Sergeant"
	jobtype = /datum/job/enclave/f13gysergeant
	accessory = 	/obj/item/clothing/accessory/ncr/FSGT

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/loadout/usmc
	name = "Your U.S Marine Corps Past"
	head =			/obj/item/clothing/head/helmet/f13/enclave/usmcriot
	suit = 			/obj/item/clothing/suit/armor/f13/usmcriot
	suit_store = 	/obj/item/gun/ballistic/automatic/lsw
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		)

/datum/outfit/loadout/armoredinfantry
	name = "Armored Infantry"
	head =			/obj/item/clothing/head/helmet/f13/power_armor/x02helmet
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/x02
	suit_store = 	/obj/item/gun/energy/laser/aer12
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)


//Sergeant

/datum/job/enclave/enclavesgt
	title = "Enclave Sergeant"
	flag = F13USSGT
	total_positions = 2
	spawn_positions = 2
	description = "Entrused with the command of the squads assigned to the bunker, your job is to assist the Lieutenant alongside the scientists."
	supervisors = "The Lieutenant and the Gunnery Sergeant."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavesgt
	exp_requirements = 2400

/datum/outfit/job/enclave/peacekeeper/enclavesgt
	name = "Enclave Sergeant"
	jobtype = /datum/job/enclave/enclavesgt
	suit = 			/obj/item/clothing/suit/armor/f13/combat/mk2/remnant
	suit_store = 	/obj/item/gun/ballistic/automatic/assault_rifle
	head = 			/obj/item/clothing/head/helmet/f13/combat/mk2/remnant
	accessory =     /obj/item/clothing/accessory/ncr/SGT

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/clothing/head/f13/enclave/peacekeeper = 1,
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

//Specialist

/datum/job/enclave/f13specialist
	title = "Enclave Specialist"
	flag = F13USSPECIALIST
	total_positions = 2
	spawn_positions = 2
	description = "You are an operative for the remnants of the Enclave. You, unlike the normal privates, have recieved specialist training in either engineering or medicine."
	supervisors = "The Lieutenant and the Sergeants."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13specialist
	exp_requirements = 1400


	loadout_options = list(
		/datum/outfit/loadout/combatmedic, // Medical Equipment
		/datum/outfit/loadout/combatengie, // Grenade Launcher
		)

/datum/outfit/job/enclave/peacekeeper/f13specialist
	name = "Enclave Specialist"
	jobtype = /datum/job/enclave/f13specialist
	suit = 			/obj/item/clothing/suit/armor/bulletproof
	accessory = 	/obj/item/clothing/accessory/ncr/SPC
	suit_store = 	/obj/item/gun/ballistic/automatic/smg/mp5

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/ammo_box/magazine/uzim9mm = 2,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/combatmedic
	name = "Combat Medic"
	mask = /obj/item/clothing/mask/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	head = /obj/item/clothing/head/beret/enclave/science
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/gun/medbeam = 1,
		)

/datum/outfit/loadout/combatengie
	name = "Combat Engineer"
	mask = /obj/item/clothing/mask/gas/welding
	gloves = /obj/item/clothing/gloves/color/yellow
	head = /obj/item/clothing/head/hardhat/orange
	suit_store = /obj/item/gun/ballistic/revolver/grenadelauncher
	backpack_contents = list(
		/obj/item/ammo_box/a40mm = 2,
		/obj/item/shovel/trench = 1,
	)


//Private
/datum/job/enclave/enclavespy
	title = "Enclave Private"
	flag = F13USPRIVATE
	total_positions = 4
	spawn_positions = 4
	description = "You are an operative for the remnants of the Enclave. You are to attempt to present the Enclave in a positive light to the population of the wasteland unless overt action is absolutely necessary."
	supervisors = "The Lieutenant and the Sergeants"
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavespy
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 1200

/datum/outfit/job/enclave/peacekeeper/enclavespy
	name = "Enclave Private"
	jobtype = /datum/job/enclave/enclavespy
	head = 			/obj/item/clothing/head/helmet/f13/combat/swat
	suit = 			/obj/item/clothing/suit/armor/f13/combat/swat
	accessory = 	/obj/item/clothing/accessory/ncr/REC
	suit_store =  	/obj/item/gun/ballistic/automatic/assault_carbine/worn

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/pda = 1,
		/obj/item/ammo_box/magazine/m5mm = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)


//NON-COMBATANTS

//Scientist
/datum/job/enclave/enclavesci
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	total_positions = 2
	spawn_positions = 2
	description = "You're responsible for the maintenance of the base, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in your field of research, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	supervisors = "Enclave Research and Development Division."
	outfit = /datum/outfit/job/enclave/noncombat/enclavesci
	exp_requirements = 2000

/datum/outfit/job/enclave/noncombat/enclavesci
	name = "Enclave Scientist"
	jobtype = /datum/job/enclave/enclavesci
	head = 			/obj/item/clothing/head/helmet/f13/envirosuit
	mask =			/obj/item/clothing/mask/breath/medical
	gloves = 		/obj/item/clothing/gloves/color/latex/nitrile
	suit = 			/obj/item/clothing/suit/armor/f13/environmentalsuit
	belt = 			/obj/item/storage/belt/medical
	suit_store =  	/obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/pda = 1,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/clothing/head/beret/enclave/science = 1,
		)

/datum/outfit/job/enclave/noncombat/enclavesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing
