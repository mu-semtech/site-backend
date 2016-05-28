(in-package :mu-cl-resources)

;;;; define the resource

(define-resource menu-holder ()
  :class (s-prefix "cms:MenuHolder")
  :properties `((:slug :string ,(s-prefix "cms:slug")))
  :has-many `((menu :via ,(s-prefix "cms:hasMenu")
                    :as "menus"))
  :resource-base (s-url "http://mu.semte.ch/vocabulary/cms/menu-holders/")
  :on-path "menu-holders")

(define-resource menu ()
  :class (s-prefix "cms:Menu")
  :properties `((:slug :string ,(s-prefix "cms:slug"))
                (:title :string ,(s-prefix "dct:title")))
  :has-many `((menu :via ,(s-prefix "cms:subMenu")
                    :as "menus"))
  :has-one `((page :via ,(s-prefix "cms:hasPage")
                   :as "page")
             (menu :via ,(s-prefix "cms:subMenu")
                   :inverse t
                   :as "parent-menu")
             (menu-holder :via ,(s-prefix "cms:hasMenu")
                          :inverse t
                          :as "menu-holder"))
  :resource-base (s-url "http://mu.semte.ch/vocabulary/cms/menus/")
  :on-path "menus")

(define-resource page ()
  :class (s-prefix "cms:Page")
  :properties `((:content :string ,(s-prefix "dct:description")))
  :has-many `((menu :via ,(s-prefix "cms:hasPage")
                    :inverse t
                    :as "menus"))
  :resource-base (s-url "http://mu.semte.ch/vocabulary/cms/pages/")
  :on-path "pages")

