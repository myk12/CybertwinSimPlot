import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

class MultipathPlot:
    def __init__(self) -> None:
        pass

    def plot_multipath_linechart(self):
        fig, axs = plt.subplots(1, 3, figsize=(50, 10), dpi=200)

        # change style
        plt.grid(color = 'grey', linestyle = '--', linewidth = 0.5, alpha = 0.5)
        plt.gca().set_facecolor('lightgray')
        plt.box(False)

        # plot 1, multipath_100_100 singlepath_100_100
        multipath_100_100 = self.dataset["multipath"][100][100]
        singlepath_100_100 = self.dataset["singlepath"][100][100]
        axs[0].plot(multipath_100_100["time(s)"], multipath_100_100["bandwidth(Mbps)"], label="multipath")
        axs[0].plot(singlepath_100_100["time(s)"], singlepath_100_100["bandwidth(Mbps)"], label="singlepath")
        axs[0].set_title("a) multipath_100_100 singlepath_100_100", size=30)
        axs[0].set_xlabel("time(s)", size=20)
        axs[0].set_ylabel("bandwidth(Mbps)", size=20)
        axs[0].legend()
        axs[0].grid(color = 'grey', linestyle = '--', linewidth = 0.5, alpha = 0.5)
        axs[0].set_facecolor('lightgray')
        #axs[0].bbox(False)

        # plot 2, multipath_50_50 multipath_50_100 multipath_100_100
        multipath_50_50 = self.dataset["multipath"][50][50]
        multipath_50_100 = self.dataset["multipath"][50][100]
        multipath_100_100 = self.dataset["multipath"][100][100]
        axs[1].plot(multipath_50_50["time(s)"], multipath_50_50["bandwidth(Mbps)"], label="multipath_50_50")
        axs[1].plot(multipath_50_100["time(s)"], multipath_50_100["bandwidth(Mbps)"], label="multipath_50_100")
        axs[1].plot(multipath_100_100["time(s)"], multipath_100_100["bandwidth(Mbps)"], label="multipath_100_100")
        axs[1].set_title("b) multipath_50_50 multipath_50_100 multipath_100_100", size=30)
        axs[1].set_xlabel("time(s)", size=20)
        axs[1].set_ylabel("bandwidth(Mbps)", size=20)
        axs[1].legend()

        # plot 3, singlepath_50_50 singlepath_50_100 singlepath_100_100
        singlepath_50_50 = self.dataset["singlepath"][50][50]
        singlepath_50_100 = self.dataset["singlepath"][50][100]
        singlepath_100_100 = self.dataset["singlepath"][100][100]
        axs[2].plot(singlepath_50_50["time(s)"], singlepath_50_50["bandwidth(Mbps)"], label="singlepath_50_50")
        axs[2].plot(singlepath_50_100["time(s)"], singlepath_50_100["bandwidth(Mbps)"], label="singlepath_50_100")
        axs[2].plot(singlepath_100_100["time(s)"], singlepath_100_100["bandwidth(Mbps)"], label="singlepath_100_100")
        axs[2].set_title("c) singlepath_50_50 singlepath_50_100 singlepath_100_100", size=30)
        axs[2].set_xlabel("time(s)", size=20)
        axs[2].set_ylabel("bandwidth(Mbps)", size=20)
        axs[2].legend()

        # save figure
        plt.savefig("multipath.png")


    def load_multipath_data(self):
        self.dataset = {}
        self.dataset["multipath"] = {}
        self.dataset["singlepath"] = {}

        link_speed_arr = [50, 100]

        for link1_speed in link_speed_arr:
            self.dataset["multipath"][link1_speed] = {}
            self.dataset["singlepath"][link1_speed] = {}
            for link2_speed in link_speed_arr:
                multipath_data_path = f"data/MultiPath_{link1_speed}_{link2_speed}.dat"
                singlepath_data_path = f"data/SinglePath_{link1_speed}_{link2_speed}.dat"
                multipath_data_df = pd.read_csv(multipath_data_path, sep=" ", header=None)
                multipath_data_df.columns = ["time(s)", "bandwidth(Mbps)"]
                singlepath_data_df = pd.read_csv(singlepath_data_path, sep=" ", header=None)
                singlepath_data_df.columns = ["time(s)", "bandwidth(Mbps)"]
                
                self.dataset["multipath"][link1_speed][link2_speed] = multipath_data_df
                self.dataset["singlepath"][link1_speed][link2_speed] = singlepath_data_df
                #print(f"load {multipath_data_path} and {singlepath_data_path} successfully")
                #print(multipath_data_df)

    def Visiualize(self):
        self.load_multipath_data()

        self.plot_multipath_linechart()

if __name__ == "__main__":
    plot = MultipathPlot()
    plot.Visiualize()
