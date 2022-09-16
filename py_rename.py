'''
from os import rename, listdir
'''

import os

dirDB = "C:/Users/ndominguez/Dropbox/Databases/UDEL/"

dir_p_x_14 = dirDB + "2014/Terrestrial-Precipitation/Monthly-Series/TXT"
dir_t_x_14 = dirDB + "2014/Terrestrial-Air-Temperature/Monthly-Series/TXT"
dir_p_c_14 = dirDB + "2014/Terrestrial-Precipitation/Cross-Validation-of-Monthly-Series/TXT"
dir_t_c_14 = dirDB + "2014/Terrestrial-Air-Temperature/Cross-Validation-of-Monthly-Series/TXT"

dir_p_x_17 = dirDB + "2017/Terrestrial-Precipitation/Monthly-Series/TXT"
dir_t_x_17 = dirDB + "2017/Terrestrial-Air-Temperature/Monthly-Series/TXT"
dir_p_c_17 = dirDB + "2017/Terrestrial-Precipitation/Cross-Validation-of-Monthly-Series/TXT"
dir_t_c_17 = dirDB + "2017/Terrestrial-Air-Temperature/Cross-Validation-of-Monthly-Series/TXT"

'''
#1900-2014
for num in list(range(1900,2014)):
    print(num)
    print("Monthly-Series")
    print("precip")
    old_p_x_14 = dir_p_x_14 + os.path.sep + "precip." + str(num)
    new_p_x_14 = dir_p_x_14 + os.path.sep + "precip_" + str(num) + ".txt"
    os.rename(old_p_x_14, new_p_x_14)
    print("air-temp")
    old_t_x_14 = dir_t_x_14 + os.path.sep + "air_temp." + str(num)
    new_t_x_14 = dir_t_x_14 + os.path.sep + "air_temp_" + str(num) + ".txt"
    os.rename(old_t_x_14, new_t_x_14)
    print("Cross-Validation-of-Monthly-Series")
    print("precip")
    old_p_c_14 = dir_p_c_14 + os.path.sep + "precip_cv." + str(num)
    new_p_c_14 = dir_p_c_14 + os.path.sep + "precip_cv_" + str(num) +".txt"
    os.rename(old_p_c_14, new_p_c_14)
    print("air-temp")
    old_t_c_14 = dir_t_c_14 + os.path.sep + "air_temp_cv." + str(num)
    new_t_c_14 = dir_t_c_14 + os.path.sep + "air_temp_cv_" + str(num) +".txt"
    os.rename(old_t_c_14, new_t_c_14)
'''

#1900-2017
for num in list(range(1900,2018)):
    print(num)
    print("Monthly-Series")
    print("precip")
    old_p_x_17 = dir_p_x_17 + os.path.sep + "precip." + str(num)
    new_p_x_17 = dir_p_x_17 + os.path.sep + "precip_" + str(num) + ".txt"
    os.rename(old_p_x_17, new_p_x_17)
    print("air-temp")
    old_t_x_17 = dir_t_x_17 + os.path.sep + "air_temp." + str(num)
    new_t_x_17 = dir_t_x_17 + os.path.sep + "air_temp_" + str(num) + ".txt"
    os.rename(old_t_x_17, new_t_x_17)
    print("Cross-Validation-of-Monthly-Series")
    print("precip")
    old_p_c_17 = dir_p_c_17 + os.path.sep + "precip_cv." + str(num)
    new_p_c_17 = dir_p_c_17 + os.path.sep + "precip_cv_" + str(num) +".txt"
    os.rename(old_p_c_17, new_p_c_17)
    print("air-temp")
    old_t_c_17 = dir_t_c_17 + os.path.sep + "air_temp_cv." + str(num)
    new_t_c_17 = dir_t_c_17 + os.path.sep + "air_temp_cv_" + str(num) +".txt"
    os.rename(old_t_c_17, new_t_c_17)
