-- Editor enhancement plugins

return {
	"christoomey/vim-tmux-navigator",
	"kana/vim-textobj-user",
	"mechatroner/rainbow_csv",
	{
		"GCBallesteros/vim-textobj-hydrogen",
		dependencies = {
			"kana/vim-textobj-user",
		},
	},
	"godlygeek/tabular",
	"tpope/vim-sleuth",
	"norcalli/nvim-colorizer.lua",
	"ixru/nvim-markdown",
	"KeitaNakamura/tex-conceal.vim",
	"skywind3000/asyncrun.vim",
	"airblade/vim-gitgutter",
	"tpope/vim-abolish",
	"dhruvasagar/vim-table-mode",
}