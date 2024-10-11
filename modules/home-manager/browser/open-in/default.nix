{ pkgs, ... }@args:
let
  package = import ./package.nix args;
  defaultConfig = {
    name = "com.add0n.node";
    description = "Node Host for Native Messaging";
    path = "${package}/bin/run-open-in";
    type = "stdio";
  };
  firefoxConfig = defaultConfig // (import ./firefox.nix args);
  chromiumConfig = defaultConfig // (import ./chrome.nix args);
in
{
  home.file.".mozilla/native-messaging-hosts/com.add0n.node.json".text = builtins.toJSON firefoxConfig;
  home.file.".config/BraveSoftware/Brave-Browser/NativeMessagingHosts/com.add0n.node.json".text = builtins.toJSON chromiumConfig;
}
