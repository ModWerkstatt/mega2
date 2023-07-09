function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "schweiz", "db", "waggon", "goods", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "megaiifake",
				name = _("Fake_mega_ii_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_mega_ii_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	
        local hidden = {
			["1989_fake.mdl"] = true,
			["1998_fake.mdl"] = true,
			["2003_fake.mdl"] = true,
            ["2004_fake.mdl"] = true,   
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/mega_ii_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["megaiifake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

	end
	}
end
