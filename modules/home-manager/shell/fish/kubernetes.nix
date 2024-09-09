{ ... }:
{
  programs.fish = {
    functions = {
      load_sticky = # fish
        ''
          if test -e $K8S_STICKY_FILE
              kubeswitch (cat $K8S_STICKY_FILE) > /dev/null
          end
        '';

      sticky = # fish
        ''
          echo "$argv" > $K8S_STICKY_FILE
          kubeswitch $argv
        '';

      unsticky = # fish
        ''rm $K8S_STICKY_FILE'';

      sticky_k9s = # fish
        ''
          if ! test -e $K8S_STICKY_FILE
              kubeswitch
          end

          k9s
        '';

      zellij_k9s = # fish
        ''
          if ! test -e $K8S_STICKY_FILE
              if ! test -e $KUBECONFIG || [ "$KUBECONFIG" = "" ]
                  kubeswitch
                  zellij-store store KUBECONFIG
              end
          end

          zellij action rename-tab "$(kubectl config current-context)" &

          k9s
        '';
    };

    shellAliases = {
      k9 = "k9s";
      k = "kubectl";
      kb = "kubectl";
      keit = "kubectl exec -it";
    };
  };
}
