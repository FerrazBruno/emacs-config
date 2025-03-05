;; configuracao basica
(setq inhibit-startup-message t)                                ;; desabilita buffer de boas vindas
(tool-bar-mode -1)                                              ;; desabilita barra de ferramentas
(menu-bar-mode -1)                                              ;; desabilita barra de menu
(scroll-bar-mode -1)                                            ;; desabilita barra de rolagem
(global-display-line-numbers-mode t)                            ;; habilita linhas numeradas
(tooltip-mode -1)                                               ;; desabilita dicas
(column-number-mode t)                                          ;; exibe a coluna atual na modeline
(global-hl-line-mode 1)                                         ;; habilita cor de fundo da linha em destaque
(setq visible-bell t)                                           ;; alertas visuais
(set-fringe-mode 0)                                             ;; remove os paddings(espacamento das bordas laterais)
(setq initial-frame-alist '((fullscreen . maximized)))          ;; abrir o emacs maximizado
(save-place-mode 1)                                             ;; lembrar a posicao do cursor
(recentf-mode 1)                                                ;; lembrar de arquivos recentes
(savehist-mode 1)                                               ;; habilita salvar o historico
(setq make-backup-files nil)                                    ;; desabilita criacao de arquivos de backup
(electric-pair-mode 1)                                          ;; abrir e fechar parenteses
(delete-selection-mode t)                                       ;; o texto digitado substitui a selecao
(global-visual-line-mode t)                                     ;; quebra de linha suave
(setq-default indent-tabs-mode)                                 ;; usar espacoes em vez de tabulacao'
(setq warning-minimum-level :error)                             ;; ignorar avisos menos importantes
;; rolagem do mouse mais suave
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))              ;; 2 linhas por vez
      mouse-wheel-progressive-speed nil                         ;; nao acelera a rolagem
      mouse-wheel-follow-mouse 't                               ;; rola a janela sob o mouse
      scroll-step 1)                                            ;; rola 1 linha com o tecla

;; teclas de atalho
(global-set-key (kbd "M-<up>") 'enlarge-window)                 ;; aumenta janela verticalmente
(global-set-key (kbd "M-<down>") 'shrink-window)                ;; diminui janela verticalmente
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally) ;; aumenta janela horizontalmente
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)   ;; diminui janela horizontalmente
(global-unset-key (kbd "C-z"))                                  ;; desabilita Ctrl-z (suspend frame)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package helm
  :ensure t
  :demand t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-." . helm-imenu-in-all-buffers)
	 ("C-x b" . helm-buffers-list)
	 ("C-x r b" . helm-filtered-bookmarks))
  :config 
  (helm-mode 1))

(use-package cider
  :ensure t
  :config
  (setq cider-show-error-buffer nil)
  (setq cider-auto-select-error-buffer nil))

