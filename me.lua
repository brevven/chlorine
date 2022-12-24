local me = {}

me.name = "bzchlorine"
me.list = {}

function me.starting_patch() 
  return (
      me.get_setting("bzchlorine-early-salt") == "mining" or
      me.get_setting("bzchlorine-early-salt") == "both"
  )
end

function me.early_assemblers() 
  return (
      me.get_setting("bzchlorine-early-salt") == "assembler" or
      me.get_setting("bzchlorine-early-salt") == "both" or
      (not me.salt())
  )
end

function me.more() 
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bzchlorine-more-intermediates") == "yes"
end

function me.salt() 
  return me.get_setting("bzchlorine-salt")
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end


return me
