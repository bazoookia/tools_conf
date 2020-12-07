(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; org refile操作
(global-set-key (kbd "C-c r") 'my-refile)
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(defun my-refile()
  (interactive)
  (setq my-org-files (directory-files-recursively "~/Desktop/WOOOOOOORRK/" ".org$"))
  (setq org-refile-targets '((my-org-files :maxlevel . 3)))
  (org-refile))

;; org timestamp
(global-set-key (kbd "C-c T") 'my-org-ts-act)
(global-set-key (kbd "C-c t") 'my-org-ts-inact)

(defun my-org-ts-inact()
  (interactive)
  (org-time-stamp-inactive '(4)))

(defun my-org-ts-act()
  (interactive)
  (org-time-stamp '(4)))

(setq org-agenda-files (directory-files-recursively "~/Desktop/WOOOOOOORRK/" ".org$"))


(global-set-key (kbd "C-c p") 'org-toggle-inline-images)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c 1") 'org-insert-todo-heading)

(global-set-key (kbd "M-]") 'org-metaright)
(global-set-key (kbd "M-[") 'org-metaleft)
(global-set-key (kbd "M-=") 'org-metaup)
(global-set-key (kbd "M--") 'org-metadown)

;; org capture设置
(setq org-capture-templates nil)
(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/Desktop/WOOOOOOORRK/note.org")
						   "* %U - %^{note}\n%?"))

(add-to-list 'org-capture-templates
             '("d" "Drafts" entry (file "~/Desktop/WOOOOOOORRK/draft.org")
						   "* Draft - %U\n%?"))

;; 设置org图片展开大小
(setq org-image-actual-width 700)
