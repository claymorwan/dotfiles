{ username, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "${username}";
        email = "claymorwan@fembois.dev";
      };
    };
  };
}
