{ ... }:

{
  services.colima = {
    enable = true;

    profiles.default = {
      isService = false;
    };
  };
}
