import matplotlib.pyplot as plt

Problemnames = ["S5-Ex29_W1-Ex1", "S5-Ex29_W2-Ex2", "S5-Ex29_W3-Ex2", "S5-Ex29_W4-Ex3",
                "S5-Ex29_W5-Ex3"]  # Names of the Problems, maybe change to describe it

Problemnames = [1, 2, 3, 4, 5]

"""
# Small Worker change makespan
CPlex = [2860, 1320, 1030, 940, 900]  # Cplex
GoogleOR = [2860, 1320, 1030, 940, 900]  # GoogleOR
CP4TP = [2860.012, 2180.0072, 1580.0048, 1760.004, 1300.0028]  # CP4TP
TFD = [2860.58, 2120.62, 2520.74, 2030.73, 900.188]  # TFD
popf = [2580.003]  # popf
"""

"""
# Small Worker change time
CPlex = [46.21, 300.01, 300.01, 300.01, 0.09]  # Cplex
GoogleOR = [2.0455, 6.9292, 0.9184, 0.8317, 0.3349]  # GoogleOR
CP4TP = [0.012, 0.012, 0.008, 0.008, 0.004]  # CP4TP
TFD = [0.04, 1.64, 3.97, 0.4, 0.03]  # TFD
popf = [0.89]  # popf
"""

"""
# Bigger Worker change makespan
CPlex = [13510, 6420, 4220, 3300]  # Cplex
GoogleOR = [13510, 6910, 4720, 3650, 2980, 1900]  # GoogleOR
CP4TP = [8660.036, 16230.0452, 14340.0326, 9580.0244, 7140.0166, 2800.0058]  # CP4TP
TFD = []  # TFD
popf = [14650.003]  # popf
"""

"""
# Bigger Worker change time
CPlex = [300.15, 300.07, 300.04, 300.06]  # Cplex
GoogleOR = [1000.3, 999.046, 1000.4617, 1001.3445, 1000.4745, 41.0978]  # GoogleOR
CP4TP = [0.3511, 0.4000886, 0.31888, 0.370885, 0.21866, 0.135342]  # CP4TP
TFD = []  # TFD
popf = [44.64]  # popf
"""

"""
# Small Station change makespan
CPlex = [500, 1090, 1680, 2270, 2860, 4350, 5120, 5650 ]  # Cplex
GoogleOR = [500, 1090, 1680, 2270, 2860, 4350, 5120, 5650]  # GoogleOR
CP4TP = [500.0008, 1090.0036, 1680.0078, 2270.01, 2860.012, 4230.0182, 5100.0202, 5650.0222, 6400.0242, 8670.029]  # CP4TP
TFD = [500.041, 1090, 1680, 2270, 2860.58, 4630.92, 5461.06, 6311.17, 6641.25, 8331.5 ]  # TFD
popf = [500.004, 1090, 1360.006, 1970.003, 2580.003, 4630.03, 5700.031, 6290.032, 7060.033, 7590.043]  # popf
"""

"""
# Small Station change searchtime
CPlex = [0.01, 0.03, 0.51, 2.29, 42.63, 300.06, 300.14, 300.09]  # Cplex
GoogleOR = [0.0143, 0.0168, 0.0376, 0.0723, 2.1635, 56.6958, 1000.0859, 531.3118]  # GoogleOR
CP4TP = [0.004, 0.00194, 0.00399, 0.00399, 0.012, 0.02, 0.0359, 0.0679, 0.06799, 0.096]  # CP4TP
TFD = [0.00073, 0.0082, 0.0075, 0.0245, 0.04897, 0.1973, 0.3479, 0.4853, 0.64471, 0.7493]  # TFD
popf = [0.11, 0.15, 0.3, 0.51, 0.91, 1.06, 1.46, 1.82, 2.44, 3.72]  # popf
"""

"""
# Bigger Station change makespan
CPlex = [1200, 1330, 1450]  # Cplex
GoogleOR = [1200, 1330, 1450, 4540, 7519]  # GoogleOR
CP4TP = [1200.007, 2290.0136, 2810.015, 10320.0318, 17333.0548]  # CP4TP
TFD = [2320.74, 4021.21]  # TFD
popf = [1310.035, 1670.035, 2290]  # popf
"""

"""
# Bigger Station change time
CPlex = [0.13, 300.1, 300.06]  # Cplex
GoogleOR = [0.8086, 2.4872, 7.7146, 1002.4188, 1002.1777]  # GoogleOR
CP4TP = [0.0287, 0.0555, 0.113564, 0.9691, 6.939]  # CP4TP
TFD = [1.15, 6.88]  # TFD
popf = [2.96, 7.09, 125.96]  # popf
"""

"""
# Small Product change makespan
CPlex = [540, 1120, 1700, 2280, 2860, 3440, 4020, 4600, 5180, 5760, 6340, 6920, 7500, 8080, 8660]  # Cplex
GoogleOR = [540, 1120, 1700, 2280, 2860, 3440, 4020, 4600, 5180, 5760, 6340, 6920, 7500, 8080, 8660]  # GoogleOR
CP4TP = [540.002, 1120.0048, 1700.0072, 2280.0096, 2880.012, 3440.0144, 3920.0168, 4600.0192, 5180.0216, 5760.024,
         6340.0264, 6920.0288, 7500.0312, 8080.0336, 8660.036]  # CP4TP
TFD = [540.102, 1120.22, 1700, 2280.46, 2860.58, 3440.7, 4040.83, 4600.94, 5181.06, 5381.27, 5921.4, 6501.48, 7141.63,
       7801.75, 8401.87]  # TFD
popf = [660.005, 1080.003, 1580.003, 2080.003, 2580.003, 3080.003, 3580.003, 4080.003, 4580.003, 5080.003, 5580.003,
        6080.003, 6580.003, 7080.003, 7580.003]  # popf
"""

"""
# Small Product change searchtime
#CPlex = [0.09, 1.68, 2.68, 6.52, 106.75, 300.5, 300.02, 300.02, 300.08, 300.08, 300.06, 300.07, 300.09, 300.04, 300.06]  # Cplex
#GoogleOR = [0.01, 0.018, 0.0012, 0.2705, 10.3643, 39.0863, 14.6224, 32.4881, 41.2264, 65.1023, 77.8673, 253.3134, 90.6608, 90.3739, 120.7731]  # GoogleOR
CP4TP = [0, 0.004, 0.004,0.00799, 0.01199, 0.012, 0.01199, 0.01999, 0.0279, 0.03199, 0.04399, 0.052, 0.06798, 0.0719, 0.08399]  # CP4TP
TFD = [0.00863, 0.0220411, 0.03, 0.033, 0.0539, 0.54913, 0.0963931, 0.136355, 0.195998, 0.653293, 0.984936, 1.64686, 3.87247, 7.87123, 11.8345]  # TFD
popf = [0.13, 0.24, 0.38, 0.6, 0.9, 1.19, 1.64, 2.25, 2.92, 3.58, 4.55, 5.6, 6.97, 8.03, 9.41]  # popf
"""

"""
# Bigger Product change makespan
CPlex = [1000, 1100, 1410, 1770]  # Cplex
GoogleOR = [1000, 1100, 1410, 1770, 2200, 2730, 3180, 3600, 4070, 4650]  # GoogleOR
CP4TP = [1260.0028, 2680.0068, 4170.0094, 3100.0098, 5200.0124, 6420.016, 7270.0188, 8320.0206, 9410.0228, 13340.0326]  # CP4TP
TFD = []  # TFD
popf = [1000.011, 1250.008, 1510.007, 2530.008]  # popf
"""

"""
# Bigger Product change searchtime
CPlex = [0.04, 0.06, 300.06, 300.04]  # Cplex
GoogleOR = [0.1584, 0.5315, 19.7255, 1001.2908, 1001.0992, 1000.5309, 1001.2676, 1001.2219, 1000.7189, 1002.1019]  # GoogleOR
CP4TP = [0.006699, 0.0142255, 0.0262697, 0.0452973, 0.06824, 0.0662, 0.092, 0.1584, 0.203471, 0.311747]  # CP4TP
TFD = []  # TFD
popf = [0.22, 9.46, 16.61, 21.81]  # popf
"""

"""
# Big problems makespan
CPlex = []  # Cplex
GoogleOR = [7107, 9234, 8314]  # GoogleOR
CP4TP = [13151.01, 24055.0332, 21256.0756, 39435.0344, 12535.0098]  # CP4TP
TFD = []  # TFD
popf = []  # popf
"""


#Big problems searchtime
CPlex = []  # Cplex
GoogleOR = [1010.4836, 1004.744, 1007.6657]  # GoogleOR
CP4TP = [0.4293, 2.38557, 36.5136, 28.8961, 2.5373]  # CP4TP
TFD = []  # TFD
popf = []  # popf


# If not all there, just use part of Problemnames

# Plot dots
#plt.plot(Problemnames[0:4], CPlex, 'bo', color='red')
plt.plot(Problemnames[0:3], GoogleOR, 'bo', color='blue')
plt.plot(Problemnames[0:5], CP4TP, 'bo', color='green')
#plt.plot(Problemnames[0:2], TFD, 'bo', color='black')
#plt.plot(Problemnames[0:4], popf, 'bo', color='brown')

# Plot lines
#plt.plot(Problemnames[0:4], CPlex, color='red')
plt.plot(Problemnames[0:3], GoogleOR, color='blue')
plt.plot(Problemnames[0:5], CP4TP, color='green')
#plt.plot(Problemnames[0:2], TFD, color='black')
#plt.plot(Problemnames[0:4], popf, color='brown')

plt.xlabel('Problemnumber')

#plt.ylabel('Makespan')
plt.ylabel('Searchtime in seconds')

# plt.legend(['CPlex', 'Google OR-Tools', 'CP4TP', 'TFD', 'POPF'])
plt.legend(['Google OR-Tools', 'CP4TP'])  # Copy from above, delete what not in plot

plt.title('Searchtime of large problems')

plt.grid()

plt.savefig("./Big_searchtime.png")

plt.show()
