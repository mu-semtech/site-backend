(in-package :mu-cl-resources)

;;;; define the resource

(define-resource page ()
  :class (s-url "http://mu.semte.ch/vocabulary/cms/Page")
  :resource-base (s-url "http://mu.semte.ch/cms/resources/pages/")
  :properties `((:title :string ,(s-prefix "dcterms:title"))
                (:content :string ,(s-prefix "cms:pageContent")))
  :on-path "pages")
