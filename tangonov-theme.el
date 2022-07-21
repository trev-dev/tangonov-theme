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

;; [[file:tangonov-theme.org::*Color Definitions][Color Definitions:1]]
(deftheme tangonov
  "A 256 color dark theme featuring bright pastels.")

(let ((spec '((class color) (min-colors 256)))
      (fg        "#EEFFFF")
      (fg-alt    "#BFC7D5")
      (bg        "#191919")
      (bg-alt    "#232323")
      (red       "#FF7B85")
      (dred      "#7F3D42")
      (green     "#ABDC88")
      (dgreen    "#556d43")
      (yellow    "#FFCA41")
      (dyellow   "#7f641f")
      (orange    "#FF996B")
      (dorange   "#7f4c35")
      (blue      "#82AAFF")
      (dblue     "#41547F")
      (magenta   "#C792EA")
      (violet    "#BB80B3")
      (cyan      "#89DDFF")
      (dcyan     "#446e7f")
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
   `(match ((,spec (:foreground ,green :background ,dgreen))))
   `(isearch ((,spec (:inherit match :weight bold))))
   `(region ((,spec (:foreground ,cyan :background ,dcyan))))
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
     ((,spec
       (:foreground ,violet :background ,bg
                    :box '(:line-width 1 :style none)))))
   `(custom-button-pressed-unraised
     ((,spec
       (:foreground ,bg :background ,violet
                    :box '(:line-width 1 :style none)))))
   `(custom-button-pressed
     ((,spec (:foreground ,bg :background ,blue
                          :box '(:line-width 1 :style none)))))
   `(custom-button-mouse
     ((,spec (:foreground ,bg :background ,blue
                          :box '(:line-width 1 :style none)))))
   `(custom-variable-button ((,spec (:foreground ,green :underline t))))
   `(custom-saved ((,spec (:foreground ,green :background ,dgreen :bold bold))))
   `(custom-comment ((,spec (:foreground ,fg))))
   `(custom-comment-tag ((,spec (:foreground ,gray2))))
   `(custom-modified ((,spec (:foreground ,blue :background ,dblue))))
   `(custom-variable-tag ((,spec (:foreground ,magenta))))
   `(custom-visibility ((,spec (:foreground ,blue :underline nil))))
   `(custom-group-subtitle ((,spec (:foreground ,red))))
   `(custom-group-tag ((,spec (:foreground ,violet))))
   `(custom-group-tag-1 ((,spec (:foreground ,blue))))
   `(custom-set ((,spec (:foreground ,yellow :background ,bg))))
   `(custom-themed ((,spec (:foreground ,yellow :background ,bg))))
   `(custom-invalid ((,spec (:foreground ,red :background ,dred))))
   `(custom-variable-obsolete ((,spec (:foreground ,gray2 :background ,bg))))
   `(custom-state ((,spec (:foreground ,green :background ,dgreen))))
   `(custom-changed ((,spec (:foreground ,blue :background ,bg))))
;; Easy Customization:1 ends here

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
   `(notmuch-message-summary-face ((,spec (:foreground ,gray2 :background nil))))
   `(notmuch-search-count ((,spec (:foreground ,gray2))))
   `(notmuch-search-date ((,spec (:foreground ,orange))))
   `(notmuch-search-flagged-face ((,spec (:foreground ,dred))))
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
   `(org-agenda-clocking ((,spec (:background ,dcyan :extend t))))
   `(org-time-grid ((,spec (:foreground ,gray2))))
   `(org-imminent-deadline ((,spec (:foreground ,yellow))))
   `(org-upcoming-deadline ((,spec (:foreground ,teal))))
;; Agenda:1 ends here

;; [[file:tangonov-theme.org::*Diff-hl][Diff-hl:1]]
   `(diff-hl-change ((,spec (:background ,blue :foreground ,blue))))
   `(diff-hl-delete ((,spec (:background ,red :foreground ,red))))
   `(diff-hl-insert ((,spec (:background ,green :foreground ,green))))
;; Diff-hl:1 ends here

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
