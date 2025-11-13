_fzf_complete_dnf() {
	case "$@" in
		"dnf ** dnf")
			_fzf_complete --multi --reverse --prompt="Choose command> " -- "$@" < <(
				printf "%s\n" install remove update
			)
			;;
		"dnf ** in" | "dnf ** install")
			_fzf_complete --multi --reverse --prompt="Install packages> " --preview="dnf info {}" --preview-window=67% -- "$@" < <(
				dnf repoquery --queryformat="%{name}\n"
			)
			;;
		"dnf ** rm" | "dnf ** remove")
			_fzf_complete --multi --reverse --prompt="Remove packages> " --preview="dnf info {}" --preview-window=67% -- "$@" < <(
				dnf repoquery --installed --queryformat="%{name}\n"
			)
			;;
	esac
}

complete -F _fzf_complete_dnf -o default -o bashdefault dnf


