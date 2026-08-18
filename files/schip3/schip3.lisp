;;; -*-LISP-*-
;No ALLOC parameters in INIT file
(comment)

((lambda (^w)
	 ;Want pure LISP pages flushed when suspending
	 (sstatus flush t)

	 ;Don't want obnoxious load messages for format
	 (sstatus feature noldmsg)

	 ;Needs lots of list space before GC overflow
	 (alloc '(list 150000. symbol 5000. fixnum 35000. array 1000000.))

	 ;Nice output
	 (setq old-prin1 prin1)
	 (setq prin1 'sprin1)

	 ;Return something meaningful
	 (setq ^w nil)
	 (terpri)
	 (format t '|~%|)
	 (and (status feature experimental)
	      (format t '|Experimental |))
	 (format t '|LISP version ~A~%| (status lispversion))
	 (sstatus feature alan/;flush)
	 (load '|alan;lspenv init|)
	 (load '|hanson;lspack >|)
	 (sstatus nofeature noldmsg)
	 (defprop debug (debug* fasl dsk liblsp) autoload)
	 (defprop describe (desc fasl dsk liblsp) autoload)
	 (defprop dribble (dribble fasl dsk liblsp) autoload)
	 (fasload ledit* fasl dsk liblsp)
	 (setq ledit-tags-find-file 1) ; default, but just in case
	 (setq ledit-jname 'e)
	 (setq pure 1.)
	 '*)
 t)


