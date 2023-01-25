(define (problem S10-Ex17_W2-Ex7)
    (:domain flow-shop)
    (:objects
        worker1 worker2 - worker
        station1 station2 station3 station4 station5 station6 station7 station8 station9 station10 - station
        buffer0 buffer1 buffer2 buffer3 buffer4 buffer5 buffer6 buffer7 buffer8 buffer9 buffer10 - buffer
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

        (end-buffer buffer10)

        (worker-released worker1)
        (worker-released worker2)

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
        (buffer-unused buffer5)
        (buffer-unused buffer6)
        (buffer-unused buffer7)
        (buffer-unused buffer8)
        (buffer-unused buffer9)
        (buffer-unused buffer10)

        (station-unused station1)
        (station-unused station2)
        (station-unused station3)
        (station-unused station4)
        (station-unused station5)
        (station-unused station6)
        (station-unused station7)
        (station-unused station8)
        (station-unused station9)
        (station-unused station10)


        (station-not-processing station1)
        (station-not-processing station2)
        (station-not-processing station3)
        (station-not-processing station4)
        (station-not-processing station5)
        (station-not-processing station6)
        (station-not-processing station7)
        (station-not-processing station8)
        (station-not-processing station9)
        (station-not-processing station10)

        (buffer-before-station buffer0 station1)
        (buffer-before-station buffer1 station2)
        (buffer-before-station buffer2 station3)
        (buffer-before-station buffer3 station4)
        (buffer-before-station buffer4 station5)
        (buffer-before-station buffer5 station6)
        (buffer-before-station buffer6 station7)
        (buffer-before-station buffer7 station8)
        (buffer-before-station buffer8 station9)
        (buffer-before-station buffer9 station10)

        (buffer-after-station buffer1 station1)
        (buffer-after-station buffer2 station2)
        (buffer-after-station buffer3 station3)
        (buffer-after-station buffer4 station4)
        (buffer-after-station buffer5 station5)
        (buffer-after-station buffer6 station6)
        (buffer-after-station buffer7 station7)
        (buffer-after-station buffer8 station8)
        (buffer-after-station buffer9 station9)
        (buffer-after-station buffer10 station10)

        (automatic-process station5 variant1)

        (manual-process station1 variant1)
        (manual-process station2 variant1)
        (manual-process station3 variant1)
        (manual-process station4 variant1)
        (manual-process station6 variant1)
        (manual-process station7 variant1)
        (manual-process station8 variant1)
        (manual-process station9 variant1)
        (manual-process station10 variant1)

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
        (product-processed helpproduct station5)
        (product-processed helpproduct station6)
        (product-processed helpproduct station7)
        (product-processed helpproduct station8)
        (product-processed helpproduct station9)
        (product-processed helpproduct station10)

        (= (release-time-worker worker1) 0)
        (= (release-time-worker worker2) 0)

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
        (= (walk-time worker1 station1 station2) 30)
        (= (walk-time worker1 station1 station3) 60)
        (= (walk-time worker1 station1 station4) 90)
        (= (walk-time worker1 station1 station5) 120)
        (= (walk-time worker1 station1 station6) 150)
        (= (walk-time worker1 station1 station7) 180)
        (= (walk-time worker1 station1 station8) 150)
        (= (walk-time worker1 station1 station9) 120)
        (= (walk-time worker1 station1 station10) 90)
        (= (walk-time worker1 station2 station1) 30)
        (= (walk-time worker1 station2 station2) 0)
        (= (walk-time worker1 station2 station3) 30)
        (= (walk-time worker1 station2 station4) 60)
        (= (walk-time worker1 station2 station5) 90)
        (= (walk-time worker1 station2 station6) 120)
        (= (walk-time worker1 station2 station7) 150)
        (= (walk-time worker1 station2 station8) 120)
        (= (walk-time worker1 station2 station9) 90)
        (= (walk-time worker1 station2 station10) 120)
        (= (walk-time worker1 station3 station1) 60)
        (= (walk-time worker1 station3 station2) 30)
        (= (walk-time worker1 station3 station3) 0)
        (= (walk-time worker1 station3 station4) 30)
        (= (walk-time worker1 station3 station5) 60)
        (= (walk-time worker1 station3 station6) 90)
        (= (walk-time worker1 station3 station7) 120)
        (= (walk-time worker1 station3 station8) 90)
        (= (walk-time worker1 station3 station9) 120)
        (= (walk-time worker1 station3 station10) 150)
        (= (walk-time worker1 station4 station1) 90)
        (= (walk-time worker1 station4 station2) 60)
        (= (walk-time worker1 station4 station3) 30)
        (= (walk-time worker1 station4 station4) 0)
        (= (walk-time worker1 station4 station5) 30)
        (= (walk-time worker1 station4 station6) 60)
        (= (walk-time worker1 station4 station7) 90)
        (= (walk-time worker1 station4 station8) 120)
        (= (walk-time worker1 station4 station9) 150)
        (= (walk-time worker1 station4 station10) 180)
        (= (walk-time worker1 station5 station1) 120)
        (= (walk-time worker1 station5 station2) 90)
        (= (walk-time worker1 station5 station3) 60)
        (= (walk-time worker1 station5 station4) 30)
        (= (walk-time worker1 station5 station5) 0)
        (= (walk-time worker1 station5 station6) 30)
        (= (walk-time worker1 station5 station7) 60)
        (= (walk-time worker1 station5 station8) 90)
        (= (walk-time worker1 station5 station9) 120)
        (= (walk-time worker1 station5 station10) 150)
        (= (walk-time worker1 station6 station1) 150)
        (= (walk-time worker1 station6 station2) 120)
        (= (walk-time worker1 station6 station3) 90)
        (= (walk-time worker1 station6 station4) 60)
        (= (walk-time worker1 station6 station5) 30)
        (= (walk-time worker1 station6 station6) 0)
        (= (walk-time worker1 station6 station7) 30)
        (= (walk-time worker1 station6 station8) 60)
        (= (walk-time worker1 station6 station9) 90)
        (= (walk-time worker1 station6 station10) 120)
        (= (walk-time worker1 station7 station1) 180)
        (= (walk-time worker1 station7 station2) 150)
        (= (walk-time worker1 station7 station3) 120)
        (= (walk-time worker1 station7 station4) 90)
        (= (walk-time worker1 station7 station5) 60)
        (= (walk-time worker1 station7 station6) 30)
        (= (walk-time worker1 station7 station7) 0)
        (= (walk-time worker1 station7 station8) 30)
        (= (walk-time worker1 station7 station9) 60)
        (= (walk-time worker1 station7 station10) 90)
        (= (walk-time worker1 station8 station1) 150)
        (= (walk-time worker1 station8 station2) 120)
        (= (walk-time worker1 station8 station3) 90)
        (= (walk-time worker1 station8 station4) 120)
        (= (walk-time worker1 station8 station5) 90)
        (= (walk-time worker1 station8 station6) 60)
        (= (walk-time worker1 station8 station7) 30)
        (= (walk-time worker1 station8 station8) 0)
        (= (walk-time worker1 station8 station9) 30)
        (= (walk-time worker1 station8 station10) 60)
        (= (walk-time worker1 station9 station1) 120)
        (= (walk-time worker1 station9 station2) 90)
        (= (walk-time worker1 station9 station3) 120)
        (= (walk-time worker1 station9 station4) 150)
        (= (walk-time worker1 station9 station5) 120)
        (= (walk-time worker1 station9 station6) 90)
        (= (walk-time worker1 station9 station7) 60)
        (= (walk-time worker1 station9 station8) 30)
        (= (walk-time worker1 station9 station9) 0)
        (= (walk-time worker1 station9 station10) 30)
        (= (walk-time worker1 station10 station1) 90)
        (= (walk-time worker1 station10 station2) 120)
        (= (walk-time worker1 station10 station3) 150)
        (= (walk-time worker1 station10 station4) 180)
        (= (walk-time worker1 station10 station5) 150)
        (= (walk-time worker1 station10 station6) 120)
        (= (walk-time worker1 station10 station7) 90)
        (= (walk-time worker1 station10 station8) 60)
        (= (walk-time worker1 station10 station9) 30)
        (= (walk-time worker1 station10 station10) 0)
        (= (walk-time worker2 station1 station1) 0)
        (= (walk-time worker2 station1 station2) 30)
        (= (walk-time worker2 station1 station3) 60)
        (= (walk-time worker2 station1 station4) 90)
        (= (walk-time worker2 station1 station5) 120)
        (= (walk-time worker2 station1 station6) 150)
        (= (walk-time worker2 station1 station7) 180)
        (= (walk-time worker2 station1 station8) 150)
        (= (walk-time worker2 station1 station9) 120)
        (= (walk-time worker2 station1 station10) 90)
        (= (walk-time worker2 station2 station1) 30)
        (= (walk-time worker2 station2 station2) 0)
        (= (walk-time worker2 station2 station3) 30)
        (= (walk-time worker2 station2 station4) 60)
        (= (walk-time worker2 station2 station5) 90)
        (= (walk-time worker2 station2 station6) 120)
        (= (walk-time worker2 station2 station7) 150)
        (= (walk-time worker2 station2 station8) 120)
        (= (walk-time worker2 station2 station9) 90)
        (= (walk-time worker2 station2 station10) 120)
        (= (walk-time worker2 station3 station1) 60)
        (= (walk-time worker2 station3 station2) 30)
        (= (walk-time worker2 station3 station3) 0)
        (= (walk-time worker2 station3 station4) 30)
        (= (walk-time worker2 station3 station5) 60)
        (= (walk-time worker2 station3 station6) 90)
        (= (walk-time worker2 station3 station7) 120)
        (= (walk-time worker2 station3 station8) 90)
        (= (walk-time worker2 station3 station9) 120)
        (= (walk-time worker2 station3 station10) 150)
        (= (walk-time worker2 station4 station1) 90)
        (= (walk-time worker2 station4 station2) 60)
        (= (walk-time worker2 station4 station3) 30)
        (= (walk-time worker2 station4 station4) 0)
        (= (walk-time worker2 station4 station5) 30)
        (= (walk-time worker2 station4 station6) 60)
        (= (walk-time worker2 station4 station7) 90)
        (= (walk-time worker2 station4 station8) 120)
        (= (walk-time worker2 station4 station9) 150)
        (= (walk-time worker2 station4 station10) 180)
        (= (walk-time worker2 station5 station1) 120)
        (= (walk-time worker2 station5 station2) 90)
        (= (walk-time worker2 station5 station3) 60)
        (= (walk-time worker2 station5 station4) 30)
        (= (walk-time worker2 station5 station5) 0)
        (= (walk-time worker2 station5 station6) 30)
        (= (walk-time worker2 station5 station7) 60)
        (= (walk-time worker2 station5 station8) 90)
        (= (walk-time worker2 station5 station9) 120)
        (= (walk-time worker2 station5 station10) 150)
        (= (walk-time worker2 station6 station1) 150)
        (= (walk-time worker2 station6 station2) 120)
        (= (walk-time worker2 station6 station3) 90)
        (= (walk-time worker2 station6 station4) 60)
        (= (walk-time worker2 station6 station5) 30)
        (= (walk-time worker2 station6 station6) 0)
        (= (walk-time worker2 station6 station7) 30)
        (= (walk-time worker2 station6 station8) 60)
        (= (walk-time worker2 station6 station9) 90)
        (= (walk-time worker2 station6 station10) 120)
        (= (walk-time worker2 station7 station1) 180)
        (= (walk-time worker2 station7 station2) 150)
        (= (walk-time worker2 station7 station3) 120)
        (= (walk-time worker2 station7 station4) 90)
        (= (walk-time worker2 station7 station5) 60)
        (= (walk-time worker2 station7 station6) 30)
        (= (walk-time worker2 station7 station7) 0)
        (= (walk-time worker2 station7 station8) 30)
        (= (walk-time worker2 station7 station9) 60)
        (= (walk-time worker2 station7 station10) 90)
        (= (walk-time worker2 station8 station1) 150)
        (= (walk-time worker2 station8 station2) 120)
        (= (walk-time worker2 station8 station3) 90)
        (= (walk-time worker2 station8 station4) 120)
        (= (walk-time worker2 station8 station5) 90)
        (= (walk-time worker2 station8 station6) 60)
        (= (walk-time worker2 station8 station7) 30)
        (= (walk-time worker2 station8 station8) 0)
        (= (walk-time worker2 station8 station9) 30)
        (= (walk-time worker2 station8 station10) 60)
        (= (walk-time worker2 station9 station1) 120)
        (= (walk-time worker2 station9 station2) 90)
        (= (walk-time worker2 station9 station3) 120)
        (= (walk-time worker2 station9 station4) 150)
        (= (walk-time worker2 station9 station5) 120)
        (= (walk-time worker2 station9 station6) 90)
        (= (walk-time worker2 station9 station7) 60)
        (= (walk-time worker2 station9 station8) 30)
        (= (walk-time worker2 station9 station9) 0)
        (= (walk-time worker2 station9 station10) 30)
        (= (walk-time worker2 station10 station1) 90)
        (= (walk-time worker2 station10 station2) 120)
        (= (walk-time worker2 station10 station3) 150)
        (= (walk-time worker2 station10 station4) 180)
        (= (walk-time worker2 station10 station5) 150)
        (= (walk-time worker2 station10 station6) 120)
        (= (walk-time worker2 station10 station7) 90)
        (= (walk-time worker2 station10 station8) 60)
        (= (walk-time worker2 station10 station9) 30)
        (= (walk-time worker2 station10 station10) 0)

        (= (setup-time worker1 station5 variant1) 10)
        (= (setup-time worker2 station5 variant1) 10)

        (= (automatic-work-time worker1 station5 variant1) 80)
        (= (automatic-work-time worker2 station5 variant1) 80)

        (= (takedown-time worker1 station5 variant1) 10)
        (= (takedown-time worker2 station5 variant1) 10)

        (= (manual-work-time worker1 station1 variant1) 100)
        (= (manual-work-time worker1 station2 variant1) 100)
        (= (manual-work-time worker1 station3 variant1) 100)
        (= (manual-work-time worker1 station4 variant1) 100)
        (= (manual-work-time worker1 station6 variant1) 100)
        (= (manual-work-time worker1 station7 variant1) 100)
        (= (manual-work-time worker1 station8 variant1) 100)
        (= (manual-work-time worker1 station9 variant1) 100)
        (= (manual-work-time worker1 station10 variant1) 100)
        (= (manual-work-time worker2 station1 variant1) 100)
        (= (manual-work-time worker2 station2 variant1) 100)
        (= (manual-work-time worker2 station3 variant1) 100)
        (= (manual-work-time worker2 station4 variant1) 100)
        (= (manual-work-time worker2 station6 variant1) 100)
        (= (manual-work-time worker2 station7 variant1) 100)
        (= (manual-work-time worker2 station8 variant1) 100)
        (= (manual-work-time worker2 station9 variant1) 100)
        (= (manual-work-time worker2 station10 variant1) 100)
    )

    (:goal
        (and
        (product-at-buffer product1 buffer10)
        (product-at-buffer product2 buffer10)
        (product-at-buffer product3 buffer10)
        (product-at-buffer product4 buffer10)
        (product-at-buffer product5 buffer10)
        (product-at-buffer product6 buffer10)
        (product-at-buffer product7 buffer10)
        (product-at-buffer product8 buffer10)
        (product-at-buffer product9 buffer10)
        (product-at-buffer product10 buffer10)
        )
    )

    (:metric minimize (total-time))
)
