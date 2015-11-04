#------------------- Constans related to Clan model -------------------------------------------

CLAN_NAMES = %w( Feniks Krab Smok 
                Jednorozec Lew Modliszka 
                Pajak Rody_Cesarskie Pomniejsze 
                Zuraw Skorpion Ronin )

CLAN_NAMES_PL = [ "Feniks", "Krab", "Smok", 
                "Jednorożec", "Lew", "Modliszka", 
                "Pająk", "Rody Cesarskie", "Pomniejsze", 
                "Żuraw", "Skorpion", "Ronin" ]

CLAN_NAMES_ARRAY = CLAN_NAMES_PL.zip(CLAN_NAMES)

#------------------- Constans related to School model -----------------------------------------
  #School model also use the CLAN_NAMES, CLAN_NAMES_PL and CLAN_NAMES_ARRAY constans

SCHOOL_CLASSES = [ "Bushi", "Shugenja", "Mnich", "Artysta", "Ninja", "Dworzanin" ]

#------------------- Constans related to Skill model -----------------------------------------

SKILL_SPHARES_ARRAY = [ ["Godne", "Godna" ],
                  ["Niegodne", "Niegodna" ],
                  ["Bugei", "Bugei"], 
                  ["Kupieckie", "Kupiecka"] ]

#------------------- Constans related to Spell model -----------------------------------------

SPELL_ELEMENTS_PL = [ "Ogień", "Woda", "Powietrze", "Ziemia", "Pustka", "Maho"]

SPELL_KRAG_ARRAY = [ [ "Pierszwy", "1" ], [ "Drugi", "2" ], [ "Trzeci", "3" ], 
                     [ "Czwarty", "4" ], [ "Piąty", "5" ], [ "Szósty", "6" ] ]

SPELL_TAGS_PL = [ "Rzemiosło", "Obrona", "Grom", "Pieczęć", "Bitwa", "Jadeit", "Podróż", "Iluzja", "Przepowiednie" ]

#------------------- Constans related to Trait model -----------------------------------------
TRAITS_KIND_SINGULAR = [ "Zaleta", "Wada"]
TRAITS_KIND_PLURAL = [ "Zalety", "Wady" ]
TRAITS_KIND_ARRAY = TRAITS_KIND_PLURAL.zip(TRAITS_KIND_SINGULAR)

TRAITS_SPHARE_SINGULAR = [ "Fizyczna", "Duchowa", "Społeczna", "Materialna", "Umysłowa"]
TRAITS_SPHARE_PLURAL = [ "Fizyczne", "Duchowe", "Społeczne", "Materialne", "Umysłowe"]
TRAITS_SPHARE_ARRAY = TRAITS_SPHARE_PLURAL.zip(TRAITS_SPHARE_SINGULAR)