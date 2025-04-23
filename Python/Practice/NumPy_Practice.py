import numpy as np

n_arr = np.array([[10.5, 22.5, 3.8],[41, np.nan, np.nan]])
cleaned_arr = n_arr[~np.isnan(n_arr).any(axis=1)]
print(cleaned_arr)

# in_arr = np.arange(12).reshape(2, 3, 2) 

# print ("Input array : ", in_arr)  
# out_arr = np.squeeze(in_arr, axis = 0) 

# print ("output array : ", out_arr)  
# print("The shapes of Input and Output array : ") 
# print(in_arr.shape, out_arr.shape)