/mob/living/simple_animal/hostile/russian
	name = "Russian"
	desc = "For the Motherland!"
	icon_state = "russianmelee"
	icon_living = "russianmelee"
	icon_dead = "russianmelee_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes the"
	response_disarm = "shoves the"
	response_harm = "hits the"
	speed = 0
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = I_HARM
	var/corpse = /obj/effect/landmark/mobcorpse/russian
	var/weapon1 = /obj/item/weapon/kitchen/knife
	unsuitable_atmos_damage = 15
	faction = list("russian")
	status_flags = CANPUSH


/mob/living/simple_animal/hostile/russian/ranged
	icon_state = "russianranged"
	icon_living = "russianranged"
	corpse = /obj/effect/landmark/mobcorpse/russian/ranged
	weapon1 = /obj/item/weapon/gun/projectile/revolver/mateba
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	projectiletype = /obj/item/projectile/bullet
	projectilesound = 'sound/weapons/Gunshot.ogg'
	casingtype = /obj/item/ammo_casing/a357

/mob/living/simple_animal/hostile/russian/ranged/New()
	if(prob(50) && ispath(weapon1,/obj/item/weapon/gun/projectile/revolver/mateba)) //to preserve varedits
		weapon1 = /obj/item/weapon/gun/projectile/shotgun/boltaction
		casingtype = /obj/item/ammo_casing/a762

/mob/living/simple_animal/hostile/russian/death()
	..()
	if(corpse)
		new corpse (src.loc)
	if(weapon1)
		new weapon1 (src.loc)
	qdel(src)
	return