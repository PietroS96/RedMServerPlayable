-- Menu configuration, array of menus to display
sharedconfigs = {
    ["shareddance1"] = {
        label = "Dance",
        dict1 = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
        anim1 = "arthur_dance_loop",
        dict2 = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
        anim2 = "karen_dance_loop",
        flag = 1
    },
}
menuConfigs = {
    ['mainmenu'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = PlayerPedId()
            return true--IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "F6",                 -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            lastmenu = 0,
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.25,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 1.0,         -- Maximum radius of wheel in percentage
                    labels = {"Job", "Stop Anim", "Other", "Reload Char", "Clothing", "Horse Emotes", "Walk Style", "Animations", "Check Gun", "Scenarios", "Mail"},
                    commands = {"job", "annullere", "other", "rc", "clothingmenu", "he", "walkstyle", "animations", "checkgun", "scenario", "mail"}
                }
            }
        }
    }
}

subMenuConfigs = {
    ['job'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.65,
                    labels = {"My job", "Give ID", "Pay Bills", "Doctor", "Police", "Alert Police", "Alert Doc", "Show Clan","Clan Menu","Remove Alerts"},
                    commands = {"showjob", "idcard", "paybills ","med", "mmenu", "alertpolice", "alertdoctor","showclan", "clanmenu", "calert"}
                },
            }
        }
    },
    ['clothingmenu'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.15,
                    maxRadiusPercent = 0.45,
                    labels = {"Sleeves", "Collar", "Bandana", "Hat", "Eyeware", "Mask", "Neckwear", "Undress", "Dress"},
                    commands = {"sleevesx", "sleeves2x", "bandanax", "hatx", "eyewearx", "maskx", "neckwearx",  "undressx", "dressx"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.45,
                    maxRadiusPercent = 0.80,
                    labels = {"Suspender", "Vest", "Coat", "Closed Coat", "Bow", "Armor", "Poncho", "Cloack", "Glove", "Rings", "Bracelet", "Accessories", "Tie", "shirt", "Loadouts"},
                    commands = {"suspenderx", "vestx", "coatx", "ccoatx", "bowx", "armorx", "ponchox", "cloackx", "glovex", "ringsx", "braceletx","accessoriesx", "necktiesx", "shirtx", "loadoutsx"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.80,
                    maxRadiusPercent = 1.00,
                    labels = { "Satchels", "Gunbelt accs", "Belt", "Buckle", "Pants", "Skirt", "Chaps", "Boots", "Spurs", "Spats", "Gauntlets"},
                    commands = { "satchelsx", "gunbeltaccsx", "beltx", "bucklex", "pantx", "skirtx", "chapx", "bootsx", "spursx", "spatsx", "gauntletsx"}
                },
            }
        }
    },

    ['other'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.85,
                    labels = {"Hud", "Delete Horse", "Delete Wagon", "Delete Campfire", "Delete Tent", "Flip Coin", "Forecast", "Hide Chat", "Race Menu", "RPS", "Pet Menu"},
                    commands = {"hud", "dh", "dv", "dcampfire", "dtent", "flipcoin", "forecast", "togglechat", "race", "rps", "petmenu"}
                },
                
            }
        }
    },
    ['walkstyle'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.85,
                    labels = {"Casual", "Crazy", "Drunk", "EasyRider", "Flamboyant", "Greenhorn", "Gunslinger", "Inquisitive", "Refined", "SilentType", "Veteran", "Default"},
                    commands = {"walkcasul ", "walkcrazy", "walkdrunk", "walkeasy", "walkflamboyant", "walkgreenhorn", "walkgunslinger", "walkinquisitive", "walkrefined", "walksilentType", "walkveteran", "walkremove"}
                },
                
            }
        }
    },
    ['he'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.75,
                    labels = {"Horse drink ", "Horse Rest", "Horse Sleep", "Horse Wallow"},
                    commands = {"horsedrink ", "horserest", "horsesleep", "horsewallow"}
                },
                
            }
        }
    },            
    ['animations'] = {
        data = {
            keybind = "F6",
            lastmenu = "mainmenu",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.25,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.55,         -- Maximum radius of wheel in percentage
                    labels = {"Greeting", "Actions", "Hurt", "Standing",  "Dance", "Mixed","Shared"},
                    commands = {"howdy", "handlinger", "skadet", "stående", "danse", "blandet","shared"}
                },
                
            }
        }
    },

    ['shared'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Dance"},
                    commands = { "shareddance1"}
                },
               --[[  {
                    navAngle = 270,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Neutral", "Gentle Wave", "Discreet Wave", "Friendly Wave", "Hyped Wave", "Sarcastic", "Humble", "Smooth"},
                    commands = {"neutralt", "gentlevink", "diskretvink", "venligvink", "hypedvink", "sarkastisk", "ydmyg", "smooth"}
                } ]]
            }
        }
    },
    
    ['howdy'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Gentle tip", "Discreet tip", "Excited tip", "Tip hat", "Fancy Bow", "Nod", "Tough"},
                    commands = { "gentletip", "diskrettip","svirphat", "tiphat", "fancybuk", "nik", "tough"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Neutral", "Gentle Wave", "Discreet Wave", "Friendly Wave", "Hyped Wave", "Sarcastic", "Humble", "Smooth"},
                    commands = {"neutralt", "gentlevink", "diskretvink", "venligvink", "hypedvink", "sarkastisk", "ydmyg", "smooth"}
                }
            }
        }
    },
    ['handlinger'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Lay Down", "Sit", "Sweat", "Freeze", "Knock", "Operation", "Cry", "Mourn"},
                    commands = {"sove", "sidde", "svede", "fryse", "bankpå", "betjening", "græde", "sørge"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Surrender", "Hostage", "Hands up", "Caught", "Cover", "Scared", "Piss", "Full", "Search", "Point", "Freezing cold", "Over Here"},
                    commands = {"overgiv", "Gidsel", "hænderop", "fanget", "dækning", "vige", "pisse", "fuld", "søge", "pege", "hidkald", "fagter"}
                }
            }
        }
    },
    ['skadet'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Arm", "Shoulder", "Hip", "Brystet", "Chest", "Neck", "Back"},
                    commands = { "armen", "skulder", "benet", "brystet", "hovedet", "halsen", "ryggen"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Dying", "Itches", "Uncomfortable", "Throw up", "Collapse", "Damage 1", "Damage 2", "Sick"},
                    commands = {"døende", "klørsig", "utilpas", "kastop", "kollaps", "lide1", "lide2", "syg"}
                }
            }
        }
    },
    ['danse'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Jig", "Awkward","Carefree","Smart","Confident","Drunk 1","Drunk 2","Confident","Wild 2","Drunk 3"},
                    commands = { "djig","dakavet","dubekymret","dsmart","dselvsikkert","dance1","dance2","dance3","dance4","dance5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Full","Simple","Formal","Graceful","The hassle","Hyped", "Cheerful", "Wild","Old","Confident 2","Carefree2","Awkward2"},
                    commands = {"dfuld","dsimpelt","dformelt","dyndefuldt","dbesværet","dhyped", "dmuntert", "dvildt","dance6","dance7","dance8","dance9"}
                }
            }
        }
    },
    ['stående'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Nervous", "Drunk", "Seductive", "Feminine", "Careless", "Impatient", "Pending"},
                    commands = { "nervøs", "beruset", "forførende", "feminint", "careless", "utålmodig", "opgivende", "afventende"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Hands Belt", "Hands Side", "Badass", "Cross arms", "Confused", "Abandoned", "Guard", "Clear", "Angry", "Sad"},
                    commands = {"hænderbælte", "hænderside", "badass", "krydsarme", "forvirret", "opgivende", "vagt", "klar", "vred", "trist"}
                }
            }
        }
    },
    ['blandet'] = {
        data = {
            keybind = "F6",
            lastmenu = "animations",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff0000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = { "Tak", "Please", "Quiet now", "Stinky", "Shh", "Fuck You", "Fight me", "keep up", "Yeeha", "Angry"},
                    commands = { "tak", "please", "rolignu", "puha", "shh", "fuckdig", "fightme", "følgmed", "yeeha", "satans"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.55,
                    maxRadiusPercent = 0.9,
                    labels = {"Sneaky", "Chicken", "Thumbs up", "Thumbs down", "Gorilla", "Careful", "Flap", "Laugh at", "Laugh", "Challenge", "Air kisses", "Mirror", "Notepad", "Check out", "Flex", "Threat"},
                    commands = {"lusket", "kylling", "thumbsup", "thumbsdown", "gorilla", "holdøje", "klap", "grineaf", "grine", "udfordre", "luftkys", "spejl", "notesblok", "tjekur", "flex", "trussel"}
                }
            }
        }
    },
        

}