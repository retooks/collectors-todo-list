-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ValueHandler = {}
local ValueHandler = ns.ValueHandler

local values = {}

function ValueHandler:AddValue(item, value)
    values[item.name] = { ["item"] = item, ["value"] = value }
end

function ValueHandler:GetValuesForField(itemField, fieldValue)
    local matchingValues = {}
    for itemName, val in pairs(values) do
        if val["item"][itemField] == fieldValue then
            table.insert(matchingValues, val["value"])
        end
    end
    return matchingValues
end