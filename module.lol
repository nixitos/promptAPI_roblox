getgenv().PromptAPI = getgenv().PromptAPI or {}
local API = getgenv().PromptAPI
API._version = "1.0"
function API.triggerPrompt(prompt)
  if not fireproximityprompt or not prompt then return false end
  if not prompt:IsA("ProximityPrompt") then return false end
  fireproximityprompt(prompt)
  return true
end
function API.triggerAll(root)
  for _, v in ipairs(root:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
      API.triggerPrompt(v)
      task.wait(0.05)
    end
  end
end
function API.findPrompts(root)
  local o = {}
  for _, v in ipairs(root:GetDescendants()) do
    if v:IsA("ProximityPrompt") then table.insert(o, v) end
  end
  return o
end
function API.findPromptsByAction(root, actionText)
  local o = {}
  local target = string.lower(actionText)
  for _, v in ipairs(root:GetDescendants()) do
    if v:IsA("ProximityPrompt") and string.find(string.lower(v.ActionText), target, 1, true) then
      table.insert(o, v)
    end
  end
  return o
end
