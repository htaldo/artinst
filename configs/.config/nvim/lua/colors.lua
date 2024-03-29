local A = vim.api

A.nvim_set_hl(0, "ColorColumn", { ctermbg=9, bg=LightRed })
A.nvim_set_hl(0, "Normal", { ctermfg=15, fg=White })
A.nvim_set_hl(0, "Cursor", { ctermfg=15, fg=White })
A.nvim_set_hl(0, "Identifier", { ctermfg=15, fg=White })
A.nvim_set_hl(0, "Comment", { ctermfg=11, fg=LightYellow })
A.nvim_set_hl(0, "String", { ctermfg=2, fg=Green })
A.nvim_set_hl(0, "Statement", { ctermfg=9, fg=LightRed })
A.nvim_set_hl(0, "Conditional", { ctermfg=9, fg=LightRed })
A.nvim_set_hl(0, "NonText", { ctermfg=5, fg=Magenta })
A.nvim_set_hl(0, "Number", { ctermfg=5, fg=Magenta })
A.nvim_set_hl(0, "Special", { ctermfg=5, fg=Magenta })
A.nvim_set_hl(0, "Type", { ctermfg=12, fg=LightBlue })
A.nvim_set_hl(0, "PreProc", { ctermfg=2, fg=Green })
A.nvim_set_hl(0, "Function", { ctermfg=11, fg=LightYellow })
A.nvim_set_hl(0, "LineNr", { ctermfg=11, fg=LightYellow })
--A.nvim_command("redraw")
A.nvim_command("highlight ColorColumn ctermbg=Red")
--A.nvim_command("highlight LineNr ctermfg=LightYellow")
A.nvim_command("highlight Statement ctermfg=LightRed")
