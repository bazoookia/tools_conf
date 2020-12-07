;; real gud
(require 'seq)
(defun my-gud-refresh ()
  (interactive)
  (delete-other-windows)
  (switch-to-buffer (car (seq-filter (apply-partially #'string-match-p "gdb") (mapcar #'buffer-name (buffer-list))))))

(defun my-gud-break ()
  (interactive)
  (realgud:attach-cmd-buffer (car (seq-filter (apply-partially #'string-match-p "gdb") (mapcar #'buffer-name (buffer-list)))))
  (realgud:cmd-break))

(defun my-gud-tbreak ()
  (interactive)
  (realgud:attach-cmd-buffer (car (seq-filter (apply-partially #'string-match-p "gdb") (mapcar #'buffer-name (buffer-list)))))
  (realgud:cmd-tbreak))

(defun my-gud-print ()
  (interactive)
  (beginning-of-thing 'symbol)
  (set-mark-command 'nil)
  (end-of-thing 'symbol)
  (realgud:cmd-run-command (thing-at-point 'symbol) "eval"))

(global-set-key [double-down-mouse-1] 'my-gud-print)
(global-set-key (kbd "C-c r") 'my-gud-refresh)
(global-set-key (kbd "C-c b") 'my-gud-break)
(global-set-key (kbd "C-c t") 'my-gud-tbreak)
