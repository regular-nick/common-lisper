; nodes
(defparameter *nodes* 
`(
    (living-room ,*lr-desc*)
    (attic ,*attic-desc*)
    (garden ,*garden-desc*)
    (well ,*well-desc*)
))
; node descriptions
(defparameter *lr-desc* '(you are in the living-room. a wizard is snoring loudly on the couch))
(defparameter *attic-desc* '(you are in the attic. there is a well in front of you.))
(defparameter *well-desc* '(?????))
(defparameter *garden-desc* '(you are in the garden. there is a giant welding torch in the corner.))

; edges
(defparameter *edges*
'(
    (living-room (garden west door)
                 (attic upstairs ladder))
    (attic (living-room downstairs ladder))
    (garden (living-room east door)) 
    ; TODO add direction from garden to the well somehow
))

; objects
(defparameter *objects*
'(
    whiskey bucket frog chain glitch
))

; object locations
(defparameter *object-locations*
'(
    (whiskey living-room)
    (bucket living-room)
    (frog garden)
    (chain garden)
    (glitch well)
))

(defun describe-location (location nodes)
    (cadr (assoc location nodes)))


(defun describe-paths (location edges)
    (labels ((describe-path (edge)
    `(there is a ,(caddr edge) going ,(cadr edge) from here.)))
    (apply #'append (mapcar #'describe-path (cdr (assoc location edges))))))

(defun objects-at (loc objs obj-locs)
    (labels (
        (obj-at? (obj) 
        (eq (cadr (assoc obj obj-locs)) loc)))
        (remove-if-not #'obj-at? objs)))

; describe objects visible at loc
(defun describe-objs (loc objs obj-locs)
    (labels (
        (describe-obj (obj)
        `(You see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-locs)))))

; start place
(defparameter *location* 'living-room)

; user-facing functions
(defun look ()
    (append (describe-location *location* *nodes*)
            (describe-paths *location* *edges*)
            (describe-objs *location* *objects* *object-locations*)))