local file=openfile("sbox.tmp","r")
local contents=read(file,"*a")
closefile(file)
function _ERRORMESSAGE(txt)
	print(txt)
end
local c={dostring(contents)}
foreach(c,function(k,v)
	print(v)
end)
