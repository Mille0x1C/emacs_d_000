;;; C-h にバックスペース
(keyboard-translate ?\C-h ?\C-?)

;;; 自前プレフィックス
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;;; C-l r(R) で置換
(global-set-key (kbd "C-l r") 'query-replace)
(global-set-key (kbd "C-l R") 'query-replace-regexp)




(setq-default tab-width 4 indent-tabs-mode nil)

;; 日本語をちらつかせない！
(setq redisplay-dont-pause nil)

;;ツールバーを表示しない
(tool-bar-mode 0)

;;メニューバーを表示しない
(menu-bar-mode -1)

;; 括弧の自動補完
(electric-pair-mode 1)


;;; スクロールを一行ずつにする
(setq scroll-step 1)

;; 動的略称展開(dabbrev-expand)にキーバインドを割り当てる
(define-key global-map (kbd "C-:") 'dabbrev-expand)

;;動的略称展開(dabbrev-expand)において大文字・小文字を区別する
(setq dabbrev-case-fold-search nil)
;; goto-lineにキーバインドを割り当てる
(define-key global-map (kbd "M-j") 'goto-line)

;; replace-regexpにキーバインドを割り当てる
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z r") 'replace-regexp)

;; shellの環境変数をEmacsに引き継ぐ
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; 初期画面を表示しない
(setq inhibit-startup-message t)



;; タイトルパーにファイルのフルパスを表示する
(setq frame-title-format "%f")


;;キーバインド

(define-key global-map [?¥] [?\\])     ;;
(unless window-system
  (global-set-key (kbd "M-n") 'beginning-of-buffer)
  )
(define-key global-map (kbd "C-,") 'beginning-of-buffer)     ;;
(unless window-system
  (global-set-key (kbd "M-m") 'end-of-buffer)
  )
(define-key global-map (kbd "C-.") 'end-of-buffer)
(define-key global-map (kbd "C-x C-/") 'eval-buffer)

;; 行数を表示する
(global-linum-mode t)


;;特殊文字に関する表示設定 whitespace-mode
(require 'whitespace)
;; スペースの定義は全角スペースとする。
(setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
(setq whitespace-space-regexp "\\([\u3000]+\\)$")
(setq whitespace-2Bspace-regexp "\\(\u3000+\\)")
(defvar my/bg-color "#232323")

(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         empty          ; 先頭/末尾の空行
                         spaces         ; 空白
                         2Bspace        ; 全角スペース
                         space-mark     ; 表示のマッピング
                         2Bspace-mark
                         tab-mark))

(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (2Bspace-mark ?\u3000 [?\u2423])
        (newline-mark 10 [182]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))

;;具体的な設定
;; (set-face-foreground 'whitespace-space "white40")
;; (set-face-bold-p 'whitespace-space t)
;; (set-face-underline  'whitespace-space t)
(set-face-foreground 'whitespace-newline  "gray28")        ;;改行文字の色
;;(set-face-background 'whitespace-newline "gray28")

;;特殊文字を表示させる
(global-whitespace-mode 1)


;; M-ESC ESC による ウィンドウの単一化を無効化
(define-key global-map (kbd "M-ESC ESC") nil)


;; 列数を表示する
(column-number-mode t)

;; 対応する括弧を光らせる
(show-paren-mode t)
(put 'upcase-region 'disabled nil)


(global-set-key (kbd "C-k") 'kill-line)

;; line_copy
(fset 'line_copy
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 5 escape 119] 0 "%d")) arg)))

(global-set-key (kbd "C-c C-k") 'line_copy)

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))


(setq scroll-step 1)

;;テーマの設定
;;(set-face-background 'default "#303030")
;;(set-foreground-color "#ffffff")
(load-theme 'deeper-blue t)
(unless window-system
  (load-theme 'manoj-dark t)
  )
