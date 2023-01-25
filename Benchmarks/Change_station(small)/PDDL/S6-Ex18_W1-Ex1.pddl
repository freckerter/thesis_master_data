(define (problem S6-Ex18_W1-Ex1)
    (:domain flow-shop)
    (:objects
        worker1 - worker
        station1 station2 station3 station4 station5 station6 - station
        buffer0 buffer1 buffer2 buffer3 buffer4 buffer5 buffer6 - buffer
        helpproduct product1 product2 product3 product4 product5 - product
        variant1 - variant
    )

    (:init
        (product-of-variant product1 variant1)
        (product-of-variant product2 variant1)
        (product-of-variant product3 variant1)
        (product-of-variant product4 variant1)
        (product-of-variant product5 variant1)

        (end-buffer buffer6)

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
        (buffer-unused buffer2)
        (buffer-unused buffer3)
        (buffer-unused buffer4)
        (buffer-unused buffer5)
        (buffer-unused buffer6)

        (station-unused station1)
        (station-unused station2)
        (station-unused station3)
        (station-unused station4)
        (station-unused station5)
        (station-unused station6)


        (station-not-processing station1)
        (station-not-processing station2)
        (station-not-processing station3)
        (station-not-processing station4)
        (station-not-processing station5)
        (station-not-processing station6)

        (buffer-before-station buffer0 station1)
        (buffer-before-station buffer1 station2)
        (buffer-before-station buffer2 station3)
        (buffer-before-station buffer3 station4)
        (buffer-before-station buffer4 station5)
        (buffer-before-station buffer5 station6)

        (buffer-after-station buffer1 station1)
        (buffer-after-station buffer2 station2)
        (buffer-after-station buffer3 station3)
        (buffer-after-station buffer4 station4)
        (buffer-after-station buffer5 station5)
        (buffer-after-station buffer6 station6)

        (automatic-process station1 variant1)
        (automatic-process station3 variant1)
        (automatic-process station5 variant1)

        (manual-process station2 variant1)
        (manual-process station4 variant1)
        (manual-process station6 variant1)

        (product-before helpproduct product1)
        (product-before product1 product2)
        (product-before product2 product3)
        (product-before product3 product4)
        (product-before product4 product5)


        (product-processed helpproduct station1)
        (product-processed helpproduct station2)
        (product-processed helpproduct station3)
        (product-processed helpproduct station4)
        (product-processed helpproduct station5)
        (product-processed helpproduct station6)

        (= (release-time-worker worker1) 0)

        (= (release-time-product product1) 0)
        (= (release-time-product product2) 0)
        (= (release-time-product product3) 0)
        (= (release-time-product product4) 0)
        (= (release-time-product product5) 0)

        (= (walk-time worker1 station1 station1) 0)
        (= (walk-time worker1 station1 station2) 30)
        (= (walk-time worker1 station1 station3) 60)
        (= (walk-time worker1 station1 station4) 90)
        (= (walk-time worker1 station1 station5) 120)
        (= (walk-time worker1 station1 station6) 150)
        (= (walk-time worker1 station2 station1) 30)
        (= (walk-time worker1 station2 station2) 0)
        (= (walk-time worker1 station2 station3) 30)
        (= (walk-time worker1 station2 station4) 60)
        (= (walk-time worker1 station2 station5) 90)
        (= (walk-time worker1 station2 station6) 120)
        (= (walk-time worker1 station3 station1) 60)
        (= (walk-time worker1 station3 station2) 30)
        (= (walk-time worker1 station3 station3) 0)
        (= (walk-time worker1 station3 station4) 30)
        (= (walk-time worker1 station3 station5) 60)
        (= (walk-time worker1 station3 station6) 90)
        (= (walk-time worker1 station4 station1) 90)
        (= (walk-time worker1 station4 station2) 60)
        (= (walk-time worker1 station4 station3) 30)
        (= (walk-time worker1 station4 station4) 0)
        (= (walk-time worker1 station4 station5) 30)
        (= (walk-time worker1 station4 station6) 60)
        (= (walk-time worker1 station5 station1) 120)
        (= (walk-time worker1 station5 station2) 90)
        (= (walk-time worker1 station5 station3) 60)
        (= (walk-time worker1 station5 station4) 30)
        (= (walk-time worker1 station5 station5) 0)
        (= (walk-time worker1 station5 station6) 30)
        (= (walk-time worker1 station6 station1) 150)
        (= (walk-time worker1 station6 station2) 120)
        (= (walk-time worker1 station6 station3) 90)
        (= (walk-time worker1 station6 station4) 60)
        (= (walk-time worker1 station6 station5) 30)
        (= (walk-time worker1 station6 station6) 0)

        (= (setup-time worker1 station1 variant1) 10)
        (= (setup-time worker1 station3 variant1) 10)
        (= (setup-time worker1 station5 variant1) 10)

        (= (automatic-work-time worker1 station1 variant1) 80)
        (= (automatic-work-time worker1 station3 variant1) 80)
        (= (automatic-work-time worker1 station5 variant1) 80)

        (= (takedown-time worker1 station1 variant1) 10)
        (= (takedown-time worker1 station3 variant1) 10)
        (= (takedown-time worker1 station5 variant1) 10)

        (= (manual-work-time worker1 station2 variant1) 100)
        (= (manual-work-time worker1 station4 variant1) 100)
        (= (manual-work-time worker1 station6 variant1) 100)
    )

    (:goal
        (and
        (product-at-buffer product1 buffer6)
        (product-at-buffer product2 buffer6)
        (product-at-buffer product3 buffer6)
        (product-at-buffer product4 buffer6)
        (product-at-buffer product5 buffer6)
        )
    )

    (:metric minimize (total-time))
)
