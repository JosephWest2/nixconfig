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
		settings.sources = [
		    { name = "nvim_lsp"; }
		    { name = "path"; }
		    { name = "buffer"; }
		];
	    };
	    lsp-signature.enable = true;
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
		    "<" = { escape = false; close = true; pair = "<>"; };

		    "'" = { escape = false; close = false; pair = "''"; };
		};
		options.autoIndent = true;
	    };
	};
    };
}
