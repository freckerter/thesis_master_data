(define (problem S4-Ex30_W3-Ex7)
    (:domain flow-shop)
    (:objects
        worker1 worker2 worker3 - worker
        station1 station2 station3 station4 - station
        buffer0 buffer1 buffer2 buffer3 buffer4 - buffer
        helpproduct product1 product2 product3 product4 product5 product6 product7 product8 product9 product10 - product
        variant1 - variant
    )

    (:init
        (product-of-variant product1 variant1)
        (product-of-variant product2 variant1)
        (product-of-variant product3 variant1)
        (product-of-variant product4 variant1)
        (product-of-variant product5 variant1)
        (product-of-variant product6 variant1)
        (product-of-variant product7 variant1)
        (product-of-variant product8 variant1)
        (product-of-variant product9 variant1)
        (product-of-variant product10 variant1)

        (end-buffer buffer4)

        (worker-released worker1)
        (worker-released worker2)
        (worker-released worker3)

        (product-released product1)
        (product-released product2)
        (product-released product3)
        (product-released product4)
        (product-released product5)
        (product-released product6)
        (product-released product7)
        (product-released product8)
        (product-released product9)
        (product-released product10)

        (worker-at-station worker1 station1)
        (worker-at-station worker2 station2)
        (worker-at-station worker3 station3)


        (product-at-buffer product1 buffer0)
        (product-at-buffer product2 buffer0)
        (product-at-buffer product3 buffer0)
        (product-at-buffer product4 buffer0)
        (product-at-buffer product5 buffer0)
        (product-at-buffer product6 buffer0)
        (product-at-buffer product7 buffer0)
        (product-at-buffer product8 buffer0)
        (product-at-buffer product9 buffer0)
        (product-at-buffer product10 buffer0)

        (buffer-unused buffer1)
        (buffer-unused buffer2)
        (buffer-unused buffer3)
        (buffer-unused buffer4)

        (station-unused station1)
        (station-unused station2)
        (station-unused station3)
        (station-unused station4)


        (station-not-processing station1)
        (station-not-processing station2)
        (station-not-processing station3)
        (station-not-processing station4)

        (buffer-before-station buffer0 station1)
        (buffer-before-station buffer1 station2)
        (buffer-before-station buffer2 station3)
        (buffer-before-station buffer3 station4)

        (buffer-after-station buffer1 station1)
        (buffer-after-station buffer2 station2)
        (buffer-after-station buffer3 station3)
        (buffer-after-station buffer4 station4)

        (automatic-process station1 variant1)
        (automatic-process station2 variant1)
        (automatic-process station3 variant1)

        (manual-process station4 variant1)

        (product-before helpproduct product1)
        (product-before product1 product2)
        (product-before product2 product3)
        (product-before product3 product4)
        (product-before product4 product5)
        (product-before product5 product6)
        (product-before product6 product7)
        (product-before product7 product8)
        (product-before product8 product9)
        (product-before product9 product10)


        (product-processed helpproduct station1)
        (product-processed helpproduct station2)
        (product-processed helpproduct station3)
        (product-processed helpproduct station4)

        (= (release-time-worker worker1) 0)
        (= (release-time-worker worker2) 0)
        (= (release-time-worker worker3) 0)

        (= (release-time-product product1) 0)
        (= (release-time-product product2) 0)
        (= (release-time-product product3) 0)
        (= (release-time-product product4) 0)
        (= (release-time-product product5) 0)
        (= (release-time-product product6) 0)
        (= (release-time-product product7) 0)
        (= (release-time-product product8) 0)
        (= (release-time-product product9) 0)
        (= (release-time-product product10) 0)

        (= (walk-time worker1 station1 station1) 0)
        (= (walk-time worker1 station1 station2) 10)
        (= (walk-time worker1 station1 station3) 20)
        (= (walk-time worker1 station1 station4) 30)
        (= (walk-time worker1 station2 station1) 10)
        (= (walk-time worker1 station2 station2) 0)
        (= (walk-time worker1 station2 station3) 10)
        (= (walk-time worker1 station2 station4) 20)
        (= (walk-time worker1 station3 station1) 20)
        (= (walk-time worker1 station3 station2) 10)
        (= (walk-time worker1 station3 station3) 0)
        (= (walk-time worker1 station3 station4) 10)
        (= (walk-time worker1 station4 station1) 30)
        (= (walk-time worker1 station4 station2) 20)
        (= (walk-time worker1 station4 station3) 10)
        (= (walk-time worker1 station4 station4) 0)
        (= (walk-time worker2 station1 station1) 0)
        (= (walk-time worker2 station1 station2) 10)
        (= (walk-time worker2 station1 station3) 20)
        (= (walk-time worker2 station1 station4) 30)
        (= (walk-time worker2 station2 station1) 10)
        (= (walk-time worker2 station2 station2) 0)
        (= (walk-time worker2 station2 station3) 10)
        (= (walk-time worker2 station2 station4) 20)
        (= (walk-time worker2 station3 station1) 20)
        (= (walk-time worker2 station3 station2) 10)
        (= (walk-time worker2 station3 station3) 0)
        (= (walk-time worker2 station3 station4) 10)
        (= (walk-time worker2 station4 station1) 30)
        (= (walk-time worker2 station4 station2) 20)
        (= (walk-time worker2 station4 station3) 10)
        (= (walk-time worker2 station4 station4) 0)
        (= (walk-time worker3 station1 station1) 0)
        (= (walk-time worker3 station1 station2) 10)
        (= (walk-time worker3 station1 station3) 20)
        (= (walk-time worker3 station1 station4) 30)
        (= (walk-time worker3 station2 station1) 10)
        (= (walk-time worker3 station2 station2) 0)
        (= (walk-time worker3 station2 station3) 10)
        (= (walk-time worker3 station2 station4) 20)
        (= (walk-time worker3 station3 station1) 20)
        (= (walk-time worker3 station3 station2) 10)
        (= (walk-time worker3 station3 station3) 0)
        (= (walk-time worker3 station3 station4) 10)
        (= (walk-time worker3 station4 station1) 30)
        (= (walk-time worker3 station4 station2) 20)
        (= (walk-time worker3 station4 station3) 10)
        (= (walk-time worker3 station4 station4) 0)

        (= (setup-time worker1 station1 variant1) 10)
        (= (setup-time worker1 station2 variant1) 10)
        (= (setup-time worker1 station3 variant1) 10)
        (= (setup-time worker2 station1 variant1) 10)
        (= (setup-time worker2 station2 variant1) 10)
        (= (setup-time worker2 station3 variant1) 10)
        (= (setup-time worker3 station1 variant1) 10)
        (= (setup-time worker3 station2 variant1) 10)
        (= (setup-time worker3 station3 variant1) 10)

        (= (automatic-work-time worker1 station1 variant1) 80)
        (= (automatic-work-time worker1 station2 variant1) 80)
        (= (automatic-work-time worker1 station3 variant1) 80)
        (= (automatic-work-time worker2 station1 variant1) 80)
        (= (automatic-work-time worker2 station2 variant1) 80)
        (= (automatic-work-time worker2 station3 variant1) 80)
        (= (automatic-work-time worker3 station1 variant1) 80)
        (= (automatic-work-time worker3 station2 variant1) 80)
        (= (automatic-work-time worker3 station3 variant1) 80)

        (= (takedown-time worker1 station1 variant1) 10)
        (= (takedown-time worker1 station2 variant1) 10)
        (= (takedown-time worker1 station3 variant1) 10)
        (= (takedown-time worker2 station1 variant1) 10)
        (= (takedown-time worker2 station2 variant1) 10)
        (= (takedown-time worker2 station3 variant1) 10)
        (= (takedown-time worker3 station1 variant1) 10)
        (= (takedown-time worker3 station2 variant1) 10)
        (= (takedown-time worker3 station3 variant1) 10)

        (= (manual-work-time worker1 station4 variant1) 100)
        (= (manual-work-time worker2 station4 variant1) 100)
        (= (manual-work-time worker3 station4 variant1) 100)
    )

    (:goal
        (and
        (product-at-buffer product1 buffer4)
        (product-at-buffer product2 buffer4)
        (product-at-buffer product3 buffer4)
        (product-at-buffer product4 buffer4)
        (product-at-buffer product5 buffer4)
        (product-at-buffer product6 buffer4)
        (product-at-buffer product7 buffer4)
        (product-at-buffer product8 buffer4)
        (product-at-buffer product9 buffer4)
        (product-at-buffer product10 buffer4)
        )
    )

    (:metric minimize (total-time))
)
