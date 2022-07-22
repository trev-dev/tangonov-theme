;;; tangonov-theme.el --- A 256 color dark theme featuring bright pastels

;; Copyright (C) 2022 Trevor Richards

;; Author: Trevor Richards <trev@trevdev.ca>
;; Maintainer: Trevor Richards <trev@trevdev.ca>
;; URL: https://github.com/trev-dev/tangonov
;; Created: 20th July, 2022
;; Keywords: faces, theme, dark
;; Version: 1.0.0

;; License: GPL3

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; This program is distributed in the hope that it will be useful,
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Somewhat inspired by Material Dark, tangonov aims to be a dark theme with
;; bright, pleasant pastel colors that are easy to distinguish from one another.

;;; Code:
;; Note: This file was generated using literate programming. See tangonov-theme.org.

;; [[file:tangonov-theme.org::*Dependences][Dependences:1]]
(require 'cl-lib)
;; Dependences:1 ends here

;; [[file:tangonov-theme.org::*Converting named colors to hexidecimal colors][Converting named colors to hexidecimal colors:1]]
(defun name-to-rgb (color)
  "Get the hexidecimal version of the named `COLOR'."
  (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
           for x in (tty-color-standard-values (downcase color))
           collect (/ x div)))
;; Converting named colors to hexidecimal colors:1 ends here

;; [[file:tangonov-theme.org::*Blending colors][Blending colors:1]]
(defun color-blend (c1 c2 alpha)
  "Blend hexidecimal colors `C1' and `C2' together by a coefficient of `ALPHA'."
  (when (and c1 c2)
    (cond ((or (listp c1) (listp c2))
           (cl-loop for x in c1
                    when (if (listp c2) (pop c2) c2)
                    collect (color-blend x it alpha)))

          ((and (string-prefix-p "#" c1) (string-prefix-p "#" c2))
           (apply (lambda (r g b)
                    (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                  (cl-loop for it    in (name-to-rgb c1)
                           for other in (name-to-rgb c2)
                           collect (+ (* alpha it) (* other (- 1 alpha))))))

          (c1))))
;; Blending colors:1 ends here

;; [[file:tangonov-theme.org::*Blending colors][Blending colors:2]]
(defun color-darken (color alpha)
  "Darken a hexidecimal `COLOR' by a coefficient of `ALPHA'.
Alpha should be a float between 0 and 1."
  (cond ((listp color)
         (cl-loop for c in color collect (color-darken c alpha)))

        ((color-blend color "#000000" (- 1 alpha)))))

(defun color-lighten (color alpha)
  "Lighten a hexidecimal `COLOR' by a coefficient of `ALPHA'.
Alpha should be a float between 0 and 1."
  (cond ((listp color)
         (cl-loop for c in color collect (color-lighten c alpha)))

        ((color-blend color "#FFFFFF" (- 1 alpha)))))

(color-lighten "#000000" 0.2)
;; Blending colors:2 ends here

;; [[file:tangonov-theme.org::*Color Definitions][Color Definitions:1]]
(deftheme tangonov
  "A 256 color dark theme featuring bright pastels.")

(let ((spec '((class color) (min-colors 256)))
      (fg        "#EEFFFF")
      (fg-alt    "#BFC7D5")
      (bg        "#191919")
      (bg-alt    "#232323")
      (red       "#FF7B85")
      (green     "#ABDC88")
      (yellow    "#FFCA41")
      (orange    "#FF996B")
      (blue      "#82AAFF")
      (magenta   "#C792EA")
      (violet    "#BB80B3")
      (cyan      "#89DDFF")
      (teal      "#44b9b1")
      (gray1     "#303030")
      (gray2     "#626262")
      (gray3     "#A8A8A8"))
  (custom-theme-set-faces
   'tangonov
;; Color Definitions:1 ends here

;; [[file:tangonov-theme.org::*Basic Faces][Basic Faces:1]]
   `(default ((,spec (:background ,bg :foreground ,fg))))
   `(bold ((,spec (:weight bold))))
   `(italic ((,spec (:slant italic))))
   `(bold-italic ((,spec (:weight bold :slant italic))))
   `(underline ((,spec (:underline t))))
   `(shadow ((,spec (:foreground ,gray2))))
   `(link ((,spec (:foreground ,blue :weight bold :underline t))))
   `(link-visited ((,spec (:inherit link :foreground ,magenta))))
   `(highlight ((,spec (:background ,gray1 :weight bold))))
   `(match ((,spec (:foreground ,green :background ,(color-darken green 0.5)))))
   `(isearch ((,spec (:inherit match :weight bold))))
   `(region ((,spec (:foreground ,cyan :background ,(color-darken cyan 0.5)))))
   `(secondary-selection ((,spec (:background ,gray2 :foreground ,fg))))
   `(lazy-highlight ((,spec (:inherit isearch))))
   `(error ((,spec (:foreground ,red))))
   `(warning ((,spec (:foreground ,yellow))))
   `(success ((,spec (:foreground ,green))))
   `(escape-glyph ((,spec (:foreground ,orange))))
   `(homoglyph ((,spec (:foreground ,orange))))
   `(vertical-border ((,spec (:foreground ,gray1))))
   `(cursor ((,spec (:background ,yellow))))
   `(minibuffer-prompt ((,spec (:foreground ,yellow))))
   `(line-number-current-line ((,spec (:foreground ,cyan :background ,gray1))))
   `(completions-common-part ((,spec (:foreground ,cyan))))
   `(completions-first-difference ((,spec (:foreground ,yellow))))
   `(trailing-whitespace ((,spec (:background ,red))))
   `(whitespace-trailing ((,spec (:background ,red))))
;; Basic Faces:1 ends here

;; [[file:tangonov-theme.org::*Easy Customization][Easy Customization:1]]
   `(custom-button
     ((,spec
       (:foreground ,blue :background ,bg :box '(:line-width 1 :style none)))))
   `(custom-button-unraised
     ((,spec (:foreground ,violet :background
                          ,bg :box '(:line-width 1 :style none)))))
   `(custom-button-pressed-unraised
     ((,spec
       (:foreground ,bg :background
                    ,violet :box '(:line-width 1 :style none)))))
   `(custom-button-pressed
     ((,spec (:foreground ,bg :background
                          ,blue :box '(:line-width 1 :style none)))))
   `(custom-button-mouse
     ((,spec (:foreground ,bg :background ,blue
                          :box '(:line-width 1 :style none)))))
   `(custom-variable-button ((,spec (:foreground ,green :underline t))))
   `(custom-saved
     ((,spec (:foreground ,green :background
                          ,(color-darken green 0.5) :bold bold))))
   `(custom-comment ((,spec (:foreground ,fg))))
   `(custom-comment-tag ((,spec (:foreground ,gray2))))
   `(custom-modified
     ((,spec (:foreground ,blue :background ,(color-darken blue 0.5)))))
   `(custom-variable-tag ((,spec (:foreground ,magenta))))
   `(custom-visibility ((,spec (:foreground ,blue :underline nil))))
   `(custom-group-subtitle ((,spec (:foreground ,red))))
   `(custom-group-tag ((,spec (:foreground ,violet))))
   `(custom-group-tag-1 ((,spec (:foreground ,blue))))
   `(custom-set ((,spec (:foreground ,yellow :background ,bg))))
   `(custom-themed ((,spec (:foreground ,yellow :background ,bg))))
   `(custom-invalid ((,spec (:foreground ,red
                                         :background ,(color-darken red 0.5)))))
   `(custom-variable-obsolete ((,spec (:foreground ,gray2 :background ,bg))))
   `(custom-state
     ((,spec (:foreground ,green :background ,(color-darken green 0.5)))))
   `(custom-changed ((,spec (:foreground ,blue :background ,bg))))
;; Easy Customization:1 ends here

;; [[file:tangonov-theme.org::*Avy][Avy:1]]
   `(avy-goto-char-timer-face
     ((,spec (:inherit isearch))))
   `(avy-background-face ((,spec (:foreground ,(color-darken bg 0.2)))))
   `(avy-lead-face
     ((,spec (:foreground ,red :weight bold))))
   `(avy-lead-face-0
     ((,spec (:inherit avy-lead-face :foreground ,yellow))))
   `(avy-lead-face-1
     ((,spec (:inheri avy-lead-face :foreground ,(color-darken yellow 0.4)))))
   `(avy-lead-face-2
     ((,spec (:inherit avy-lead-face :foreground ,(color-darken yellow 0.6)))))
;; Avy:1 ends here

;; [[file:tangonov-theme.org::*Modeline & Tabbar][Modeline & Tabbar:1]]
   ;; Modeline/Tabline
   `(mode-line
     ((,spec (:foreground ,fg :background ,bg-alt :box
                          (:line-width (2 . 2) :color ,bg-alt)))))
   `(mode-line-inactive
     ((,spec (:inherit mode-line :foreground ,gray2 :background ,bg))))
   `(mode-line-highlight ((,spec (:box (:line-width (2 . 2) :color ,magenta)))))
   `(mode-line-buffer-id ((,spec (:weight bold))))
   `(tab-line ((,spec (:foreground ,fg :background ,bg-alt))))
;; Modeline & Tabbar:1 ends here

;; [[file:tangonov-theme.org::*Notmuch][Notmuch:1]]
   `(notmuch-message-summary-face
     ((,spec (:foreground ,gray2 :background nil))))
   `(notmuch-search-count ((,spec (:foreground ,gray2))))
   `(notmuch-search-date ((,spec (:foreground ,orange))))
   `(notmuch-search-flagged-face
     ((,spec (:foreground ,(color-darken red 0.5)))))
   `(notmuch-search-matching-authors ((,spec (:foreground ,blue))))
   `(notmuch-search-non-matching-authors ((,spec (:foreground ,fg))))
   `(notmuch-search-subject ((,spec (:foreground ,fg))))
   `(notmuch-search-unread-face ((,spec (:weight bold))))
   `(notmuch-tag-added ((,spec (:foreground ,green :weight normal))))
   `(notmuch-tag-deleted ((,spec (:foreground ,red :weight normal))))
   `(notmuch-tag-face ((,spec (:foreground ,yellow :weight normal))))
   `(notmuch-tag-flagged ((,spec (:foreground ,yellow :weight normal))))
   `(notmuch-tag-unread ((,spec (:foreground ,yellow :weight normal))))
   `(notmuch-tree-match-author-face ((,spec (:foreground ,blue :weight bold))))
   `(notmuch-tree-match-date-face ((,spec (:foreground ,orange :weight bold))))
   `(notmuch-tree-match-face ((,spec (:foreground ,fg))))
   `(notmuch-tree-match-subject-face ((,spec (:foreground ,fg))))
   `(notmuch-tree-match-tag-face ((,spec (:foreground ,yellow))))
   `(notmuch-tree-match-tree-face ((,spec (:foreground ,gray2))))
   `(notmuch-tree-no-match-author-face ((,spec (:foreground ,blue))))
   `(notmuch-tree-no-match-date-face ((,spec (:foreground ,orange))))
   `(notmuch-tree-no-match-face ((,spec (:foreground ,gray3))))
   `(notmuch-tree-no-match-subject-face ((,spec (:foreground ,gray3))))
   `(notmuch-tree-no-match-tag-face ((,spec (:foreground ,yellow))))
   `(notmuch-tree-no-match-tree-face ((,spec (:foreground ,yellow))))
   `(notmuch-wash-cited-text ((,spec (:foreground ,gray1))))
   `(notmuch-wash-toggle-button ((,spec (:foreground ,fg))))
;; Notmuch:1 ends here

;; [[file:tangonov-theme.org::*ERC][ERC:1]]
`(erc-button ((,spec (:weight bold :underline t))))
`(erc-default-face ((,spec (:inherit default))))
`(erc-action-face ((,spec (:weight bold))))
`(erc-command-indicator-face ((,spec (:weight bold))))
`(erc-direct-msg-face ((,spec (:foreground ,magenta))))
`(erc-error-face ((,spec (:inherit 'error))))
`(erc-header-line
  ((,spec (:background ,(color-darken bg-alt 0.15) :foreground ,cyan))))
`(erc-input-face ((,spec (:foreground ,green))))
`(erc-current-nick-face ((,spec (:foreground ,green :weight bold))))
`(erc-timestamp-face ((,spec (:foreground ,blue :weight bold))))
`(erc-nick-default-face ((,spec (:weight bold))))
`(erc-nick-msg-face ((,spec (:foreground ,magenta))))
`(erc-nick-prefix-face ((,spec (:inherit 'erc-nick-default-face))))
`(erc-my-nick-face ((,spec (:foreground ,green :weight bold))))
`(erc-my-nick-prefix-face ((,spec (:inherit 'erc-my-nick-face))))
`(erc-notice-face ((,spec (:foreground ,gray2))))
`(erc-prompt-face ((,spec (:foreground ,cyan :weight bold))))
;; ERC:1 ends here

;; [[file:tangonov-theme.org::*Font Lock Faces][Font Lock Faces:1]]
   ;; Font Lock
   `(font-lock-warning-face ((,spec (:inherit warning))))
   `(font-lock-function-name-face ((,spec (:foreground ,blue))))
   `(font-lock-variable-name-face ((,spec (:foreground ,yellow))))
   `(font-lock-keyword-face ((,spec (:foreground ,cyan))))
   `(font-lock-comment-face ((,spec (:foreground ,gray2))))
   `(font-lock-type-face ((,spec (:foreground ,magenta))))
   `(font-lock-constant-face ((,spec (:foreground ,orange))))
   `(font-lock-builtin-face ((,spec (:foreground ,cyan))))
   `(font-lock-string-face ((,spec (:foreground ,green))))
   `(font-lock-doc-face ((,spec (:foreground ,gray2))))
   `(font-lock-negation-char-face ((,spec (:foreground ,orange))))
;; Font Lock Faces:1 ends here

;; [[file:tangonov-theme.org::*Goggles][Goggles:1]]
   `(goggles-changed ((,spec (:background ,cyan))))
   `(goggles-added ((,spec (:background ,green))))
   `(goggles-removed ((,spec (:background ,red))))
;; Goggles:1 ends here

;; [[file:tangonov-theme.org::*Eglot][Eglot:1]]
   `(eglot-highlight-symbol-face ((,spec (:weight bold :background ,gray1))))
;; Eglot:1 ends here

;; [[file:tangonov-theme.org::*Eldoc Box][Eldoc Box:1]]
   `(eldoc-highlight-function-argument ((,spec (:weight bold :underline t))))
   `(eldoc-box-border ((,spec (:background ,fg-alt))))
;; Eldoc Box:1 ends here

;; [[file:tangonov-theme.org::*Documents][Documents:1]]
   `(org-block ((,spec (:background ,bg-alt))))
   `(org-block-background ((,spec (:background ,bg-alt))))
   `(org-block-begin-line ((,spec (:foreground ,gray2 :background ,bg))))
   `(org-level-1 ((,spec (:foreground ,green))))
   `(org-level-2 ((,spec (:foreground ,yellow))))
   `(org-level-3 ((,spec (:foreground ,red))))
   `(org-level-4 ((,spec (:foreground ,cyan))))
   `(org-level-5 ((,spec (:foreground ,blue))))
   `(org-level-6 ((,spec (:foreground ,magenta))))
   `(org-level-7 ((,spec (:foreground ,teal))))
   `(org-level-8 ((,spec (:foreground ,violet))))
   `(org-todo ((,spec (:foreground ,orange))))
   `(org-done ((,spec (:foreground ,gray2))))
   `(org-drawer ((,spec (:foreground ,gray2))))
   `(org-meta-line ((,spec (:foreground ,gray2))))
   `(org-special-keyword ((,spec (:foreground ,gray3))))
   `(org-property-value ((,spec (:foreground ,red))))
   `(org-tag ((,spec (:foreground ,fg-alt))))
   `(org-verbatim ((,spec (:foreground ,green))))
   `(org-code ((,spec (:foreground ,orange :background ,bg-alt))))
   `(org-document-info-keyword ((,spec (:foreground ,red))))
   `(org-document-info ((,spec (:foreground ,fg-alt))))
   `(org-document-title ((,spec (:foreground ,yellow))))
   `(org-date ((,spec (:foreground ,yellow))))
   `(org-checkbox ((,spec (:foreground ,orange))))
   `(org-checkbox-statistics-todo ((,spec (:inherit org-checkbox))))
   `(org-checkbox-statistics-done ((,spec (:inherit org-done))))
;; Documents:1 ends here

;; [[file:tangonov-theme.org::*Agenda][Agenda:1]]
   `(org-agenda-done ((,spec (:inherit org-done))))
   `(org-agenda-clocking
     ((,spec (:background ,(color-darken cyan 0.5) :extend t))))
   `(org-time-grid ((,spec (:foreground ,gray2))))
   `(org-imminent-deadline ((,spec (:foreground ,yellow))))
   `(org-upcoming-deadline ((,spec (:foreground ,teal))))
   `(org-agenda-dimmed-todo-face ((,spec (:foreground ,gray3))))
;; Agenda:1 ends here

;; [[file:tangonov-theme.org::*Diff-hl][Diff-hl:1]]
   `(diff-hl-change ((,spec (:background ,blue :foreground ,blue))))
   `(diff-hl-delete ((,spec (:background ,red :foreground ,red))))
   `(diff-hl-insert ((,spec (:background ,green :foreground ,green))))
;; Diff-hl:1 ends here

;; [[file:tangonov-theme.org::*Magit][Magit:1]]
   `(magit-bisect-bad ((,spec (:foreground ,red))))
   `(magit-bisect-good ((,spec (:foreground ,green))))
   `(magit-bisect-skip ((,spec (:foreground ,orange))))
   `(magit-blame-hash ((,spec (:foreground ,cyan))))
   `(magit-blame-date ((,spec (:foreground ,red))))
   `(magit-blame-heading
     ((,spec (:foreground ,orange :background ,gray3 :extend t))))
   `(magit-branch-current ((,spec (:foreground ,blue))))
   `(magit-branch-local ((,spec (:foreground ,cyan))))
   `(magit-branch-remote ((,spec (:foreground ,green))))
   `(magit-cherry-equivalent ((,spec (:foreground ,violet))))
   `(magit-cherry-unmatched ((,spec (:foreground ,cyan))))
   `(magit-diff-added
     ((,spec (:foreground ,(color-darken green 0.2) :background
                          ,(color-blend green bg 0.1) :extend t))))
   `(magit-diff-added-highlight
     ((,spec (:foreground ,green :background
                          ,(color-blend green bg 0.2) :weight bold :extend t))))
   `(magit-diff-base
     ((,spec (:foreground ,(color-darken orange 0.2) :background
                          ,(color-blend orange bg 0.1) :extend t))))
   `(magit-diff-base-highlight
     ((,spec (:foreground ,orange :background
                          ,(color-blend orange bg 0.2) :weight bold :extend t))))
   `(magit-diff-context
     ((,spec (:foreground ,(color-darken fg 0.4) :background ,bg :extend t))))
   `(magit-diff-context-highlight
     ((,spec (:foreground ,fg :background ,bg-alt :extend t))))
   `(magit-diff-file-heading ((,spec (:foreground ,fg :weight bold :extend t))))
   `(magit-diff-file-heading-selection ((,spec (:foreground ,magenta :background ,(color-darken blue 0.5) :weight bold :extend t))))
   `(magit-diff-hunk-heading ((,spec (:foreground ,bg :background ,(color-blend violet bg 0.3) :extend t))))
   `(magit-diff-hunk-heading-highlight ((,spec (:foreground ,bg :background ,violet :weight bold :extend t))))
   `(magit-diff-lines-heading ((,spec (:foreground ,yellow :background ,red :extend t :extend t))))
   `(magit-diff-removed ((,spec (:foreground ,(color-darken red 0.2) :background ,(color-blend red gray3 0.1) :extend t))))
   `(magit-diff-removed-highlight ((,spec (:foreground ,red :background ,(color-blend red gray3 0.2) :weight bold :extend t))))
   `(magit-diffstat-added ((,spec (:foreground ,green))))
   `(magit-diffstat-removed ((,spec (:foreground ,red))))
   `(magit-dimmed ((,spec (:foreground ,gray2))))
   `(magit-hash ((,spec (:foreground ,gray2))))
   `(magit-header-line
    ((,spec (:background
             ,(color-darken blue 0.5) :foreground ,gray3 :weight bold
             :box `(:line-width 3 :color ,(color-darken blue 0.5))))))
   `(magit-filename ((,spec (:foreground ,violet))))
   `(magit-log-author ((,spec (:foreground ,orange))))
   `(magit-log-date ((,spec (:foreground ,blue))))
   `(magit-log-graph ((,spec (:foreground ,gray2))))
   `(magit-process-ng ((,spec (:inherit error))))
   `(magit-process-ok ((,spec (:inherit success))))
   `(magit-reflog-amend ((,spec (:foreground ,magenta))))
   `(magit-reflog-checkout ((,spec (:foreground ,blue))))
   `(magit-reflog-cherry-pick ((,spec (:foreground ,green))))
   `(magit-reflog-commit ((,spec (:foreground ,green))))
   `(magit-reflog-merge ((,spec (:foreground ,green))))
   `(magit-reflog-other ((,spec (:foreground ,cyan))))
   `(magit-reflog-rebase ((,spec (:foreground ,magenta))))
   `(magit-reflog-remote ((,spec (:foreground ,cyan))))
   `(magit-reflog-reset ((,spec (:inherit error))))
   `(magit-refname ((,spec (:foreground ,gray2))))
   `(magit-section-heading ((,spec (:foreground ,blue :weight bold :extend t))))
   `(magit-section-heading-selection ((,spec (:foreground ,orange :weight bold :extend t))))
   `(magit-section-highlight ((,spec (:inherit 'hl-line))))
   `(magit-section-secondary-heading ((,spec (:foreground ,violet :weight bold :extend t))))
   `(magit-sequence-drop ((,spec (:foreground ,red))))
   `(magit-sequence-head ((,spec (:foreground ,blue))))
   `(magit-sequence-part ((,spec (:foreground ,orange))))
   `(magit-sequence-stop ((,spec (:foreground ,green))))
   `(magit-signature-bad ((,spec (:inherit error))))
   `(magit-signature-error ((,spec (:inherit error))))
   `(magit-signature-expired ((,spec (:foreground ,orange))))
   `(magit-signature-good ((,spec (:inherit success))))
   `(magit-signature-revoked ((,spec (:foreground ,magenta))))
   `(magit-signature-untrusted ((,spec (:foreground ,yellow))))
   `(magit-tag ((,spec (:foreground ,yellow))))
;; Magit:1 ends here

;; [[file:tangonov-theme.org::*CSS][CSS:1]]
   `(css-proprietary-property ((,spec (:foreground ,orange))))
   `(css-property ((,spec (:foreground ,green))))
   `(css-selector ((,spec (:foreground ,blue))))
;; CSS:1 ends here

;; [[file:tangonov-theme.org::*Typescript.el][Typescript.el:1]]
   `(typescript-jsdoc-tag ((,spec (:foreground ,magenta))))
   `(typescript-jsdoc-type ((,spec (:foreground ,gray3))))
   `(typescript-jsdoc-value ((,spec (:foreground ,cyan))))
;; Typescript.el:1 ends here

;; [[file:tangonov-theme.org::*Eshell][Eshell:1]]
   `(eshell-prompt ((,spec (:foreground ,magenta :weight bold))))
   `(eshell-ls-archive ((,spec (:foreground ,gray2))))
   `(eshell-ls-backup ((,spec (:foreground ,yellow))))
   `(eshell-ls-clutter ((,spec (:foreground ,red))))
   `(eshell-ls-directory ((,spec (:foreground ,blue))))
   `(eshell-ls-executable ((,spec (:foreground ,green))))
   `(eshell-ls-missing ((,spec (:foreground ,red))))
   `(eshell-ls-product ((,spec (:foreground ,orange))))
   `(eshell-ls-readonly ((,spec (:foreground ,orange))))
   `(eshell-ls-special ((,spec (:foreground ,violet))))
   `(eshell-ls-symlink ((,spec (:foreground ,cyan))))
   `(eshell-ls-unreadable ((,spec (:foreground ,gray3))))
;; Eshell:1 ends here

;; [[file:tangonov-theme.org::*Vterm][Vterm:1]]
   `(vterm-color-black
     ((,spec (:background ,gray1 :foreground ,(color-lighten gray1 0.2)))))
   `(vterm-color-red
     ((,spec (:background ,red :foreground ,(color-lighten red 0.2)))))
   `(vterm-color-green
     ((,spec (:background ,green :foreground ,(color-lighten green 0.2)))))
   `(vterm-color-yellow
     ((,spec (:background ,yellow :foreground ,(color-lighten yellow 0.2)))))
   `(vterm-color-blue
     ((,spec (:background ,blue :foreground ,(color-lighten blue 0.2)))))
   `(vterm-color-magenta
     ((,spec (:background ,magenta :foreground ,(color-lighten violet 0.2)))))
   `(vterm-color-cyan
     ((,spec (:background ,cyan :foreground ,(color-lighten cyan 0.2)))))
   `(vterm-color-white ((,spec (:background ,fg :foreground ,gray3))))
;; Vterm:1 ends here

;; [[file:tangonov-theme.org::*Web Mode][Web Mode:1]]
   `(web-mode-html-tag-face ((,spec (:foreground ,red))))
   `(web-mode-html-attr-equal-face ((,spec (:foreground ,cyan))))
;; Web Mode:1 ends here

;; [[file:tangonov-theme.org::*Rainbow Delimiters][Rainbow Delimiters:1]]
   `(rainbow-delimiters-depth-1-face ((,spec (:foreground ,magenta))))
   `(rainbow-delimiters-depth-2-face ((,spec (:foreground ,orange))))
   `(rainbow-delimiters-depth-3-face ((,spec (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face ((,spec (:foreground ,cyan))))
   `(rainbow-delimiters-depth-5-face ((,spec (:foreground ,violet))))
   `(rainbow-delimiters-depth-6-face ((,spec (:foreground ,yellow))))
   `(rainbow-delimiters-depth-7-face ((,spec (:foreground ,blue))))
   `(rainbow-delimiters-depth-8-face ((,spec (:foreground ,teal))))
   `(rainbow-delimiters-depth-9-face ((,spec (:foreground ,red))))
;; Rainbow Delimiters:1 ends here

;; [[file:tangonov-theme.org::*RJSX Mode][RJSX Mode:1]]
   `(rjsx-tag ((,spec (:foreground ,red))))
   `(rjsx-attr ((,spec (:foreground ,yellow :slant italic :weight medium))))
   `(rjsx-tag-bracket-face ((,spec (:foreground ,cyan))))
;; RJSX Mode:1 ends here

;; [[file:tangonov-theme.org::*List End & Provide Theme][List End & Provide Theme:1]]
  ))
(provide-theme 'tangonov)
;; List End & Provide Theme:1 ends here

;;; tangonov-theme.el ends here
