status_ok, chatgpt = pcall(require, "chatgpt")

if not status_ok then
	return
end

chatgpt.setup({
	api_key_cmd = "gpg --decrypt ~/.secret/openai.txt.gpg 2>/dev/null",
})
