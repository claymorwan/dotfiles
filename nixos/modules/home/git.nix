{ username, ... }:

{
  programs.git = {
    enable = true;
    userName = "${username}";
    userEmail = "claymorwan@fembois.dev";
  };
}
