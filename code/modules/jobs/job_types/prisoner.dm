/datum/job/prisoner
	title = "Prisoner"
	flag = PRISONER
	department_head = list("The Security Team")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the security team"
	random_spawns_possible = FALSE
	alt_titles = list(
		"Minimum Security Prisoner",
		"Maximum Security Prisoner",
		"SuperMax Security Prisoner",
		"Protective Custody Prisoner",
		"Security Slave"
		)

	outfit = /datum/outfit/job/prisoner
	plasma_outfit = /datum/outfit/plasmaman/prisoner

	display_order = JOB_DISPLAY_ORDER_PRISONER
	
	family_heirlooms = list(
		/obj/item/pen/blue
	)

/datum/job/prisoner/get_roundstart_spawn_point()
	return get_latejoin_spawn_point()

/datum/job/prisoner/after_spawn(mob/living/carbon/human/H, client/C)
	. = ..()
	var/list/policies = CONFIG_GET(keyed_list/policy)
	var/policy = policies[POLICYCONFIG_JOB_PRISONER]
	if(policy)
		var/mob/found = (H?.client && H)
		to_chat(found, "<br><span class='userdanger'>!!READ THIS!!</span><br><span class='warning'>The following is server-specific policy configuration and overrides anything said above if conflicting.</span>")
		to_chat(found, "<br><br>")
		to_chat(found, "<span class='boldnotice'>[policy]</span>")

/datum/outfit/job/prisoner
	name = "Prisoner"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/sneakers/orange
	id = /obj/item/card/id/prisoner
	ears = /obj/item/radio/headset/headset_prisoner
	belt = null
