local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

-- Specific to handle l, L, h, H keymas
-- Taken from: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#h-j-k-l-style-navigation-and-editing
local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end
local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end
end
local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

nvim_tree.setup {
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" }
	},
	update_cwd = true,
	view = {
		mappings = {
			custom_only = false,
			list = {				
				{ key = "l", action = "edit", action_cb = edit_or_open },
				{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                		{ key = "h", action = "close_node" },
                		{ key = "H", action = "collapse_all", action_cb = collapse_all }
			}
		}
	},
	actions = {
        	open_file = {
            		quit_on_open = false
        	}
    	}
}
