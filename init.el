;; APARENCIA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)                       ;; desabilita buffer de boas vindas
(tool-bar-mode -1)                                     ;; desabilita barra de ferramentas
(menu-bar-mode -1)                                     ;; desabilita barra de menu
(scroll-bar-mode -1)                                   ;; desabilita barra de rolagem
(global-display-line-numbers-mode t)                   ;; habilita linhas numeradas
(setq display-line-numbers-type 'relative)             ;; linhas relativas
(tooltip-mode -1)                                      ;; desabilita dicas
(column-number-mode t)                                 ;; exibe a coluna atual na modeline
(global-hl-line-mode 1)                                ;; habilita cor de fundo da linha em destaque
(setq visible-bell t)                                  ;; alertas visuais
(set-fringe-mode 0)                                    ;; remove os paddings(espacamento das bordas laterais)
(setq initial-frame-alist '((fullscreen . maximized))) ;; abrir o emacs maximizado
(setq-default cursor-type 'box)                        ;; altera o estilo do cursor (box, bar ou hbar)
(save-place-mode 1)                                    ;; lembrar a posicao do cursor
(recentf-mode 1)                                       ;; lembrar de arquivos recentes
(savehist-mode 1)                                      ;; habilita salvar o historico
(load-theme 'modus-vivendi)                            ;; carregando o tema
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; CODIGO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(electric-pair-mode 1)                                 ;; abrir e fechar parenteses
(delete-selection-mode t)                              ;; o texto digitado substitui a selecao
(global-visual-line-mode t)                            ;; quebra de linha suave
(setq-default indent-tabs-mode)                        ;; usar espacoes em vez de tabulacao
;; rolagem mais suave
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))     ;; 2 linhas por vez
      mouse-wheel-progressive-speed nil                ;; nao acelera a rolagem
      mouse-wheel-follow-mouse 't                      ;; rola a janela sob o mouse
      scroll-step 1)                                   ;; rola 1 linha com o tecla
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; BACKUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist `(("." . "~/.saves")))    ;; local onde os arquivos de backup sao salvos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; PACOTES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ("elpa"  . "https://elpa.gnu.org/packages/")))
(setq warning-minimum-level :error)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; KEYBINDINGS HELPER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; AUTO-COMPLETE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ARVORE DE ARQUIVOS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; NAVEGANDO ENTRE AS JANELAS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ace-window
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; PARENTESES COLORIDOS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; CLOJURE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package cider
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; SET KEYBINDINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<tab>") 'other-window)                  ;; altera entre janelas
(global-set-key (kbd "M-<up>") 'enlarge-window)                 ;; aumenta janela verticalmente
(global-set-key (kbd "M-<down>") 'shrink-window)                ;; diminui janela verticalmente
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally) ;; aumenta janela horizontalmente
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)   ;; diminui janela horizontalmente
(global-set-key (kbd "M-o") 'ace-window)                        ;; congela janela para navegar entre elas
(global-set-key (kbd "C-\\") 'neotree-toggle)                   ;; abre e fecha arvore de arquivos
(global-set-key (kbd "C-=") 'text-scale-increase)               ;; aumenta a fonte
(global-set-key (kbd "C--") 'text-scale-decrease)               ;; diminui a fonte
(global-unset-key (kbd "C-z"))                                  ;; desabilita Ctrl-z (suspend frame)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; MELPA STUFF ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("11819dd7a24f40a766c0b632d11f60aaf520cf96bd6d8f35bae3399880937970" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(rainbow-delimiters cider zenburn-theme catppuccin-theme dracula-theme ace-window all-the-icons neotree auto-complete which-key))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "CaskaydiaMono Nerd Font" :foundry "SAJA" :slant normal :weight regular :height 98 :width normal)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; DESCARTADOS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(use-package dracula-theme
;;  :ensure t
;;  :config
;;  (load-theme 'dracula t))
;;(set-face-attribute 'cursor nil :background "#FF79C6") ;; altera cor do cursor

;; cor do match dos parenteses
;;(custom-set-faces
 ;;'(show-paren-match ((t (:background "#6272A4" :foreground "#F8F8F2" :weight bold))))
 ;;'(show-paren-mismatch ((t (:background "#FF5555" :foreground "#F8F8F2" :weight bold))))
;;'(line-number-current-line ((t (:foreground "#F8F8F2" :weight bold)))))

;; se nao tiver use-package instalado, atualiza os pacotes e instala o use-package
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
