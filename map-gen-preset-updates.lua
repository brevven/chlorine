if data.raw["map-gen-presets"] and data.raw["map-gen-presets"].default then
  for name, preset in pairs(data.raw["map-gen-presets"].default) do 
    if type(preset) == "table" and 
      preset.basic_settings and 
      preset.basic_settings.autoplace_controls and 
      preset.basic_settings.autoplace_controls["iron-ore"] and 
      preset.basic_settings.autoplace_controls["salt"] then
        preset.basic_settings.autoplace_controls["salt"] = preset.basic_settings.autoplace_controls["iron-ore"]
    end
  end
end
