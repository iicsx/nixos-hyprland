{ ... }: {
  # loaded in reverse order
  imports = [
    ./set.nix
    ./remap.nix
    ./plugins
    # ./packer.nix
  ];

  programs.neovim.extraLuaConfig = ''
    vim.diagnostic.config({
      virtual_text = {
        prefix = '●',
      },
    })

    vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

    vim.cmd([[autocmd VimEnter * lua setColor()]])
    '';


    
#    function sync_all()
#      require("packer").sync()
#    
#      vim.cmd("TSUpdate")
#      vim.cmd("MasonUpdate")
#    end
#    
#    vim.cmd([[autocmd VimEnter * lua sync_all()]])
#  '';
}
