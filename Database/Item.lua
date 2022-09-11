-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.Item = {}
local Item = ns.Item

local expectedFields = {
	name = true,
	expansion = true,
	type = true,
	activity = true,
	itemId = true
}

function Item:OnInit()
	
end	