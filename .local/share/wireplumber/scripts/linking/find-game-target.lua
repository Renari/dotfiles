lutils = require ("linking-utils")
log = Log.open_topic ("s-linking")

local function load_config ()
  local apps = {}
  local sink = Settings.get_string ("game-target.sink")

  local apps_str = Settings.get_string ("game-target.apps")
  if apps_str then
    for app in apps_str:gmatch ("([^,]+)") do
      app = app:match ("^%s*(.-)%s*$")
      if app ~= "" then
        apps [app] = true
      end
    end
  end

  return apps, sink
end

local function should_route (si_props, apps)
  if si_props ["media.role"] == "Game" then
    return true
  end
  for _, prop in ipairs ({ "node.name", "application.name", "application.process.binary" }) do
    if apps [si_props [prop]] then
      return true
    end
  end
  return false
end

SimpleEventHook {
  name = "linking/find-game-target",
  before = "linking/find-defined-target",
  interests = {
    EventInterest {
      Constraint { "event.type", "=", "select-target" },
    },
  },
  execute = function (event)
    local source, om, si, si_props, si_flags, target =
        lutils:unwrap_select_target_event (event)

    if target then
      return
    end

    local apps, sink = load_config ()

    if not sink then
      log:warning (si, "find-game-target: no sink defined in settings")
      return
    end

    if not should_route (si_props, apps) then
      return
    end

    for lnkbl in om:iterate { type = "SiLinkable" } do
      if lnkbl.properties ["node.name"] == sink then
        log:info (si, "find-game-target: routing " .. tostring (si_props ["node.name"]) .. " to " .. sink)
        event:set_data ("target", lnkbl)
        return
      end
    end

    log:warning (si, "find-game-target: sink '" .. sink .. "' not found, falling back")
  end
}:register ()

