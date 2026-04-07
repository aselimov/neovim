vim.opt_local.colorcolumn = "100"
vim.opt_local.textwidth = 100
vim.opt_local.expandtab = true

local function detect_indent(bufnr)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 100, false)
	local counts = {}
	for _, line in ipairs(lines) do
		local spaces = line:match("^( +)[^ ]")
		if spaces then
			local n = #spaces
			counts[n] = (counts[n] or 0) + 1
		end
	end
	-- find the smallest indent size with meaningful usage
	for _, size in ipairs({ 2, 4, 8 }) do
		if (counts[size] or 0) > 0 then
			return size
		end
	end
	return 4 -- default
end

local bufnr = vim.api.nvim_get_current_buf()
local size = detect_indent(bufnr)

vim.opt_local.shiftwidth = size
vim.opt_local.tabstop = size
vim.opt_local.softtabstop = size

-- update beautysh indent size for this buffer
local ok, conform = pcall(require, "conform")
if ok then
	conform.formatters.beautysh = {
		prepend_args = { "--indent-size", tostring(size) },
	}
end
