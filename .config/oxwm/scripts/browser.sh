#!/bin/sh
# Mod+3: vai para a tag 3; se ela estiver totalmente vazia, abre o helium.
#
# A troca de tag e feita pelo bind auxiliar Mod+F3 (definido no config.lua),
# ja que o oxwm nao permite combinar duas acoes num unico keybind.
#
# Deteccao de "tag vazia": o oxwm esconde janelas das outras tags movendo-as
# para x = -2*largura (estilo dwm, src/wm/core.zig). Entao, apos trocar para
# a tag 3, basta checar se alguma janela do _NET_CLIENT_LIST esta em posicao
# visivel — se nenhuma estiver, a tag esta vazia.

xdotool key super+F3

sleep 0.05 # da tempo do oxwm processar a troca e reposicionar as janelas

for w in $(xprop -root _NET_CLIENT_LIST | grep -o '0x[0-9a-f]*'); do
    X='' WIDTH=''
    eval "$(xdotool getwindowgeometry --shell "$w" 2>/dev/null)"
    [ -n "$X" ] || continue
    # Janela escondida fica em x = -2*largura; visivel tem x > -largura
    if [ "$X" -gt "$((-WIDTH))" ]; then
        exit 0 # tag 3 ocupada, nao abre nada
    fi
done

setsid -f helium >/dev/null 2>&1
