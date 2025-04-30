(defparameter *lr-desc* '(you are in the living-room. a wizard is snoring loudly on the couch))
(defparameter *attic-desc* '(you are in the attic. there is a well in front of you.))
(defparameter *well-desc* '(?????))
(defparameter *garden-desc* '(you are in the garden. there is a giant welding torch in the corner.))

(defparameter *nodes* 
`(
    (living-room ,*lr-desc*)
    (attic ,*attic-desc*)
    (garden ,*garden-desc*)
    (well ,*well-desc*)
))
