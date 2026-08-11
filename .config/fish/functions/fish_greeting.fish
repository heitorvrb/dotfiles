function fish_greeting
    fastfetch --config ~/.config/fish/fastfetch/welcome.jsonc

    if set -q fish_private_mode
        echo
        echo (_ "fish is running in private mode, history will not be persisted.")
    end
end
