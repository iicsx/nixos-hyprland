{inputs, ...}: let
  system = "x86_64-linux";
in {
  home = {
    sessionVariables.BROWSER = "firefox";

    file."firefox-nebula-theme" = {
      target = ".zen/sz2vv5ic.default/chrome/firefox-nebula-theme";
      source = inputs.firefox-nebula-theme;
    };
  };

  home.packages = with inputs; [
    zen-browser.packages."${system}".specific
  ];

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "browser.tabs.loadInBackground" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.hideSingleTab" = true;
        "gnomeTheme.bookmarksToolbarUnderTabs" = true;
        "gnomeTheme.normalWidthTabs" = false;
        "gnomeTheme.tabsAsHeaderbar" = false;
      };
      userChrome = ''
        @import "firefox-nebula-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-nebula-theme/userContent.css";
      '';
    };
  };
}
