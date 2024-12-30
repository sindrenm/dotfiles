-- Iterate through all word list files (~/.config/nvim/spell/*.add). For each
-- of the .add files, if there is no corresponding generated .spl file, or if
-- the .add file is newer than the corresponding .spl file, then it runs
-- `mkspell!` on it to generate a new .spl file.
for _, add_file in ipairs(vim.fn.glob('~/.vim/spell/*.add', 1, 1)) do local
  spl_file = add_file .. '.spl' local add_file_time = vim.fn.getftime(add_file)
  local spl_file_time = vim.fn.getftime(spl_file)

  local add_file_exists = vim.fn.filereadable(add_file) == 1
  local spl_file_exists = vim.fn.filereadable(spl_file) == 1
  local add_file_newer = add_file_time > spl_file_time

  if add_file_exists and (not spl_file_exists or add_file_newer) then
    vim.cmd('mkspell! ' .. vim.fn.fnameescape(add_file))
  end
end
