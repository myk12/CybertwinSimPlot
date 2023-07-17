import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd

# subplot 3x2
#
#   x axis: access to edge delay                x axis: edge to core delay
#   y axis: intra-move time                     y axis: intra-move time
#   title : intra-move line chart               title : intra-move line chart
#           (1-1)                                       (1-2)
#
# 2. 2-1    2-2
#
#
#
# 3. 3-1    3-2
#
#
#

class MobilityPlot:
    def __init__(self) -> None:
        # data source
        self.intra_map = {}
        self.inter_map = {}
        self.naive_map = {}

    def plot_mobility_heatmap(self):
        # plot
        fig, axs = plt.subplots(1, 3, figsize=(50, 10), dpi=200)
        #plt.subplots_adjust(top=1,bottom=0,left=0,right=1,hspace=0,wspace=0)
        
        # 20, 40, 60, 80, 100ms
        index = [i for i in range(1,10,2)]
        re_index = index[::-1]
        annot_size = 25

        # plot 1 intra-move
        df_intra_half = self.intra_map.iloc[re_index, index]
        #print(df_intra_half)
        sns.heatmap(df_intra_half, ax=axs[0], linewidths=2, annot=True, annot_kws={"size": annot_size}, fmt=".2f", cmap="summer")

        # plot 2 inter-move
        df_inter_half = self.inter_map.iloc[re_index, index]
        #print(df_inter_half)
        sns.heatmap(df_inter_half, ax=axs[1], linewidths=2, annot=True, annot_kws={"size": annot_size}, fmt=".2f", cmap="YlGnBu")

        # plot 3 naive-move
        df_naive_half = self.naive_map.iloc[re_index, index]
        #print(df_naive_half)
        sns.heatmap(df_naive_half, ax=axs[2], linewidths=2, annot=True, annot_kws={"size": annot_size}, fmt=".2f", cmap="hot_r")

        # set title
        title_size = 30
        axs[0].set_title("a) intra-move delay", size = title_size)
        axs[1].set_title("b) inter-move delay", size = title_size)
        axs[2].set_title("c) naive-move delay", size = title_size)

        # set x, y label
        x_label = "end-to-end delay between access and edge"
        y_label = "end-to-end delay between edge and core"
        label_size = 25
        axs[0].set_xlabel(x_label, size = label_size)
        axs[0].set_ylabel(y_label, size = label_size)
        axs[1].set_xlabel(x_label, size = label_size)
        axs[1].set_ylabel(y_label, size = label_size)
        axs[2].set_xlabel(x_label, size = label_size)
        axs[2].set_ylabel(y_label, size = label_size)

        # set x, y tick labels
        x_ticklabes = ["{}ms".format(10*(i+1)) for i in index]
        y_ticklabes = ["{}ms".format(10*(i+1)) for i in re_index]
        tick_size = 20
        axs[0].set_xticklabels(x_ticklabes, size = tick_size)
        axs[0].set_yticklabels(y_ticklabes, size = tick_size)
        axs[1].set_xticklabels(x_ticklabes, size = tick_size)
        axs[1].set_yticklabels(y_ticklabes, size = tick_size)
        axs[2].set_xticklabels(x_ticklabes, size = tick_size)
        axs[2].set_yticklabels(y_ticklabes, size = tick_size)

        # save figure
        plt.savefig("mobility.pdf", bbox_inches='tight')


    def load_data_map(self):
        # read data from file
        delay_arr = [10*i for i in range(1,11)]
        intra_map = {}
        inter_map = {}
        naive_map = {}
        for core_delay in delay_arr:
            intra_edge_dict = {}
            inter_edge_dict = {}
            naive_edge_dict = {}
            for edge_delay in delay_arr:
                filename = "data/mobility-core-{}-edge-{}.dat".format(core_delay, edge_delay)
                with open(filename, 'r') as f:
                    lines = f.readlines()
                    # print(lines)
                    for line in lines:
                        if line.startswith("local"):
                            intra_move_delay = float(line.split()[1].strip())
                            intra_edge_dict[edge_delay] = intra_move_delay
                        elif line.startswith("global"):
                            inter_move_delay = float(line.split()[1].strip())
                            inter_edge_dict[edge_delay] = inter_move_delay
                        elif line.startswith("naive"):
                            naive_move_delay = float(line.split()[1].strip())
                            naive_edge_dict[edge_delay] = naive_move_delay
                        else:
                            print("Error: unknown line")
            intra_map[core_delay] = intra_edge_dict
            inter_map[core_delay] = inter_edge_dict
            naive_map[core_delay] = naive_edge_dict
        self.intra_map = pd.DataFrame(intra_map)
        self.inter_map = pd.DataFrame(inter_map)
        self.naive_map = pd.DataFrame(naive_map)
    


    def Visiualize(self):
        # load data
        self.load_data_map()
        
        # plot
        self.plot_mobility_heatmap()

if __name__ == "__main__":
    print("Run as main")
    plot = MobilityPlot()
    plot.Visiualize()