(define (domain flow-shop)
	(:requirements :durative-actions :fluents :typing)

	(:types 
		station - object
		buffer - object
		product - object
		worker - object
		variant - object
	)

    	(:predicates 
		
		(product-of-variant ?p - product ?v - variant)

		(end-buffer ?b - buffer)

		(worker-released ?w - worker)
		(product-released ?p - product)
		
		(worker-at-station ?w - worker ?s - station)
		(product-at-station ?p - product ?s - station)
		(product-at-buffer ?p - product ?b - buffer)
		
		(buffer-unused ?b - buffer)
		(station-unused ?s - station)
		
		(station-processing ?s - station)
		(station-not-processing ?s - station)
		
		(buffer-before-station ?b - buffer ?s - station)
		(buffer-after-station ?b - buffer ?s - station)
		
		(automatic-process ?s - station ?v - variant)
		(manual-process ?s - station ?v - variant)

		(product-before ?p1 - product ?p2 - product)
		(product-processed ?p - product ?s - station)
		
	)
	
	(:functions
		(release-time-worker ?w - worker)
		(release-time-product ?p - product)
		(walk-time ?w - worker ?from - station ?to - station)
		(setup-time ?w - worker ?s - station ?v - variant)
		(automatic-work-time ?w - worker ?s - station ?v - variant)
		(takedown-time ?w - worker ?s - station ?v - variant)
		(manual-work-time ?w - worker ?s - station ?v - variant)
	)

	(:durative-action release-worker
	:parameters
		(?w - worker)
	:duration
		(= ?duration (release-time-worker ?w))
	:condition
		(and
		(at start (not (worker-released ?w)))
		)
	:effect
		(and
		(at end (worker-released ?w))
		)	
	)
	
	(:durative-action release-product
	:parameters
		(?p - product)
	:duration
		(= ?duration (release-time-product ?p))
	:condition
		(and
		(at start (not (product-released ?p)))
		)
	:effect
		(and
		(at end (product-released ?p))
		)	
	)


	(:durative-action move
       :parameters  
       	(?from - station
       	?to - station 
       	?w - worker)
       :duration 
       	(= ?duration (walk-time ?w ?from ?to))
       :condition 
       	(and  
		(at start (worker-released ?w))
		(at start (worker-at-station ?w ?from)) 
		)
       :effect 
       	(and  	
       		(at start (not (worker-at-station ?w ?from)))
       		(at end (worker-at-station ?w ?to))
		)
	)
	
	(:durative-action automatic-setup
       :parameters  
       	(?s - station
       	?b - buffer 
       	?w - worker
       	?p - product
	?v - variant
	?pbefore - product)
       :duration 
       	(= ?duration (setup-time ?w ?s ?v))
       :condition 
       	(and  
	(at start (product-of-variant ?p ?v))
       	
       	(at start (buffer-before-station ?b ?s))
       	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))
       	
       	(at start (station-unused ?s))
       	(over all (worker-at-station ?w ?s))
       	(at start (product-at-buffer ?p ?b))
       	(at start (station-not-processing ?s))
    	(at start (automatic-process ?s ?v)) 

	(at start (product-before ?pbefore ?p))
	(at start (product-processed ?pbefore ?s))	
		)
       :effect 
       	(and 
       	(at start (not(station-unused ?s)))
       	(at end (not (product-at-buffer ?p ?b)))
       	(at end (station-processing ?s))
       	(at end (not (station-not-processing ?s)))
       	(at end (product-at-station ?p ?s))
       	(at end (buffer-unused ?b))
		)
	)
	
	(:durative-action automatic-work
       :parameters  
       	(?s - station
       	?w - worker
       	?p - product
	?v - variant)
       :duration 
       	(= ?duration (automatic-work-time ?w ?s ?v))
       :condition 
       	(and         	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))

	(at start (product-of-variant ?p ?v))
       	
       	(over all (product-at-station ?p ?s))
       	(at start (station-processing ?s))
       	(at start (automatic-process ?s ?v))
		)
       :effect 
       	(and  	
       	(at end (not (station-processing ?s)))
       	(at end (station-not-processing ?s))
		)
	)
	
	(:durative-action automatic-takedown
       :parameters  
       	(?s - station
       	?b - buffer 
       	?w - worker
       	?p - product
	?v - variant)
       :duration 
       	(= ?duration (takedown-time ?w ?s ?v))
       :condition 
       	(and  

	(at start (product-of-variant ?p ?v))
       	
       	(at start (buffer-after-station ?b ?s))
       	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))
       	
       	(at end (buffer-unused ?b))
       	
	(over all (worker-at-station ?w ?s))
       	(at start (product-at-station ?p ?s))
  	(at start (station-not-processing ?s))
  	(at start (automatic-process ?s ?v))       	
		)
       :effect 
       	(and
	(at end (product-processed ?p ?s))
       	(at end (not (buffer-unused ?b)))
       	(at end (product-at-buffer ?p ?b))
       	(at end (station-unused ?s))
       	(at end (not (product-at-station ?p ?s)))
		)
	)
	
	(:durative-action automatic-takedown-endbuffer
       :parameters  
       	(?s - station
       	?b - buffer 
       	?w - worker
       	?p - product
	?v - variant)
       :duration 
       	(= ?duration (takedown-time ?w ?s ?v))
       :condition 
       	(and  

	(at start (product-of-variant ?p ?v))

       	(at start (buffer-after-station ?b ?s))
       	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))
       	
       	(at start (end-buffer ?b))
       	(over all (worker-at-station ?w ?s))
       	(at start (product-at-station ?p ?s))
  	(at start (station-not-processing ?s))
  	(at start (automatic-process ?s ?v))       	
		)
       :effect 
       	(and
	(at end (product-processed ?p ?s))
       	(at end (product-at-buffer ?p ?b))
       	(at end (station-unused ?s))
       	(at end (not (product-at-station ?p ?s)))
		)
	)
	
	
	(:durative-action manual-work
       :parameters  
       	(?s - station
       	?before - buffer
       	?after - buffer 
       	?w - worker
       	?p - product
	?v - variant
	?pbefore - product)
       :duration 
       	(= ?duration (manual-work-time ?w ?s ?v))
       :condition 
       	(and  

	(at start (product-of-variant ?p ?v))

	(at start (product-before ?pbefore ?p))
	(at start (product-processed ?pbefore ?s))
       	
       	(at start (buffer-before-station ?before ?s))
       	(at start (buffer-after-station ?after ?s))
       	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))
       	
       	(at start (station-unused ?s))
       	(over all (worker-at-station ?w ?s))
       	(at start (product-at-buffer ?p ?before))
       	(at start (station-not-processing ?s))
       	(at end (buffer-unused ?after))
    	(at start (manual-process ?s ?v))  	
     
		)
       :effect 
       	(and  	
       	(at start (station-processing ?s))
       	(at start (not (station-not-processing ?s)))
       	(at start (not (station-unused ?s)))
       	(at start (not (product-at-buffer ?p ?before)))
       	(at start (buffer-unused ?before))
       	
       	(at end (not (station-processing ?s)))
       	(at end (station-not-processing ?s))
       	(at end (station-unused ?s))
	(at end (product-processed ?p ?s))
       	(at end (not (buffer-unused ?after)))
       	(at end (product-at-buffer ?p ?after))
		)
	)
	
	(:durative-action manual-work-endbuffer
       :parameters  
       	(?s - station
       	?before - buffer
       	?after - buffer 
       	?w - worker
       	?p - product
	?v - variant
	?pbefore - product)
       :duration 
       	(= ?duration (manual-work-time ?w ?s ?v))
       :condition 
       	(and  
	
	(at start (product-of-variant ?p ?v))

	(at start (product-before ?pbefore ?p))
	(at start (product-processed ?pbefore ?s))	
       	
       	(at start (buffer-before-station ?before ?s))
       	(at start (buffer-after-station ?after ?s))
       	
       	(at start (worker-released ?w))
       	(at start (product-released ?p))
       	
       	(at start (station-unused ?s))
       	(over all (worker-at-station ?w ?s))
       	(at start (product-at-buffer ?p ?before))
       	(at start (station-not-processing ?s))
       	(at start (end-buffer ?after))
    	(at start (manual-process ?s ?v))  	
     
		)
       :effect 
       	(and  	
       	(at start (station-processing ?s))
       	(at start (not (station-not-processing ?s)))
       	(at start (not (station-unused ?s)))
       	(at start (not (product-at-buffer ?p ?before)))
       	(at start (buffer-unused ?before))
       	
       	(at end (not (station-processing ?s)))
       	(at end (station-not-processing ?s))
       	(at end (station-unused ?s))
	(at end (product-processed ?p ?s))
       	(at end (product-at-buffer ?p ?after))
		)
	)
)

