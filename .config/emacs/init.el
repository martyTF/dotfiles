(setq inhibit-startup-message t
      visible-bell t
      history-length 25)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)

(global-display-line-numbers-mode 1)






(setq modus-theme-mode-line '(accented borderless padded)
      modus-theme-region '(bg-only)
      modus-theme-completions 'opinionated
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-paren-match '(bold intense)
      modus-themes-headings
      '((1 . (rainbow 1.4))
	(2 . (rainbow 1.2))
	(3 . (rainbow 1.1))
	(t . (rainbow 1.1))
	)
      modus-themes-org-blocks 'tinted-background)

(setq modus-operandi-palette-overrides
      '((bg-main "#1e1e2e")
	(bg-dim "181825")
        (comment red-faint)
        (keyword cyan-cooler)))


(load-theme 'modus-vivendi t)

