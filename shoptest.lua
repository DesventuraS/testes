local WINDOW_ID = 4123
local BUTTON_ACCEPT = 0
local BUTTON_CLOSE = 1
local storage = 95214
vocs = {
{name = "Sorcerer", 
message = "Cada ponto adicionado aumenta +1 no respectivo skill", 
skill1 = "Magic lvl", skill1vlr = 10, magicStor1 = 95223,
skill2 = "Distance", skill2vlr = 10, distStor1 = 95224,
skill3 = "Melee", skill3vlr = 10, meleeStor1 = 95225,
skill4 = "Shield", skill4vlr = 10, shieldStor1 = 95226},
{name = "Druid",
message = "Cada ponto adicionado aumenta +1 no respectivo skill",
skill1 = "Magic lvl", skill1vlr = 10, magicStor1 = 95223,
skill2 = "Distance", skill2vlr = 10, distStor1 = 95224,
skill3 = "Melee", skill3vlr = 10, meleeStor1 = 95225,
skill4 = "Shield", skill4vlr = 10, shieldStor1 = 95226},
{name = "Paladin",
message = "Cada ponto adicionado aumenta +1 no respectivo skill",
skill1 = "Magic lvl", skill1vlr = 10, magicStor1 = 95223,
skill2 = "Distance", skill2vlr = 10, distStor1 = 95224,
skill3 = "Melee", skill3vlr = 10, meleeStor1 = 95225,
skill4 = "Shield", skill4vlr = 10, shieldStor1 = 95226},
{name = "Knight", 
message = "Cada ponto adicionado aumenta +1 no respectivo skill", 
skill1 = "Magic lvl", skill1vlr = 10, magicStor1 = 95223,
skill2 = "Distance", skill2vlr = 11, distStor1 = 95224,
skill3 = "Melee", skill3vlr = 12, meleeStor1 = 95225, 
skill4 = "Shield",  skill4vlr = 15, shieldStor1 = 95226}
}
configs = {
   {name = "xp", storage = 95215, storage2 = 95216, valor = 100, title = "Xp Bonus", message = "pontos sao necessarios para subir 1 nivel, cada nivel acrescenta uma porcentagem de xp, no momento seu bonus e de ", bonus = 10, message2 = "%"},
   {name = "loot", storage = 95217, storage2 = 95218, valor = 5, title = "Loot extra", message = " pontos sao necessarios para subir um nivel, cada ponto aumenta a porcentagem de drop em 5%, no momento seu bonus e de ", bonus = 5, message2 = "%"},
   {name = "skill", storage = 95219, storage2 = 95220, valor = 5, title = "Skill", message = "cada ponto aumenta 1 ponto de skill", bonus = 5, message2 = ""},
   {name = "regen", storage = 95221, storage2 = 95222, valor = 5, title = "Regen", message = "cada ponto aumenta sua regen em 5", bonus = 5, message2 = ""},
}
local shop2 = TalkAction("!shop2")
function shop2.onSay(player, words, param)
    for _, config in ipairs(configs) do
        if player:getStorageValue(config.storage) < 0 then
            player:setStorageValue(config.storage, 0)
        end
        if player:getStorageValue(config.storage2) < 0 then
            player:setStorageValue(config.storage2, 0)
        end
    end



storagemodal = {
{storage = 95223, skill = "Magic lvl"},
{storage = 95224, skill = "Distance"},
{storage = 95225, skill = "Melee"},
{storage = 95226, skill = "Shield"},

}

for _, storagemoda in ipairs(storagemodal) do
    if player:getStorageValue(storagemoda.storage) < 0 then
        player:setStorageValue(storagemoda.storage, 0)
    end
end

local magicStor = player:getStorageValue(storagemodal[1].storage)
local distStor = player:getStorageValue(storagemodal[2].storage)
local meleeStor = player:getStorageValue(storagemodal[3].storage)
local shieldStor = player:getStorageValue(storagemodal[4].storage)



    --player:addCondition(skillupskillUpDistance)

  local stor1 = player:getStorageValue(configs[1].storage)
  local stor2 = player:getStorageValue(configs[2].storage)
  local stor3 = player:getStorageValue(configs[3].storage)
  local stor4 = player:getStorageValue(configs[4].storage)
  local storXvalor1 = player:getStorageValue(configs[1].storage) * configs[1].valor
  local storXvalor2 = player:getStorageValue(configs[2].storage) * configs[2].valor
  local storXvalor3 = player:getStorageValue(configs[3].storage) * configs[3].valor
  local storXvalor4 = player:getStorageValue(configs[4].storage) * configs[4].valor
    local vocation = player:getVocation():getBaseId()

    local skillxValor5 = player:getStorageValue(vocs[vocation].magicStor1) * vocs[vocation].skill1vlr
    local skillxValor2 = player:getStorageValue(vocs[vocation].distStor1) * vocs[vocation].skill2vlr
    local skillxValor3 = player:getStorageValue(vocs[vocation].meleeStor1) * vocs[vocation].skill3vlr
    local skillxValor4 = player:getStorageValue(vocs[vocation].shieldStor1) * vocs[vocation].skill4vlr

    local fail = ModalWindow{title = "Pontos", message = "voce nao tem pontos suficientes"}
    local skillmodal = ModalWindow{title = vocs[vocation].name, message = vocs[vocation].message}
    local lvl = player:getLevel()
    player:setStorageValue(storage, lvl)

--      player:addCondition(potion.condition)
    local skillUpMagic = Condition(CONDITION_ATTRIBUTES)
    skillUpMagic:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, magicStor)
    skillUpMagic:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000) 
    local skillUpDistance = Condition(CONDITION_ATTRIBUTES)
    skillUpDistance:setParameter(IMBUEMENT_SKILLBOOST_DISTANCE, distStor)
    skillUpDistance:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
    local skillUpAxe = Condition(CONDITION_ATTRIBUTES)
    skillUpAxe:setParameter(CONDITION_PARAM_SKILL_MELEE, meleeStor)
    skillUpAxe:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
    local skillUpShield = Condition(CONDITION_ATTRIBUTES)
    skillUpShield:setParameter(CONDITION_PARAM_SKILL_SHIELD, shieldStor)
    skillUpShield:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
    local totlvl = player:getStorageValue(storage)
    local xpstor = player:getStorageValue(configs[1].storage)
    local lootstor = player:getStorageValue(configs[2].storage)
    local skillstor = player:getStorageValue(configs[3].storage)
    local regenstor = player:getStorageValue(configs[4].storage)
    local totpoints = totlvl - (storXvalor1 + storXvalor2 + storXvalor3 + storXvalor4 + skillxValor5 + skillxValor2 + skillxValor3 + skillxValor4)
    --local totpoints = totlvl - ((xpstor * storXvalor1) + (lootstor * storXvalor2) + (skillstor * storXvalor3) + (regenstor * storXvalor4) + (magicStor * skillxValor5) + (distStor * skillxValor2) + (meleeStor * skillxValor3) + (shieldStor * skillxValor4))
   -- local divisor = player:getStorageValue(configs[id].storage) / configs[id].valor

    cudecabrito = {
            {name = skillUpMagic},
            {name = skillUpDistance},
            {name = skillUpAxe},
            {name = skillUpShield}
    }

    local modal = ModalWindow{
        title = "Bonus",
        message = "Escolha o bonus que gostaria de adicionar e clique em [view], no momento voce tem [" .. totpoints .. "] pontos para distribuir.\n Pts = Pontos que voce ja adicionou. \n Vlr = Valor para subir 1 ponto."}
       -- local divisor = player:getStorageValue(configs[id].storage) / configs[id].valor)
    modal:addChoice(configs[1].name .. ": Pts = [" .. stor1 .. "], Vlr = [" .. configs[1].valor .. "].")
    modal:addChoice(configs[2].name .. ": Pts = [" .. stor2 .. "], Vlr = [" .. configs[2].valor .. "].")
    modal:addChoice(configs[3].name .. ": Pts = [" .. stor3 .. "], Vlr = [" .. configs[3].valor .. "].")
    modal:addChoice(configs[4].name .. ": Pts = [" .. stor4 .. "], Vlr = [" .. configs[4].valor .. "].")
    modal:addButton(string.format("view"), function (player, button, choice)
        local id = choice.id
    if button.name == "view" and id == 1 or id == 2 then
        --local id = choice.id
         modau = ModalWindow {
    title = configs[id].title,
    message = "[" .. configs [id].valor .. "] " .. configs[id].message .. " " .. (player:getStorageValue(configs[id].storage) * configs[id].bonus) .. configs[id].message2
}
modau:addButton(string.format("Add"), function(player, button, choice)
    if button.name == "Add" then
        upgrade = ModalWindow{
            title = configs[id].name .. " update",
            message = "Sao necessarios " .. configs[id].valor .. " pontos para adicionar +1 [Pts] em " .. configs[id].name .. ", no momento voce tem [" .. totpoints .. "] pontos, clique em [accept] para adicionar 1 ponto ou [back] para voltar."
        }
         upgrade:addButton(string.format("back"), function(player, button, choice)
            if button.name == "back" then
                modau:sendToPlayer(player)
            end
    end)
        upgrade:addButton(string.format("accept"), function(player, button, choice)
            if button.name == "accept" then
                local resultado = totpoints - configs[id].valor
                if resultado < 0 then
                    fail:addButton(string.format("back"), function(player, button, choice)
                        if button.name == "back" then
                            modau:sendToPlayer(player)
                        end
                end)
                fail:sendToPlayer(player)
            else
                player:setStorageValue(configs[id].storage, player:getStorageValue(configs[id].storage) + 1)
               -- modau:sendToPlayer(player)
            end
            end
    end)
            upgrade:sendToPlayer(player)
    end
end)
modau:addButton(string.format("reset"), function (player, button, choice)
        if button.name == "reset" then
            local totstor = player:getStorageValue(configs[id].storage)
            resetmdl = ModalWindow {
                title = "Reset " .. configs[id].name,
                message = "Voce gostaria de resetar seus pontos de " .. configs[id].name .. " no momento voce tem " .. totstor .. " pontos."
            }
            resetmdl:addButton(string.format("resetar"), function(player, button, choice)
                if button.name == "resetar" then
                    --player:setStorageValue(storage + totstor)
                    player:setStorageValue(configs[id].storage, 0) --teste
                end
        end)
            resetmdl:addButton(string.format("voltar"), function(player, button, choice)
                if button.name == "voltar" then
                    modau:sendToPlayer(player)
                end
                return true
        end)
                        resetmdl:sendToPlayer(player)
        end
end) 
modau:addButton(string.format("back"), function (player, button, choice)
        if button.name == "back" then
            modal:sendToPlayer(player)
        end
    end)
modau:sendToPlayer(player) 

           -- if button.name == "view" and id == 3 or id == 4 then
       else
    skillmodal:addChoice(vocs[vocation].skill1 .. " = Pts [" .. magicStor .. "], Vlr [" .. vocs[vocation].skill1vlr .. "]")
    skillmodal:addChoice(vocs[vocation].skill2 .. " = Pts [" .. distStor .. "], Vlr [" ..  vocs[vocation].skill2vlr .. "]")
    skillmodal:addChoice(vocs[vocation].skill3 .. " = Pts [" .. meleeStor .. "], Vlr [" ..   vocs[vocation].skill3vlr .. "]")
    skillmodal:addChoice(vocs[vocation].skill4 .. " = Pts [" .. shieldStor .. "], Vlr [" ..   vocs[vocation].skill4vlr .. "]")     
    skillmodal:addButton("view", function(player, button, choice)
        id2 = choice.id
        accptmodal = ModalWindow {title = vocs[vocation].name .. ": " .. storagemodal[id2].skill, message = "voce gostaria de adicionar +1 em " .. storagemodal[id2].skill .. "? voce tem: [" .. totpoints .. "] level points para distribuir."}
        if button.name == "view" then
                        accptmodal:addButton("reset", function(player, button, choice)
           if button.name == "reset" then
            player:setStorageValue(storagemodal[id2].storage, 0)

           end


        end)
            accptmodal:addButton("accept", function(player, button, choice)
                if button.name == "accept" then
                    player:setStorageValue(storagemodal[id2].storage, player:getStorageValue(storagemodal[id2].storage) +1)
                end
    local skillId = SKILL_DISTANCE
    for i = 1, count do
        player:addSkillTries(skillId, player:getVocation():getRequiredSkillTries(skillId, player:getSkillLevel(skillId) + 1) - player:getSkillTries(skillId), true)
    end
        end)


        end
                    accptmodal:sendToPlayer(player)
     -- player:setStorageValue(storagemodal[id].storage, player:getStorageValue(storagemodal[id].storage) + 1)  
end)
  --  skillmodal:addButton("back", function(player, button, choice)
    --    if button.name == "back" then
      --      modal:sendToPlayer(player)
       -- end

--end)
    skillmodal:sendToPlayer(player)
    end
end)
        modal:addButton("cancel")
    modal:sendToPlayer(player)
    return false
end
shop2:register()


       -- player:addCondition(potion.condition)