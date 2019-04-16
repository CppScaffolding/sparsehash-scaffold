-- scaffold geniefile for sparsehash

sparsehash_script = path.getabsolute(path.getdirectory(_SCRIPT))
sparsehash_root = path.join(sparsehash_script, "sparsehash")

sparsehash_includedirs = {
	path.join(sparsehash_script, "config"),
	sparsehash_root,
}

sparsehash_libdirs = {}
sparsehash_links = {}
sparsehash_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { sparsehash_includedirs }
	end,

	_add_defines = function()
		defines { sparsehash_defines }
	end,

	_add_libdirs = function()
		libdirs { sparsehash_libdirs }
	end,

	_add_external_links = function()
		links { sparsehash_links }
	end,

	_add_self_links = function()
		links { "sparsehash" }
	end,

	_create_projects = function()

project "sparsehash"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		sparsehash_includedirs,
	}

	defines {}

	files {
		path.join(sparsehash_script, "config", "**.h"),
		path.join(sparsehash_root, "**.h"),
		path.join(sparsehash_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
