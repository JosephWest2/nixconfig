{ pkgs, pkgs-stable, inputs, ...}: 
{
    imports = [
	inputs.nixvim.homeManagerModules.nixvim
    ];
    home = {
        username = "josephw";
        homeDirectory = "/home/josephw";
        stateVersion = "24.05";
	packages = [
	    pkgs-stable.cargo
	    pkgs-stable.rustc
	    pkgs-stable.obsidian
	    pkgs.zig
	];
	sessionPath = [
	    "/home/josephw/bin"
	];
    };
    programs = {
	go = {
	    enable = true;
	    package = pkgs.go;
	};
	ripgrep = {
	    enable = true;
	    package = pkgs.ripgrep;
	};
	fzf = {
	    enable = true;
	    package = pkgs.fzf;
	};
	git = {
	    enable = true;
	    userEmail = "joeywest1414@gmail.com";
	    userName = "josephwest2";
	};
	zsh = {
	    enable = true;
	    syntaxHighlighting.enable = true;
	    shellAliases = {
		tmux = "tmux -2";
		nixd = "nix develop --command zsh";
		nixrb = "sudo nixos-rebuild switch";
	    };
	};
	zoxide = {
	    enable = true;
	    package = pkgs.zoxide;
	    enableZshIntegration = true;
	    options = [
		"--cmd cd"
	    ];
	};
	tmux = {
	    enable = true;
	    package = pkgs.tmux;
	    terminal = "screen-256color";
	};
    };
    programs.nixvim = {
	enable = true;
	opts = {
	    number = true;
	    relativenumber = true;
	    shiftwidth = 4;
	    scrolloff = 8;
	};
	keymaps = [
	    {
		action = "<C-d>zz";
		key = "<C-d>";
	    }
	    {
		action = "<C-u>zz";
		key = "<C-u>";
	    }
	    {
		action = ":NvimTreeFocus <CR>";
		key = "<Leader>t";
	    }
	    {
		action = ":NvimTreeClose <CR>";
		key = "<Leader>r";
	    }
	];
	colorschemes.onedark.enable = true;
	plugins = {
	    web-devicons.enable = true;
	    telescope = {
		enable = true;
		keymaps = {
		    "<leader>ff" = "find_files";
		    "<leader>gf" = "git_files";
		    "<leader>fg" = "live_grep";
		};
	    };
	    treesitter.enable = true;
	    lsp = {
		enable = true;
		servers = {
		    zls.enable = true;
		    clangd.enable = true;
		    rust_analyzer = {
			enable = true;
			installCargo = false;
			installRustc = false;
		    };
		    gopls.enable = true;
		    nixd.enable = true;
		};
		keymaps.lspBuf = {
		    K = "hover";
		    gD = "references";
		    gd = "definition";
		    gi = "implementation";
		    gt = "type_definition";
		    "<F3>" = "format";
		    "<F4>" = "code_action";
		};
	    };
	    lsp-format.enable = true;
	    cmp = {
		enable = true;
		autoEnableSources = true;
		settings = {
		    sources = [
			{ name = "nvim_lsp"; }
			{ name = "luasnip"; }
			{ name = "path"; }
			{ name = "buffer"; }
		    ];
		    mapping = {
			__raw = ''
			    cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-k>'] = cmp.mapping(function(fallback)
				    ls = require("luasnip")
				    if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				    end
				end, { 'i', 's' }),
				['<C-j>'] = cmp.mapping(function(fallback)
				    ls = require("luasnip")
				    if ls.jumpable(-1) then
					ls.jump(-1)
				    end
				end, { 'i', 's' }),
			    })
			'';
		    };
		    snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
		};
	    };
	    luasnip = {
		enable = true;
	    };
	    lsp-signature = {
		enable = true;
		settings = {
		    extra_trigger_chars = [
			","
			")"
			" "
		    ];
		    hint_enable = false;
		    toggle_key = "<C-k>";
		};
	    };
	    auto-save = {
		enable = true;
		settings.noautocmd = true;
	    };
	    nvim-tree = {
		enable = true;
		disableNetrw = true;
		openOnSetup = true;
	    };
	    autoclose = {
		enable = true;
		keys =   {
		    "(" = { escape = false; close = true; pair = "()"; };
		    "[" = { escape = false; close = true; pair = "[]"; };
		    "{" = { escape = false; close = true; pair = "{}"; };

		    "'" = { escape = false; close = false; pair = "''"; };
		};
		options.autoIndent = true;
	    };
	};
    };
}
