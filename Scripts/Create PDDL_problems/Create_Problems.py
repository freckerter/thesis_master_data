from Used_Model_Files.XML_Reader import XML_Reader
from Used_Model_Files.XML_Writer import XML_Writer

# define variables like prob number and number of things

def create_problemfile(config_path ,init_path , sol_path, problemname):
    problem = XML_Reader(config_path, init_path)

    production_time_matrix = problem.get_production_time_matrix()
    worker_movement_time_matrix = problem.get_worker_movement_matrix()
    automatic_worksteps_times_matrix = problem.get_automatic_times_matrix()
    #number_manual_worksteps = problem.get_number_worksteps() #Not needed
    releasetime_workers = problem.get_releasetime_workers()
    leftover_job_products = problem.get_leftover_jobs_products()
    worker_skill = problem.get_worker_skill()
    products_type = problem.get_products_type()
    products_initial = problem.get_products_initial()
    workers_initial_station = problem.get_worker_initial_stat()

    num_worker = problem.get_num_workers()
    num_stations = problem.get_num_stations()
    num_buffer = problem.get_num_stations()
    num_product = problem.get_num_products()
    num_variant = problem.get_num_variants()






    with open(f"./{problemname}.pddl", "w") as problemfile:
        problemfile.write(f"(define (problem {problemname})\n")
        problemfile.write(f"    (:domain flow-shop)\n")
        problemfile.write(f"    (:objects\n")


        #Adding all workers to the file
        workerstring = ""
        for i in range(num_worker):
            workerstring += f"worker{i+1} "
        workerstring += "- worker"
        problemfile.write(f"        {workerstring}\n")

        #adding all stations to the file
        stationstring = ""
        for i in range(num_stations):
            stationstring += f"station{i + 1} "
        stationstring += "- station"
        problemfile.write(f"        {stationstring}\n")

        # adding all buffer to the file. +1, as we also have buffer0
        bufferstring = ""
        for i in range(num_buffer+1):
            bufferstring += f"buffer{i} "
        bufferstring += "- buffer"
        problemfile.write(f"        {bufferstring}\n")

        # adding all products to the file. Add helpproduct at the start
        productstring = "helpproduct "
        for i in range(num_product):
            productstring += f"product{i + 1} "
        productstring += "- product"
        problemfile.write(f"        {productstring}\n")

        # adding all variants to the file
        variantstring = ""
        for i in range(num_variant):
            variantstring += f"variant{i + 1} "
        variantstring += "- variant"
        problemfile.write(f"        {variantstring}\n")

        problemfile.write(f"    )\n")
        problemfile.write(f"\n")
        problemfile.write(f"    (:init\n")

        #Add all initial predicates here

        #Add "product-of-variant"
        for prod_num in range(num_product):
            problemfile.write(f"        (product-of-variant product{prod_num+1} variant{products_type[prod_num]+1})\n")
        problemfile.write(f"\n")

        #Add "end-buffer" only for last buffer
        problemfile.write(f"        (end-buffer buffer{num_buffer})\n")
        problemfile.write(f"\n")

        #Add "worker-released"
        for work_num in range(num_worker):
            if(releasetime_workers[work_num] == 0):
                problemfile.write(f"        (worker-released worker{work_num+1})\n")
        problemfile.write(f"\n")

        #Add "product-released".
        for prod_num in range(num_product):
            if leftover_job_products[0][prod_num] <= 0:
                problemfile.write(f"        (product-released product{prod_num + 1})\n")
        problemfile.write(f"\n")

        # Add "worker-at-station"
        for work_num in range(num_worker):
            problemfile.write(f"        (worker-at-station worker{work_num+1} station{workers_initial_station[work_num]+1})\n")
        problemfile.write(f"\n")

        # make a list of each station, if a product is at a station, remove the station (used later on)
        unused_stations = [f"station{i+1}" for i in range(num_stations)]

        # Add "product at station"
        for prod_num in range(num_product):
            if (products_initial[1][prod_num] != 1 or leftover_job_products[0][prod_num] > 0):
                problemfile.write(f"        (product-at-station product{prod_num+1} station{products_initial[0][prod_num]+1})\n")
                if f"station{products_initial[0][prod_num]+1}" in unused_stations:
                    unused_stations.remove(f"station{products_initial[0][prod_num]+1}")
        problemfile.write(f"\n")

        # Make a list of all buffers, if a product is at such a buffer, remove the bufffer(used later on)
        unused_buffer = [f"buffer{i + 1}" for i in range(num_buffer)]
        unused_buffer = ["buffer0"] + unused_buffer

        # Add "product at buffer"
        for prod_num in range(num_product):
            if (products_initial[1][prod_num] == 1 and leftover_job_products[0][prod_num] <= 0):
                problemfile.write(f"        (product-at-buffer product{prod_num + 1} buffer{products_initial[0][prod_num]})\n")
                if f"buffer{products_initial[0][prod_num]}" in unused_buffer:
                    unused_buffer.remove(f"buffer{products_initial[0][prod_num]}")
        problemfile.write(f"\n")

        # Add "buffer-unused"
        for buffer in unused_buffer:
            problemfile.write(f"        (buffer-unused {buffer})\n")
        problemfile.write(f"\n")

        # Add "station-unused" 
        for station in unused_stations:
            problemfile.write(f"        (station-unused {station})\n")
        problemfile.write(f"\n")

        # make a list where each entry represents a station. 0 = not processing, 1 = processing
        # only processing, if automatic and next workstep is 2 (the actual work)
        processing_stations = [0] * num_stations
        for prod_num in range(num_product):
            if products_initial[1][prod_num] == 2:
                processing_stations[prod_num] == 1

        # Add "station processing" (currently during working step)
        for i, is_processing in enumerate(processing_stations):
            if is_processing == 1:
                problemfile.write(f"        (station-processing station{i+1})\n")
        problemfile.write(f"\n")

        # Add "station-not-processing"
        for i, is_processing in enumerate(processing_stations):
            if is_processing == 0:
                problemfile.write(f"        (station-not-processing station{i+1})\n")
        problemfile.write(f"\n")


        # Add "buffer-before-station":
        for i in range(num_stations):
            problemfile.write(f"        (buffer-before-station buffer{i} station{i+1})\n")
        problemfile.write(f"\n")

        # Add "buffer-after-station"
        for i in range(num_stations):
            problemfile.write(f"        (buffer-after-station buffer{i+1} station{i+1})\n")
        problemfile.write(f"\n")


        #if automatic: automatic_workstep_time_matrix is non 0, else it is 0
        # Add "automatic-process"
        for variant_num in range(num_variant):
            for station_num in range(num_stations):
                if (automatic_worksteps_times_matrix[variant_num][station_num] > 0):
                    problemfile.write(f"        (automatic-process station{station_num+1} variant{variant_num+1})\n")
        problemfile.write(f"\n")

        # Add "manual-process"
        for variant_num in range(num_variant):
            for station_num in range(num_stations):
                if (automatic_worksteps_times_matrix[variant_num][station_num] == 0):
                    problemfile.write(f"        (manual-process station{station_num+1} variant{variant_num+1})\n")
        problemfile.write(f"\n")

        # Add "product-before" Special for helpproduct, assuming there is always at least one product
        problemfile.write(f"        (product-before helpproduct product1)\n")
        for prod_num in range(num_product-1):
            problemfile.write(f"        (product-before product{prod_num+1} product{prod_num+2})\n")
        problemfile.write(f"\n")

        # Add "product-processed". Special for helpproduct
        problemfile.write(f"\n")
        for station_num in range(num_stations):
            problemfile.write(f"        (product-processed helpproduct station{station_num+1})\n")

        for prod_num in range(num_product):
            next_station = products_initial[0][prod_num]+1
            for processed_station in range(next_station-1):
                problemfile.write(f"        (product-processed product{prod_num+1} station{processed_station+1})\n")
        problemfile.write(f"\n")


        # Add "release-time-worker"
        for worker_num in range(num_worker):
            problemfile.write(f"        (= (release-time-worker worker{worker_num+1}) {releasetime_workers[worker_num]})\n")
        problemfile.write(f"\n")

        # Add "release-time-product"
        for product_num in range(num_product):
            problemfile.write(f"        (= (release-time-product product{product_num+1}) {leftover_job_products[0][product_num]})\n")
        problemfile.write(f"\n")

        # Add "walk-time"
        for worker_num in range(num_worker):
            for station_from in range(num_stations):
                for station_to in range(num_stations):
                    walk_time = worker_movement_time_matrix[station_from][station_to]
                    problemfile.write(f"        (= (walk-time worker{worker_num+1} station{station_from+1} station{station_to+1}) {walk_time})\n")
        problemfile.write(f"\n")


        # Add "setup-time"
        for worker_num in range(num_worker):
            for station_num in range(num_stations):
                for variant_num in range(num_variant):
                    if (automatic_worksteps_times_matrix[variant_num][station_num] > 0):
                        skill_level = worker_skill[worker_num]
                        setup_time = int(production_time_matrix[variant_num][station_num][0] * (100 / skill_level))
                        problemfile.write(f"        (= (setup-time worker{worker_num+1} station{station_num+1} variant{variant_num+1}) {setup_time})\n")
        problemfile.write(f"\n")

        # Add "automatic-work-time"
        for worker_num in range(num_worker):
            for station_num in range(num_stations):
                for variant_num in range(num_variant):
                    if (automatic_worksteps_times_matrix[variant_num][station_num] > 0):
                        skill_level = worker_skill[worker_num]
                        autowork_time = int(automatic_worksteps_times_matrix[variant_num][station_num] * (100 / skill_level))
                        problemfile.write(f"        (= (automatic-work-time worker{worker_num+1} station{station_num+1} variant{variant_num+1}) {autowork_time})\n")
        problemfile.write(f"\n")

        # Add "takedown-time"
        for worker_num in range(num_worker):
            for station_num in range(num_stations):
                for variant_num in range(num_variant):
                    if (automatic_worksteps_times_matrix[variant_num][station_num] > 0):
                        skill_level = worker_skill[worker_num]
                        takedown_time = int(production_time_matrix[variant_num][station_num][1] * (100 / skill_level))
                        problemfile.write(f"        (= (takedown-time worker{worker_num+1} station{station_num+1} variant{variant_num+1}) {takedown_time})\n")
        problemfile.write(f"\n")

        # Add "manual-work-time"
        for worker_num in range(num_worker):
            for station_num in range(num_stations):
                for variant_num in range(num_variant):
                    if (automatic_worksteps_times_matrix[variant_num][station_num] == 0):
                        skill_level = worker_skill[worker_num]
                        manwork_time = int(production_time_matrix[variant_num][station_num][0] * (100 / skill_level))
                        problemfile.write(f"        (= (manual-work-time worker{worker_num+1} station{station_num+1} variant{variant_num+1}) {manwork_time})\n")

        # Add the goal, so every product is at the last buffer.
        problemfile.write(f"    )\n")
        problemfile.write(f"\n")
        problemfile.write(f"    (:goal\n")
        problemfile.write(f"        (and\n")

        for prod_num in range(num_product):
            problemfile.write(f"        (product-at-buffer product{prod_num+1} buffer{num_buffer})\n")


        #Add rest
        problemfile.write(f"        )\n")
        problemfile.write(f"    )\n")
        problemfile.write(f"\n")
        problemfile.write(f"    (:metric minimize (total-time))\n")
        problemfile.write(f")\n")

        #Done

#Change as needed
configname = "S20-Ex5.xml"
initialname = "W20-Ex15.xml"
problemname = configname.split(".")[0] + "_" + initialname.split(".")[0]

create_problemfile(config_path=f"./Used_Model_Files/XML_configurations/XML_configurations/{configname}",init_path=f"./Used_Model_Files/XML_initials/XML_initials/{initialname}", sol_path="./mysolution.txt", problemname = problemname)

