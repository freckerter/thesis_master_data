(define (problem S5-Ex29_W1-Ex11_2)
    (:domain flow-shop)
    (:objects
        worker1 - worker
        station1 station2 station3 station4 station5 - station
        buffer0 buffer1 buffer2 buffer3 buffer4 buffer5 - buffer
        helpproduct product1 product2 - product
        variant1 - variant
    )

    (:init
        (product-of-variant product1 variant1)
        (product-of-variant product2 variant1)

        (end-buffer buffer5)

        (worker-released worker1)

        (product-released product1)
        (product-released product2)

        (worker-at-station worker1 station1)


        (product-at-buffer product1 buffer0)
        (product-at-buffer product2 buffer0)

        (buffer-unused buffer1)
        (buffer-unused buffer2)
        (buffer-unused buffer3)
        (buffer-unused buffer4)
        (buffer-unused buffer5)

        (station-unused station1)
        (station-unused station2)
        (station-unused station3)
        (station-unused station4)
        (station-unused station5)


        (station-not-processing station1)
        (station-not-processing station2)
        (station-not-processing station3)
        (station-not-processing station4)
        (station-not-processing station5)

        (buffer-before-station buffer0 station1)
        (buffer-before-station buffer1 station2)
        (buffer-before-station buffer2 station3)
        (buffer-before-station buffer3 station4)
        (buffer-before-station buffer4 station5)

        (buffer-after-station buffer1 station1)
        (buffer-after-station buffer2 station2)
        (buffer-after-station buffer3 station3)
        (buffer-after-station buffer4 station4)
        (buffer-after-station buffer5 station5)

        (automatic-process station3 variant1)

        (manual-process station1 variant1)
        (manual-process station2 variant1)
        (manual-process station4 variant1)
        (manual-process station5 variant1)

        (product-before helpproduct product1)
        (product-before product1 product2)


        (product-processed helpproduct station1)
        (product-processed helpproduct station2)
        (product-processed helpproduct station3)
        (product-processed helpproduct station4)
        (product-processed helpproduct station5)

        (= (release-time-worker worker1) 0)

        (= (release-time-product product1) 0)
        (= (release-time-product product2) 0)

        (= (walk-time worker1 station1 station1) 0)
        (= (walk-time worker1 station1 station2) 10)
        (= (walk-time worker1 station1 station3) 20)
        (= (walk-time worker1 station1 station4) 30)
        (= (walk-time worker1 station1 station5) 40)
        (= (walk-time worker1 station2 station1) 10)
        (= (walk-time worker1 station2 station2) 0)
        (= (walk-time worker1 station2 station3) 10)
        (= (walk-time worker1 station2 station4) 20)
        (= (walk-time worker1 station2 station5) 30)
        (= (walk-time worker1 station3 station1) 20)
        (= (walk-time worker1 station3 station2) 10)
        (= (walk-time worker1 station3 station3) 0)
        (= (walk-time worker1 station3 station4) 10)
        (= (walk-time worker1 station3 station5) 20)
        (= (walk-time worker1 station4 station1) 30)
        (= (walk-time worker1 station4 station2) 20)
        (= (walk-time worker1 station4 station3) 10)
        (= (walk-time worker1 station4 station4) 0)
        (= (walk-time worker1 station4 station5) 10)
        (= (walk-time worker1 station5 station1) 40)
        (= (walk-time worker1 station5 station2) 30)
        (= (walk-time worker1 station5 station3) 20)
        (= (walk-time worker1 station5 station4) 10)
        (= (walk-time worker1 station5 station5) 0)

        (= (setup-time worker1 station3 variant1) 10)

        (= (automatic-work-time worker1 station3 variant1) 80)

        (= (takedown-time worker1 station3 variant1) 10)

        (= (manual-work-time worker1 station1 variant1) 100)
        (= (manual-work-time worker1 station2 variant1) 100)
        (= (manual-work-time worker1 station4 variant1) 100)
        (= (manual-work-time worker1 station5 variant1) 100)
    )

    (:goal
        (and
        (product-at-buffer product1 buffer5)
        (product-at-buffer product2 buffer5)
        )
    )

    (:metric minimize (total-time))
)
