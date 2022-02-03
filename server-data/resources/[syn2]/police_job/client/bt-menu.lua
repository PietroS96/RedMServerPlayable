Citizen.CreateThread(function()
    -- Duty Zones
    exports["bt-target"]:AddBoxZone("ValentineDuty", vector3(-277.1252, 804.5879, 118.3693), 2.0, 1.0, {
        name = "ValentineDuty",
        heading = 304.99996948242,
        debugPoly = false,
        minZ = 118.369,
        maxZ = 120.369
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("StrawberryDuty", vector3(-1810.87, -353.8824, 164.4594), 2.0, 1.0, {
        name = "StrawberryDuty",
        heading = 49.147708892822,
        debugPoly = false,
        minZ = 163.4594,
        maxZ = 165.4594
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"marshal", "offmarshal"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("TumbleweedDuty", vector3(-5530.153, -2930.262, -2.377144), 2.0, 1.0, {
        name = "TumbleweedDuty",
        heading = 295.00012207031,
        debugPoly = false,
        minZ = -2.377144,
        maxZ = 0.377144
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("ArmadilloDuty", vector3(-3624.659, -2602.753, -14.35343), 2.0, 1.0, {
        name = "ArmadilloDuty",
        heading = 205.00004577637,
        debugPoly = false,
        minZ = -14.35343,
        maxZ = -12.35343
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("BlackwaterDuty", vector3(-762.3663, -1271.987, 43.04415), 2.0, 1.0, {
        name = "BlackwaterDuty",
        heading = 89.999992370605,
        debugPoly = false,
        minZ = 43.04415,
        maxZ = 45.04415
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("SaintDenisDuty", vector3(2507.639, -1308.863, 47.95258), 2.0, 1.0, {
        name = "SaintDenisDuty",
        heading = 89.999984741211,
        debugPoly = false,
        minZ = 47.95258,
        maxZ = 49.95258
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("RhodesDuty", vector3(1362.335, -1303.659, 76.74143), 2.0, 1.0, {
        name = "RhodesDuty",
        heading = 250.00004577637,
        debugPoly = false,
        minZ = 76.74143,
        maxZ = 77.74143
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("FortWallaceDuty", vector3(342.6161, 1472.124, 178.7175), 2.0, 1.0, {
        name = "FortWallaceDuty",
        heading = 306.00006103516,
        debugPoly = false,
        minZ = 178.7175,
        maxZ = 179.7175
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("GovernmentDuty", vector3(2393.865, -1082.976, 51.43118), 2.0, 1.0, {
        name = "GovernmentDuty",
        heading = 179.43069458008,
        debugPoly = false,
        minZ = 51.43118,
        maxZ = 52.43118
    }, {
        options = {
            {
                event = "lawmen:goonduty",
                icon = "fas fa-clipboard",
                label = "Go on Duty",
            },
            {
                event = "lawmen:gooffduty",
                icon = "fas fa-clipboard",
                label = "Go off Duty",
            },
        },
        job = {"police", "offpolice"},
        distance = 3.0
    })
    -- Gun Cabinet Zones
    
    exports["bt-target"]:AddBoxZone("ValentineGunCabinet", vector3(-279.1195, 805.1283, 118.4004), 0.8, 1.0, {
        name = "ValentineGunCabinet",
        heading = 98.23169708252,
        debugPoly = false,
        minZ = 118.4004,
        maxZ = 120.4
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("StrawberryGunCabinet", vector3(-1814.174, -355.3881, 163.6477), 0.8, 1.0, {
        name = "StrawberryGunCabinet",
        heading = 154.99995422363,
        debugPoly = false,
        minZ = 163.6477,
        maxZ = 165.3477
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("TumbleweedGunCabinet", vector3(-5526.067, -2928.221, -1.467515), 0.8, 1.0, {
        name = "TumbleweedGunCabinet",
        heading = 295.00012207031,
        debugPoly = false,
        minZ = -1.467515,
        maxZ = 1.067515
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("ArmadilloGunCabinet", vector3(-3625.914, -2601.108, -13.314), 0.8, 1.0, {
        name = "ArmadilloGunCabinet",
        heading = 25.000043869019,
        debugPoly = false,
        minZ = -13.314,
        maxZ = -11.314
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("BlackwaterGunCabinet", vector3(-764.8386, -1273.058, 43.04159), 0.8, 1.0, {
        name = "BlackwaterGunCabinet",
        heading = 180.0,
        debugPoly = false,
        minZ = 43.04159,
        maxZ = 45.04159
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("SaintDenisGunCabinet", vector3(2494.58, -1304.277, 47.97145), 1.5, 1.0, {
        name = "SaintDenisGunCabinet",
        heading = 180.0,
        debugPoly = false,
        minZ = 47.97145,
        maxZ = 54.97145
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("SaintDenisGunCabinet2", vector3(2494.43, -1313.42, 47.97145), 1.5, 1.0, {
        name = "SaintDenisGunCabinet2",
        heading = 90.0,
        debugPoly = false,
        minZ = 47.97145,
        maxZ = 54.97145
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("RhodesGunCabinet", vector3(1361.76, -1306.12, 76.75977), 0.8, 1.0, {
        name = "RhodesGunCabinet",
        heading = 250.00004577637,
        debugPoly = false,
        minZ = 76.75977,
        maxZ = 78.75977
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
    exports["bt-target"]:AddBoxZone("FortWallaceCabinet", vector3(341.2675, 1471.05, 179.6389), 1.0, 1.0, {
        name = "FortWallaceCabinet",
        heading = 124.99995422363,
        debugPoly = false,
        minZ = 179.6389,
        maxZ = 181.3389
    }, {
        options = {
            {
                event = "lawmen:guncabinet",
                icon = "fas fa-clipboard",
                label = "Check Gun Cabinet",
            },
        },
        job = {"police"},
        distance = 3.0
    })
end)