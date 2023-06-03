import numpy as np

def process_heatmap():
    delay_arr = np.arange(10, 110, 10)
    local_mat = np.zeros((10, 10))
    global_mat = np.zeros((10, 10))
    naive_mat = np.zeros((10, 10))

    print(delay_arr)

    # parse data files
    for i in delay_arr:
        for j in delay_arr:
            filename = 'data/mobility-core-{}-edge-{}.dat'.format(i, j)
            print("Processing file: {}".format(filename))
            with open(filename, 'r') as f:
                lines = f.readlines()
                idx, jdx = int(i/10 - 1), int(j/10 - 1)
                print(idx, jdx)
                for line in lines:
                    if line.startswith('local'):
                        local_mat[idx][jdx] = float(line.split()[1])
                    elif line.startswith('global'):
                        global_mat[idx][jdx] = float(line.split()[1])
                    elif line.startswith('naive'):
                        naive_mat[idx][jdx] = float(line.split()[1])
                    else:
                        pass
    
    # save data
    for filename, mat in zip(['local', 'global', 'naive'], [local_mat, global_mat, naive_mat]):
        with open('data/{}.mat'.format(filename), 'w') as f:
            # write first line
            f.write(',' + ','.join([str(i) for i in delay_arr]) + '\n')
            for i in range(10):
                f.write(str((i+1)*10))
                for j in range(10):
                    f.write(',{}'.format(mat[i][j]))
                f.write('\n')
    
    print("Done!")

if __name__ == '__main__':
    process_heatmap()
