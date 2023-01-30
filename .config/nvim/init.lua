local status, msg = pcall(require, 'alma3lol')
if not status then
	print(msg)
	return
end
vim.g.alma3lol.init()
