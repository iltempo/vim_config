# Enable vi mode
fish_vi_key_bindings

# Change the strange colors of vi mode status prompt
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_mode_prompt.fish
function fish_default_mode_prompt --description "Display the default mode for the prompt"
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo 'n'
            case insert
                set_color
                echo 'i'
            case replace_one
                set_color --bold green
                echo 'r'
            case replace
                set_color --bold cyan
                echo 'r'
            case visual
                set_color --bold magenta
                echo 'v'
        end
        set_color normal
        echo -n ' '
    end
end
