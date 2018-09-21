;;; constant-theme.el --- A calm, dark, almost monochrome color theme.

;; Copyright (C) 2018 Jannis Pohlmann <contact@jannispohlmann.de>

;; Author: Jannis Pohlmann <contact@jannispohlmann.de>
;; Keywords: themes
;; URL: https://github.com/jannis/emacs-constant-theme
;; Version: 2018.09
;; Package-Requires: ((emacs "24.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To use the constant theme, add the following to your Emacs
;; configuration file:
;;
;;   (load-theme 'constant)
;;
;; Requirements: Emacs 24.

;;; Code:


(deftheme constant "A calm, dark, almost monochrome theme")

(defconst named-colors
  '(;; Basics
    (white . "#ffffff")

    ;; Shades of grey
    (default-grey . "#0f1619")
    (grey . "#0f1619")
    (grey-50 . "#fdfdfe")
    (grey-100 . "#f5f8fa")
    (grey-200 . "#d8dcde")
    (grey-300 . "#bcc0c2")
    (grey-400 . "#9fa3a6")
    (grey-500 . "#9fa3a6")
    (grey-600 . "#656b6e")
    (grey-700 . "#494f52")
    (grey-720 . "#474d50")
    (grey-800 . "#2c3236")
    (grey-820 . "#1e2428")
    (grey-850 . "#1d2226")
    (grey-900 . "#0f1619")

    ;; Priary color shades
    (default-primary . "#0be5e5")
    (primary . "#0be5e5")
    (primary-50 . "#f3fefe")
    (primary-100 . "#d4fafa")
    (primary-200 . "#91f3f3")
    (primary-300 . "#4eecec")
    (primary-400 . "#0be5e5")
    (primary-500 . "#09cccc")
    (primary-600 . "#07b3b3")
    (primary-700 . "#059999")
    (primary-800 . "#028080")
    (primary-900 . "#006666")

    ;; Reds
    (default-red. "#f24965")
    (red . "#f24965")
    (danger . "#f24965")
    (red-50 . "#fff0f2")
    (red-100 . "#ffd9df")
    (red-200 . "#fba9b6")
    (red-300 . "#f6798e")
    (red-400 . "#f24965")
    (red-500 . "#d6455d")
    (red-600 . "#ba4054")
    (red-700 . "#9e3c4c")
    (red-800 . "#823743")
    (red-900 . "#66333b")

    ;; Purples
    (purple . "#b965e8")))


(defun named-color (name)
  "Return the constant theme color with the given NAME."
  (cdr (assoc name named-colors)))


(let ((class                    '((class color) (min-colors 256)))
      (default-fg               (named-color 'grey-100))
      (default-bg               (named-color 'grey-900))
      (minor-fg                 (named-color 'grey-700))
      (inactive-fg              (named-color 'grey-600))
      (border-fg                (named-color 'grey-850))
      (frame-fg                 (named-color 'grey-500))
      (cursor-fg                (named-color 'grey-500))
      (cursor-bg                (named-color 'grey-500))

      ;; Scrollbars
      (scrollbar-fg             (named-color 'grey-800))
      (scrollbar-bg             (named-color 'grey-600))

      ;; Highlighting
      (highlight-fg             (named-color 'white))
      (highlight-bg             (named-color 'red))

      ;; Current line
      (hl-line-bg               (named-color 'grey-810))

      ;; Search
      (search-fg                (named-color 'white))
      (search-bg                (named-color 'primary-700))
      (search-bg-0              (named-color 'primary-700))
      (search-bg-1              (named-color 'primary-500))
      (search-bg-2              (named-color 'primary-300))
      (search-bg-3              (named-color 'primary-100))

      ;; Selection
      (selection-bg             (named-color 'grey-800))

      ;; Auto-completion
      (completion-fg            (named-color 'primary))
      (completion-bg            (named-color 'grey-820))
      (completion-match-fg      (named-color 'red-500))
      (completion-mouse-fg      (named-color 'white))
      (completion-selection-fg  (named-color 'white))
      (completion-annotation-fg (named-color 'purple))

      ;; Warnings & errors
      (warning-fg               (named-color 'white))
      (warning-bg               (named-color 'red-600))
      (error-fg                 (named-color 'white))
      (error-bg                 (named-color 'red))

      ;; Language syntax highlighting
      (variable-fg              (named-color 'white))
      (function-fg              (named-color 'grey-200))
      (type-fg                  (named-color 'grey-300))
      (constant-fg              (named-color 'grey-500))
      (keyword-fg               (named-color 'grey-600))
      (builtin-fg               (named-color 'grey-700))
      (string-fg                (named-color 'grey-500))
      (doc-fg                   (named-color 'primary-600)))
  (custom-theme-set-faces
   'constant

   ;; Regular
   `(cursor ((,class (:foreground ,cursor-fg :background ,cursor-bg))))
   `(default ((,class (:foreground ,default-fg :background ,default-bg))))
   `(default-italic ((,class (:italic t))))

   ;; Emacs UI
   `(fringe ((,class (:foreground ,error-fg :background ,default-bg))))
   `(header-line ((,class :background ,default-bg)))
   `(linum ((,class (:inherit shadow :background ,default-bg))))
   `(mode-line ((,class (:foreground ,frame-fg :background ,default-bg
                         :box (:line-width -1 :color ,default-bg)))))
   `(mode-line-inactive ((,class (:foreground ,inactive-fg :background ,default-bg
                                  :box (:line-width -1 :color ,default-bg)))))
   `(nlinum-relative-current-face ((,class (:foreground ,frame-fg :background ,default-bg))))
   `(vertical-border ((,class (:foreground ,border-fg :background ,default-bg))))

   ;; Highlighting
   `(highlight ((,class (:foreground ,highlight-fg :background ,highlight-bg))))
   `(hl-line ((,class (:background ,hl-line-bg))))

   ;; Search
   `(isearch ((,class (:foreground ,search-fg :background ,search-bg :weight bold))))
   `(lazy-highlight ((,class (:foreground ,highlight-fg :background ,highlight-bg) :weight normal)))

   ;; Selection
   `(region ((,class (:background ,selection-bg))))

   ;; Erroneous whitespace
   `(whitespace-line ((,class (:foreground ,error-fg :background ,error-bg))))

   ;; Language syntax highlighting
   `(font-lock-builtin-face ((,class (:foreground ,builtin-fg))))
   `(font-lock-comment-face ((,class (:foreground ,doc-fg))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,minor-fg))))
   `(font-lock-constant-face ((,class (:foreground ,constant-fg))))
   `(font-lock-doc-face ((,class (:foreground ,doc-fg))))
   `(font-lock-function-name-face ((,class (:foreground ,function-fg))))
   `(font-lock-keyword-face ((,class (:foreground ,keyword-fg))))
   `(font-lock-negation-char-face ((,class (:foreground ,error-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,builtin-fg))))
   `(font-lock-string-face ((,class (:foreground ,string-fg))))
   `(font-lock-type-face ((,class (:foreground ,type-fg))))
   `(font-lock-variable-name-face ((,class (:foreground ,variable-fg))))
   `(font-lock-warning-face ((,class (:foreground ,warning-fg :background ,warning-bg))))

   ;; Avy
   `(avy-lead-face   ((,class (:background ,search-bg-0 :foreground ,search-fg))))
   `(avy-lead-face-0 ((,class (:background ,search-bg-1 :foreground ,search-fg))))
   `(avy-lead-face-1 ((,class (:background ,search-bg-2 :foreground ,search-fg))))
   `(avy-lead-face-2 ((,class (:background ,search-bg-3 :foreground ,search-fg))))

   ;; Company (auto-completion)
   `(company-preview ((,class (:background ,default-bg :foreground ,completion-match-fg))))
   `(company-preview-common ((,class (:background ,completion-bg :foreground ,completion-fg))))
   `(company-preview-search ((,class (:background ,completion-bg :foreground ,completion-fg))))
   `(company-scrollbar-bg ((,class (:background ,scrollbar-bg))))
   `(company-scrollbar-fg ((,class (:background ,scrollbar-fg))))
   `(company-tooltip ((,class (:background ,completion-bg :foreground ,completion-fg))))
   `(company-tooltip-annotation ((,class (:foreground ,completion-annotation-fg))))
   `(company-tooltip-common ((,class (:background nil :foreground ,completion-match-fg))))
   `(company-tooltip-common-selection ((,class (:foreground ,completion-selection-fg))))
   `(company-tooltip-mouse ((,class (:background ,selection-bg :foreground ,completion-mouse-fg))))
   `(company-tooltip-search ((,class (:foreground ,completion-match-fg))))
   `(company-tooltip-selection ((,class (:background ,selection-bg :foreground nil))))))


;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  ;; add theme folder to `custom-theme-load-path' when installing over MELPA
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


(provide-theme 'constant)


;;; constant-theme.el ends here
