-- ============================================================
--  Forever Cast Bars — pack Paladin
--  Cadre en plaque d'armure rivetée d'or (les rivets s'allument),
--  remplissage doré et effets des prototypes paladin, composés avec
--  le kit de la base (PropsKit.lua). Exige ForeverCastBars.
--  Sans ce pack, les sorts du paladin gardent leur thème d'école.
-- ============================================================

if not (FCB and FCB.Looks and FCB.Looks.RegisterPack and FCB.Props and FCB.Props.Kit) then return end

local M = "Interface\\AddOns\\ForeverCastBars_Paladin\\textures\\"
local Props, K = FCB.Props, FCB.Props.Kit
local GOLD, WHITE = { 1, .85, .45 }, { 1, .97, .85 }
local function R(name, parts) Props.RegisterKit("pala_" .. name, parts) end

R("holylight",   { K.Wings(WHITE), K.Converge(WHITE, 10), K.IconGlow(WHITE), K.Pillar(WHITE, { width = 50 }), K.Burst(WHITE, "P_Star", 12, 60) })
R("flash",       { K.FromIcon(WHITE, "P_Star", 10, 1.6, 7), K.TipGlow(WHITE, 40, 12), K.Flash(WHITE, 200, .2) })
R("hammer",      { K.Spin("P_HolyHammer", 26), K.TipGlow(GOLD, 50, 8), K.Ring(GOLD, 200, { dur = .5 }) })
R("holywrath",   { K.Nova(GOLD), K.IconGlow(GOLD, 100), K.Ring(GOLD, 320, { dur = .7, at = "icon" }), K.Flash(WHITE, 260) })
R("exorcism",    { K.Rise({ 1, .95, .8 }, "P_Flame", 12, { speed = 45, size = 9, filled = true }), K.TipGlow(WHITE, 45), K.Pillar(WHITE, { width = 45 }) })
R("turnundead",  { K.Pillar({ 1, .95, .8 }, { atEnd = false, width = 30 }), K.Ring(WHITE, 200), K.Burst({ .85, .85, .9 }, "P_Soul", 6, 70) })
R("redemption",  { K.Wings(WHITE), K.Fall({ 1, .97, .85 }, "P_Leaf", 12, { speed = 22, size = 9 }), K.Pillar(WHITE, { atEnd = false, width = 40 }), K.Pillar({ 1, 1, .9 }, { width = 70 }) })
R("warhorse",    { K.Rise(GOLD, "P_Star", 10, { speed = 35, size = 7 }), K.FromIcon(GOLD, "P_Glow", 8, .8, 7), K.Ring(GOLD, 180), K.Burst(GOLD, "P_Star", 12, 60) })
R("vigil",       { K.Halos(WHITE, 5), K.Flash(WHITE, 240) })

local function S(props, extra)
    local L = { family = "pala_plate", fill = "Fill_holy_gold", props = { "pala_" .. props }, veil = GOLD, veilAlpha = { .1, .25 } }
    for k, v in pairs(extra or {}) do L[k] = v end
    return L
end
FCB.Looks:RegisterPack(M, {
    families = { "pala_plate" },
    spells = {
        pa_holylight  = S("holylight"),
        pa_flash      = S("flash", { wakeCurve = 1.4, veil = WHITE }),
        pa_hammer     = S("hammer", { wakeCurve = 1.2, shake = { finish = 6 } }),
        pa_holywrath  = S("holywrath"),
        pa_exorcism   = S("exorcism", { wakeCurve = 1.4, veil = WHITE }),
        pa_turnundead = S("turnundead", { wakeCurve = 1.4, veil = WHITE }),
        pa_redemption = S("redemption", { veil = WHITE }),
        pa_warhorse   = S("warhorse"),
        pa_vigil      = S("vigil", { wakeCurve = 1.4, veil = WHITE }),
    },
})
