(define (problem S1-Ex29_W1-Ex1)
    (:domain flow-shop)
    (:objects
        worker1 - worker
        station1 - station
        buffer0 buffer1 - buffer
        helpproduct product1 product2 product3 product4 product5 - product
        variant1 - variant
    )

    (:init
        (product-of-variant product1 variant1)
        (product-of-variant product2 variant1)
        (product-of-variant product3 variant1)
        (product-of-variant product4 variant1)
        (product-of-variant product5 variant1)

        (end-buffer buffer1)

        (worker-released worker1)

        (product-released product1)
        (product-released product2)
        (product-released product3)
        (product-released product4)
        (product-released product5)

        (worker-at-station worker1 station1)


        (product-at-buffer product1 buffer0)
        (product-at-buffer product2 buffer0)
        (product-at-buffer product3 buffer0)
        (product-at-buffer product4 buffer0)
        (product-at-buffer product5 buffer0)

        (buffer-unused buffer1)

        (station-unused station1)


        (station-not-processing station1)

        (buffer-before-station buffer0 station1)

        (buffer-after-station buffer1 station1)


        (manual-process station1 variant1)

        (product-before helpproduct product1)
        (product-before product1 product2)
        (product-before product2 product3)
        (product-before product3 product4)
        (product-before product4 product5)


        (product-processed helpproduct station1)

        (= (release-time-worker worker1) 0)

        (= (release-time-product product1) 0)
        (= (release-time-product product2) 0)
        (= (release-time-product product3) 0)
        (= (release-time-product product4) 0)
        (= (release-time-product product5) 0)

        (= (walk-time worker1 station1 station1) 0)




        (= (manual-work-time worker1 station1 variant1) 100)
    )

    (:goal
        (and
        (product-at-buffer product1 buffer1)
        (product-at-buffer product2 buffer1)
        (product-at-buffer product3 buffer1)
        (product-at-buffer product4 buffer1)
        (product-at-buffer product5 buffer1)
        )
    )

    (:metric minimize (total-time))
)
