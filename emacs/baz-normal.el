(setq make-backup-files nil)
(auto-save-mode 1)
(setq large-file-warning-threshold nil) (add-to-list 'default-frame-alist '(fullscreen . maximized)) (global-linum-mode 1)
(setq linum-format "%d ")

(require 'ag)
(require 'helm)
(projectile-mode 1)
(xterm-mouse-mode 1)
(menu-bar-mode 0)
(helm-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

;; 关联hex
(add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))

;; 默认进入目录调整
(setq default-directory "~/Desktop/WOOOOOOORRK/")
(setq split-width-threshold nil)
(setq working-dir "/Users/bazoookia/Desktop/WOOOOOOORRK/")
(global-set-key (kbd "C-c w") (lambda() (interactive) (cd working-dir) (message "dir changed")))

;; clangd
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; (load "/disk1/llvm-project/clang/tools/clang-format/clang-format.el")
;; (global-set-key [backtab] 'clang-format-region)

;; projectile
(global-set-key (kbd "C-c f") 'projectile-ag)
(global-set-key (kbd "C-c o") 'projectile-find-file)

;; 关闭自动缩进
(electric-indent-mode 0)

;; 设置speedbar
(setq sr-speedbar-width 19)
(custom-set-variables '(speedbar-show-unknown-files t))
(add-hook 'emacs-startup-hook 'sr-speedbar-open)
(add-hook 'speedbar-timer-hook 'speedbar-refresh)

;; 设置背景色
(set-background-color "gray20")
(set-foreground-color "#E0DFDB")

;; 取消欢迎页面
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; 某行高亮操作
(global-set-key (kbd "M-l") 'highlight-one-line)
(defun highlight-one-line ()
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

;; 行滚动
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;; 选中操作
(global-set-key (kbd "C-c s") 'set-mark-command)
(global-set-key (kbd "C-c S") 'cua-rectangle-mark-mode)
