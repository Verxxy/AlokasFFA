resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script 'cl_chat.lua'
server_scripts{
	"sv_chat.lua",
	"@mysql-async/lib/MySQL.lua"
}