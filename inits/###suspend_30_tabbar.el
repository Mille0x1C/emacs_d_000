;; tabbarの設定
;;
(require 'tabbar)
(tabbar-mode)

(tabbar-mwheel-mode nil)                  ;; マウスホイール無効
(setq tabbar-buffer-groups-function nil)  ;; グループ無効
;;(setq tabbar-use-images nil)              ;; 画像を使わない



;;----- タブに表示するバッファの設定
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
                     ((equal "*OCaml*" (buffer-name b)) b) ;*OCamlバッファも表示する*
                     ((equal "*shell*" (buffer-name b)) b) ;*shell*バッファも表示する
                     ((equal "*shell*<2>" (buffer-name b)) b) ;*shell*バッファも表示する
                     ((equal "*shell*<3>" (buffer-name b)) b) ;*shell*バッファも表示する
                     ((equal "*shell*<4>" (buffer-name b)) b) ;*shell*バッファも表示する
                     ((equal "*shell*<5>" (buffer-name b)) b) ;*shell*バッファも表示する
                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)




;;----- キーに割り当てる
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)
;;(global-set-key (kbd "<f8>") 'tabbar-forward-tab)
;;(global-set-key (kbd "<f7>") 'tabbar-backward-tab)
;;(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-x C-p") 'tabbar-backward-tab)


;;----- 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))


;;----- タブのセパレーターの長さ
(setq tabbar-separator '(2.0))


;;----- タブの色（CUIの時。GUIの時は後でカラーテーマが適用）
(set-face-attribute
 'tabbar-default nil
 :family "MeiryoKe_Gothic"
 :background "black"
 :foreground "white"
 )
(set-face-attribute
 'tabbar-selected nil
 :background "#ff5f00"
 :foreground "brightwhite"
 )
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "white"
 :box '(:line-width 2 :color "red")
 )
(set-face-attribute
 'tabbar-separator nil
 :background "gray"
 :foreground "gray"
 ;;:box '(:line-width 2 :color "red")
 )
;(set-face-attribute
; 'tabbar-modified nil
;:background "brightred"
;:foreground "brightwhite"
;:box nil
;)

(when window-system                       ; GUI時
  ;; 外観変更
  ;;設定2
  (set-face-attribute
   'tabbar-default nil
   :family "MeiryoKe_Gothic"
   :background "#34495E"
   :foreground "#EEEEEE"
   :box '(:line-width 1 :color "gray20" :style nil))
  
  (set-face-attribute
   'tabbar-unselected nil
   :background "gray30"
   :foreground "white"
   :box '(:line-width 5 :color "gray30" :style nil))
  
  (set-face-attribute
   'tabbar-selected nil
   :background "blue"
   :foreground "#EEEEEE"
   :box '(:line-width 1 :color "gray75" :style nil))
  
  (set-face-attribute
   'tabbar-highlight nil
   :background "white"
   :foreground "black"
   :underline nil
   :box '(:line-width 5 :color "white" :style nil))
  
  (set-face-attribute
   'tabbar-button nil
   :box '(:line-width 1 :color "gray20" :style nil))
  
  (set-face-attribute
   'tabbar-separator nil
   :background "gray20"
   :height 0.6))

  

