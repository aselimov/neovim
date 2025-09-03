-- Statusline utilities

local M = {}

-- Function to get word count in status line
function M.getWords()
	-- the third string here is the string for visual-block mode (^V)
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
		return vim.fn.wordcount().visual_words .. ""
	else
		return vim.fn.wordcount().words .. ""
	end
end

return M