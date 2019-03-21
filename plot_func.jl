using PyPlot;

rc("figure",figsize = (8,6));
rc("font",family = "Arial");
rc("font",size = 20);
rc("axes",linewidth = 1);
rc("lines",linewidth = 2);
rc("lines",markersize = 10);
gca()[:spines]["right"][:set_visible](false);
gca()[:spines]["top"][:set_visible](false);
gca()[:yaxis][:set_ticks_position]("left");
gca()[:xaxis][:set_ticks_position]("bottom");


plot(fp[1:br[1]-1,VN+1],fp[1:br[1]-1,E2f+1],"k-");
plot(fp[br,VN+1],fp[br,E2f+1],"k:");
plot(fp[br[end]+1:end,VN+1],fp[br[end]+1:end,E2f+1],"k-");

axvspan(fp[br[1],VN+1],fp[br[end],VN+1],facecolor="m",alpha=0.05);

xlabel("Mitogen (a.u.)");
ylabel("E2F activity (a.u.)");

xlim(0,1);
xticks([0,0.5,1]);
ylim(-0.05,1.05);
yticks([0,0.5,1]);