vim.g.mapleader = " "

local keymap = vim.keymap -- for consiseness

-- GENERAL KEYMAPPING jkjkjkjkjkjkjkjkjjkjkjkjkjkjjkjkk

keymap.set("i", "jk", "<Esc>") -- exit from insert to normal mode

-- windows                                                                                                                                    
keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically     
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horrizontally. 
keymap.set("n", "<leader>we", "<C-w>=") -- makr split window equally.  
keymap.set("n", "<leader>wx", ":close<CR>") -- close window            
                                                                       
                                                                       
-- tabs                                                                
                                                                       
                                                                       
keymap.set("n", "<C-t>", ":tabnew<CR>") -- open new tab           
keymap.set("n", "<C-c>", ":tabclose<CR>") -- close tab            
                                                                       
keymap.set("n", "<leader>tn", ":tabn<CR>") -- switch to nexttab        
keymap.set("n", "<leader>tp", ":tabp<CR>") -- swotch to previous tab

-- Kill search highlights
keymap.set("n", "<CR>", "<cmd>noh<CR>") -- remove search highlights

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
---- KEPMAPPING FOR PLUGINS                                              
--                                                                       
---- szw/vim-maximizer                                                   
--                                                                       
--keymap.set("n", "<leader>wz", ":MaximizerToggle!<CR>") -- close window 
                                                                       
-- nvim-tree                                                           
                                                                       
keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>") -- close window    
keymap.set("n", "<Space>e", ":NvimTreeToggle<CR>") -- close window    
                                                                       
-- telescope                                                           
                                                                       
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")         
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")          
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")        
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")            
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")          
                                                                       
---- for note directory                                                  
--keymap.set("n", "<leader>ni", ":e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>")                              
--jkjk
