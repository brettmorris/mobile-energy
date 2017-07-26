--Mobile Energy 1.0 by B-Buck (Bbuck of Eredar)

MobileEnergy = {
    isEnabled = true;
    barSize = 4;
    borderStyle = 1;
    alpha = 5;
    alphaSlider = 5;
    font = 0;
    lockFrame = false;
    incombat = false;
    disableOption = false;
}

local tempenergy = 2534;
local tempenergyType = 0;

function MobileEnergyStart(self)
    self:RegisterEvent("VARIABLES_LOADED")
    MobileEnergyOptions();
    SlashCmdList['MOBILEENERGY_SLASHCMD'] = MobileEnergy_SlashCommandHandler
    SLASH_MOBILEENERGY_SLASHCMD1 = "/mobileenergy"
end

function MobileEnergy_SlashCommandHandler(msg)
    InterfaceOptionsFrame_OpenToCategory("Mobile Energy");
end

function MobileEnergy_ShowOptions()
    if (MobileEnergy.disableOption == false) then
        MobileEnergyTooltip:Show();
    end
end


local MobileE_UpdateInterval = 1.0;
function MobileE_Main(self, elapsed) 
self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > MobileE_UpdateInterval) then
        local inLockdown = InCombatLockdown()
        if (MobileEnergy.incombat == true) then 
            if(inLockdown == true) then
                MobileEnergyFrame:Show()
            else
                MobileEnergyFrame:Hide()
            end
        end 
        self.TimeSinceLastUpdate = 0;
    end
end





local MobileE_BarUpdateInterval = 0.1;
function MobileE_BarOnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > MobileE_BarUpdateInterval) then    
        local currentenergy = UnitPower("Player");
        local currentenergyMax = UnitPowerMax("Player");
        local energyType = UnitPowerType("Player");
      
        if(tempenergyType ~= energyType) then
            dressMobileEnergyBar();
        end
        
        if (tempenergy ~= currentenergy) then
            MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
            MobileEnergyFrame_Bar:SetValue(currentenergy);
            MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);   
        end
        tempenergy = currentenergy;
        self.TimeSinceLastUpdate = 0;
    end
end


function MobileEnergyOptions()
    local MobileEOptions = CreateFrame("FRAME", "MobileEOptions", InterfaceOptionsFrame)
    MobileEOptions.name = "Mobile Energy"
    InterfaceOptions_AddCategory(MobileEOptions)
    MobileEOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
end

function dressMobileEnergyBar()
    local currentenergy = UnitPower("Player");
    local currentenergyMax = UnitPowerMax("Player");
    local energyType = UnitPowerType("Player");
    tempenergyType = energyType;
    if(UnitClass("Player") == 'Warrior') then
        MobileEnergyFrame_Bar:SetStatusBarColor(1.0,0,0)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Rogue') then
        MobileEnergyFrame_Bar:SetStatusBarColor(1.0,1.0,0)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Monk') then
        MobileEnergyFrame_Bar:SetStatusBarColor(1.0,1.0,0)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Mage') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Hunter') then
        MobileEnergyFrame_Bar:SetStatusBarColor(1,0.6,0.1)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Paladin') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Priest') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Warlock') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Shaman') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Death Knight') then
        MobileEnergyFrame_Bar:SetStatusBarColor(0.2,1.0,1.0)
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    if(UnitClass("Player") == 'Druid') then
        if(energyType == 0) then
            MobileEnergyFrame_Bar:SetStatusBarColor(0,0,0.8)
        end
        if(energyType == 1) then
            MobileEnergyFrame_Bar:SetStatusBarColor(1.0,0,0)
        end
        if(energyType == 3) then
            MobileEnergyFrame_Bar:SetStatusBarColor(1.0,1.0,0)
        end
        MobileEnergyFrame_Bar:SetMinMaxValues(0, currentenergyMax)
        MobileEnergyFrame_Bar:SetValue(currentenergy);
        MobileEnergyFrameText:SetText(currentenergy.." / "..currentenergyMax);
    end
    
    if(MobileEnergy.isEnabled == true) then
        MobileEnergyFrame:Show();
    else
        MobileEnergyFrame:Hide();
    end
    
end


function MEVariablesLoaded_OnEvent()
    if(MobileEnergy.isEnabled == nil) then
        MobileEnergy.isEnabled = true; 
        MobileEnergyOptionsFrame_CheckEnabled:SetChecked(true);
    else
        MobileEnergyOptionsFrame_CheckEnabled:SetChecked(MobileEnergy.isEnabled);
    end
    
    if (MobileEnergy.barSize == nil) then
        MobileEnergy.barSize = 4;
        MobileEnergyOptionsFrame_ScaleSlider:SetValue(4)
    else
        MobileEnergyOptionsFrame_ScaleSlider:SetValue(MobileEnergy.barSize)
    end
    
    if (MobileEnergy.borderStyle == nil) then
        MobileEnergy.borderStyle = 1;
        MobileEnergyOptionsFrame_BorderSlider:SetValue(1)
    else
        MobileEnergyOptionsFrame_BorderSlider:SetValue(MobileEnergy.borderStyle)
    end
    
    if (MobileEnergy.font == nil) then
        MobileEnergy.font = 0;
        MobileEnergyOptionsFrame_FontSlider:SetValue(0)
    else
        MobileEnergyOptionsFrame_FontSlider:SetValue(MobileEnergy.font)
    end
    
    if ((MobileEnergy.alpha == nil) or (MobileEnergy.alphaSlider == nil))then
        MobileEnergyOptionsFrame_AlphaSlider:SetValue(5)
        MobileEnergy.alpha = 5
        MobileEnergy.alphaSlider = 5;
    else
        MobileEnergyOptionsFrame_AlphaSlider:SetValue(MobileEnergy.alphaSlider)
    end
    
    if (MobileEnergy.lockFrame == nil) then
        MobileEnergy.lockFrame = false
        MobileEnergyOptionsFrame_LockCheck:SetChecked(false)
    else
        MobileEnergyOptionsFrame_LockCheck:SetChecked(MobileEnergy.lockFrame)
    end
    
    if (MobileEnergy.incombat == nil) then
        MobileEnergy.incombat = false;
    else
        MobileEnergyOptionsFrame_CombatCheck:SetChecked(MobileEnergy.incombat);
    end
    
    if (MobileEnergy.disableOption == nil) then
        MobileEnergy.disableOption = false;
    else
        MobileEnergyOptionsFrame_OptionCheck:SetChecked(MobileEnergy.disableOption);
    end

    dressMobileEnergyBar();
end

function MobileEnergyEnabledToggle()
    local isChecked = MobileEnergyOptionsFrame_CheckEnabled:GetChecked();
    if (isChecked == true) then
        MobileEnergy.isEnabled = true;
        MobileEnergyFrame:Show();
    else  
        MobileEnergy.isEnabled = false;
        MobileEnergyFrame:Hide();
    end
end

function MELockToggle()
    local isChecked = MobileEnergyOptionsFrame_LockCheck:GetChecked();
    if(isChecked == true) then
        MobileEnergy.lockFrame = true;
    else
        MobileEnergy.lockFrame = false;
    end
end

function MELockFrame(self)
    if(MobileEnergy.lockFrame == false) then
        self:StartMoving(); self.isMoving = true;
    end
end

function roundZero(inputNum)
    return math.floor(inputNum*math.pow(10,0)+0.5) / math.pow(10,0) 
end

function MobileEBarSize()
    local tempInt = MobileEnergyOptionsFrame_ScaleSlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
        MobileEnergyFrame:SetScale(0.7);
        MobileEnergy.barSize = 0;
    end
    if (tempInt == 1) then
        MobileEnergyFrame:SetScale(0.8);
        MobileEnergy.barSize = 1;
    end
    if (tempInt == 2) then
        MobileEnergyFrame:SetScale(0.9);
        MobileEnergy.barSize = 2;
    end
    if (tempInt == 3) then
        MobileEnergyFrame:SetScale(1.0);
        MobileEnergy.barSize = 3;
    end
    if (tempInt == 4) then
        MobileEnergyFrame:SetScale(1.2);
        MobileEnergy.barSize = 4;
    end
    if (tempInt == 5) then
        MobileEnergyFrame:SetScale(1.4);
        MobileEnergy.barSize = 5;
    end
    if (tempInt == 6) then
        MobileEnergyFrame:SetScale(1.6);
        MobileEnergy.barSize = 6;
    end
    if (tempInt == 7) then
        MobileEnergyFrame:SetScale(1.8);
        MobileEnergy.barSize = 7;
    end
    if (tempInt == 8) then
        MobileEnergyFrame:SetScale(2.0);
        MobileEnergy.barSize = 8;
    end
end


function MobileEBarBorder()
    local tempInt = MobileEnergyOptionsFrame_BorderSlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                    tile = true, tileSize = 16, edgeSize = 6, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.border = 0;
    end
    if (tempInt == 1) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                    tile = true, tileSize = 16, edgeSize = 10, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 1;
    end
    if (tempInt == 2) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 6, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 2;
    end
    if (tempInt == 3) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 10, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 3;
    end
    if (tempInt == 4) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 6, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 4;
    end
    if (tempInt == 5) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 10, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 5;
    end
    if (tempInt == 6) then
        MobileEnergyFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    tile = true, tileSize = 16, edgeSize = 8, 
                                    insets = { left = 0, right = 0, top = 0, bottom = 0 }});
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.borderStyle = 6;
    end
end

function MobileEBarAlpha()
    local tempInt = MobileEnergyOptionsFrame_AlphaSlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
        MobileEnergy.alpha = 0.0;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 0;
    end
    if (tempInt == 1) then
        MobileEnergy.alpha = 0.1;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 1;
    end
    if (tempInt == 2) then
        MobileEnergy.alpha = 0.2;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 2;
    end
    if (tempInt == 3) then
        MobileEnergy.alpha = 0.3;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 3;
    end
    if (tempInt == 4) then
        MobileEnergy.alpha = 0.4;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 4;
    end
    if (tempInt == 5) then
        MobileEnergy.alpha = 0.5;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 5;
    end
    if (tempInt == 6) then
        MobileEnergy.alpha = 0.6;
        MobileEnergyFrame:SetBackdropColor(0,0,0,MobileEnergy.alpha)
        MobileEnergy.alphaSlider = 6;
    end
end

function MobileEFontType()
    local tempInt = MobileEnergyOptionsFrame_FontSlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
        MobileEnergy.font = 0;
        MobileEnergyFrameText:SetFont("Fonts\\FRIZQT__.TTF", 8)
    end
    if (tempInt == 1) then
        MobileEnergy.font = 1;
        MobileEnergyFrameText:SetFont("Fonts\\ARIALN.TTF", 9)
    end
    if (tempInt == 2) then
        MobileEnergy.font = 2;
        MobileEnergyFrameText:SetFont("Fonts\\skurri.ttf", 9)
    end
    if (tempInt == 3) then
        MobileEnergy.font = 3;
        MobileEnergyFrameText:SetFont("Fonts\\MORPHEUS.ttf", 9)
    end
    if (tempInt == 4) then
        MobileEnergy.font = 4;
        MobileEnergyFrameText:SetFont("Fonts\\ARIALN.TTF", 8, "OUTLINE")
    end
    if (tempInt == 5) then
        MobileEnergy.font = 5;
        MobileEnergyFrameText:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
    end
    if (tempInt == 6) then
        MobileEnergy.font = 6;
        MobileEnergyFrameText:SetFont("Fonts\\skurri.ttf", 9, "OUTLINE")
    end
end

function OnclickOptionToggle()
    local checked = MobileEnergyOptionsFrame_OptionCheck:GetChecked();
    if (checked == true) then 
        MobileEnergy.disableOption = true;
    else
        MobileEnergy.disableOption = false;
    end
end

function MEcombatToggle()
    local combatChecked = MobileEnergyOptionsFrame_CombatCheck:GetChecked();
    if (combatChecked == true) then
        MobileEnergy.incombat = true;
    else
        MobileEnergy.incombat = false;
        MobileEnergyFrame:Show()
    end
end