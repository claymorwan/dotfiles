{ username, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "${username}";
        email = "claymorwan@fembois.dev";
        signingkey = "AA7C29C3A26ADB2F80E5294DCC5E1DF06FB78249";
      };

      commit = {
        gpgsign = true;
      };
    };
  };
}
