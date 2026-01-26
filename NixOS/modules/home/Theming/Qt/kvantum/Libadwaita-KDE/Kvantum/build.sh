# THIS SCRIPT IS NOT MEANT TO BE RAN MANUALY!
# If you still want to do so. Understand the
# structure of acguments before running.

export theme_name="libadwaita-kde"
export theme_color="$1" # $1 gets checked later to ensure it works
export theme_variant="$2" # $2 gets checked later to ensure it works
export SVG_FILE="./base/base.svg"
export KVCONF_FILE="./base/base.kvconfig"
export KVCONFIG_DIR="$HOME/.config/Kvantum/"

# base colors (these colors are used in base.svg and base.kvconfig)
export base_text="#ffffff"
export base_window="#ff0000"
export base_view="#00ff00"
export base_header="#00ffff"
export base_header_separator="#00abb6"
export base_menu="#ff00ff"
export base_tooltip="#ffff00"
export base_tooltip_text="#ffff80"
export base_accent="#3584e4"
export base_accent_hover="#599cea"
export base_accent_text="#75aee4"
export base_disabled_text="#000000"

export accent
export accent_hover

case $1 in
    mocha)
        case $2 in
            rosewater)
                accent="#f5e0dc"
                accent_hover="#f5e0dc"
                ;;
            flamingo)
                accent="#f2cdcd"
                accent_hover="#f2cdcd"
                ;;
            pink)
                accent="#f5c2e7"
                accent_hover="#f5c2e7"
                ;;
            mauve)
                accent="#cba6f7"
                accent_hover="#cba6f7"
                ;;
            red)
                accent="#f38ba8"
                accent_hover="#f38ba8"
                ;;
            maroon)
                accent="#eba0ac"
                accent_hover="#eba0ac"
                ;;
            peach)
                accent="#fab387"
                accent_hover="#fab387"
                ;;
            yellow)
                accent="#f9e2af"
                accent_hover="#f9e2af"
                ;;
            green)
                accent="#a6e3a1"
                accent_hover="#a6e3a1"
                ;;
            teal)
                accent="#94e2d5"
                accent_hover="#94e2d5"
                ;;
            sky)
                accent="#89dceb"
                accent_hover="#89dceb"
                ;;
            sapphire)
                accent="#74c7ec"
                accent_hover="#74c7ec"
                ;;
            blue)
                accent="#89b4fa"
                accent_hover="#89b4fa"
                ;;
            lavender)
                accent="#b4befe"
                accent_hover="#b4befe"
                ;;
            *)
                echo "no or unknown accent provided"
                exit 1
        esac
    ;;
    latte)
        case $2 in
            rosewater)
                accent="#dc8a78"
                accent_hover="#dc8a78"
                ;;
            flamingo)
                accent="#dd7878"
                accent_hover="#dd7878"
                ;;
            pink)
                accent="#ea76cb"
                accent_hover="#ea76cb"
                ;;
            mauve)
                accent="#8839ef"
                accent_hover="#8839ef"
                ;;
            red)
                accent="#d20f39"
                accent_hover="#d20f39"
                ;;
            maroon)
                accent="#e64553"
                accent_hover="#e64553"
                ;;
            peach)
                accent="#fe640b"
                accent_hover="#fe640b"
                ;;
            yellow)
                accent="#df8e1d"
                accent_hover="#df8e1d"
                ;;
            green)
                accent="#40a02b"
                accent_hover="#40a02b"
                ;;
            teal)
                accent="#179299"
                accent_hover="#179299"
                ;;
            sky)
                accent="#04a5e5"
                accent_hover="#04a5e5"
                ;;
            sapphire)
                accent="#209fb5"
                accent_hover="#209fb5"
                ;;
            blue)
                accent="#1e66f5"
                accent_hover="#1e66f5"
                ;;
            lavender)
                accent="#7287fd"
                accent_hover="#7287fd"
                ;;
            *)
                echo "no or unknown accent provided"
                exit 1
        esac
    ;;
esac

color_latte() {
    export text="#4c4f69"
    export window="#e6e9ef"
    export view="#eff1f5"
    export header="#eff1f5"
    export header_separator="#ccd0da"
    export menu="#eff1f5"
    export tooltip="#eff1f5"
    export tooltip_text="#4c4f69"
    export accent_text="#dce0e8"
    export disabled_text="#6c6f85"
}
color_mocha() {
    export text="#cdd6f4"
    export window="#181825"
    export view="#1e1e2e"
    export header="#1e1e2e"
    export header_separator="#313244"
    export menu="#1e1e2e"
    export tooltip="#1e1e2e"
    export tooltip_text="#cdd6f4"
    export accent_text="${accent}" #"#11111b"
    export disabled_text="#a6adc8"
}

case $1 in
    mocha)
        color_mocha
        ;;
    latte)
        color_latte
        ;;
    *)
        echo "Didnt set color arg/wrong colorscheme"
        exit 1
esac

export build_dir="$theme_name-$theme_color-$theme_variant"
mkdir -p "./$build_dir"

export built_svg=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$base_window/$window/" \
    -e "s/$base_view/$view/" \
    -e "s/$base_header/$header/" \
    -e "s/$base_header_separator/$header_separator/" \
    -e "s/$base_menu/$menu/" \
    -e "s/$base_tooltip/$tooltip/" \
    -e "s/$base_accent/$accent/" \
    -e "s/$base_accent_hover/$accent_hover/" \
    "$SVG_FILE" \
    > "./$build_dir/$build_dir.svg"
)
export built_kvconf=$(sed \
    -e "s/$base_text/$text/" \
    -e "s/$base_window/$window/" \
    -e "s/$base_view/$view/" \
    -e "s/$base_header/$header/" \
    -e "s/$base_header_separator/$header_separator/" \
    -e "s/$base_menu/$menu/" \
    -e "s/$base_tooltip/$tooltip/" \
    -e "s/$base_tooltip_text/$tooltip_text/" \
    -e "s/$base_accent/$accent/" \
    -e "s/$base_accent_hover/$accent_hover/" \
    -e "s/$base_accent_text/$accent_text/" \
    -e "s/$base_disabled_text/$disabled_text/" \
    "$KVCONF_FILE" \
    > "./$build_dir/$build_dir.kvconfig"
)

if [ -z "$3" ]; then
    exit 0
elif [ "$3" == "--install" ]; then
    cp -r "./$build_dir/" "$KVCONFIG_DIR/"
    rm -r "./$build_dir/"
    exit 0
fi
