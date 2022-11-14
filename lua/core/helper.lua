local helper = {}
local home = vim.env.HOME

function helper.get_config_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return home .. '/.config/nvim'
  end
  return config
end

function helper.get_data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return home .. '/.local/share/nvim'
  end
  return data
end

function helper.get_cache_path()
  local cache = os.getenv('XDG_CACHE_DIR')
  if not cache then
    return home .. '/.cache/nvim/'
  end
end

function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end

return helper
