close all;
clear;
clc;


dis = (1.5:1.5:15);

partio_0_2 = [readSignalStrength('./Data/partio_2_1.bin'), ...
    readSignalStrength('./Data/partio_2_2.bin'), ...
    readSignalStrength('./Data/partio_2_3.bin'), ...
    readSignalStrength('./Data/partio_2_4.bin'), ...
    readSignalStrength('./Data/partio_2_5.bin'), ...
    readSignalStrength('./Data/partio_2_6.bin'), ...
    readSignalStrength('./Data/partio_2_7.bin'), ...
    readSignalStrength('./Data/partio_2_8.bin'), -90, -90];

partio_0_4 = [readSignalStrength('./Data/partio_4_1.bin'), ...
    readSignalStrength('./Data/partio_4_2.bin'), ...
    readSignalStrength('./Data/partio_4_3.bin'), ...
    readSignalStrength('./Data/partio_4_4.bin'), ...
    readSignalStrength('./Data/partio_4_5.bin'), ...
    readSignalStrength('./Data/partio_4_6.bin'), ...
    readSignalStrength('./Data/partio_4_7.bin'), ...
    readSignalStrength('./Data/partio_4_8.bin'), -90, -90];

partio_0_6 = [readSignalStrength('./Data/partio_6_1.bin'), ...
    readSignalStrength('./Data/partio_6_2.bin'), ...
    readSignalStrength('./Data/partio_6_3.bin'), -90, -90, -90, -90,-90,-90,-90];

dry_0_2 = [readSignalStrength('./Data/dry_2_1.bin'), ...
    readSignalStrength('./Data/dry_2_2.bin'), ...
    readSignalStrength('./Data/dry_2_3.bin'), ...
    readSignalStrength('./Data/dry_2_4.bin'), ...
    readSignalStrength('./Data/dry_2_5.bin'), ...
    readSignalStrength('./Data/dry_2_6.bin'), ...
    readSignalStrength('./Data/dry_2_7.bin'), ...
    readSignalStrength('./Data/dry_2_8.bin'), -90, -90];

dry_0_4 = [readSignalStrength('./Data/dry_4_1.bin'), ...
    readSignalStrength('./Data/dry_4_2.bin'), ...
    readSignalStrength('./Data/dry_4_3.bin'), -90, -90, -90, -90, -90, -90, -90];

dry_0_6 = [readSignalStrength('./Data/dry_6_1.bin'), ...
    readSignalStrength('./Data/dry_6_2.bin'),-90, -90, -90, -90, -90, -90, -90, -90];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fontSize = 18;
figuresize = [0 200 400 250];
greenColor = [0, 0.5, 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1=figure('Position',figuresize);

plot(dis, partio_0_2, '-r*','LineWidth',3);
hold on;
plot(dis, partio_0_4, ':gx','LineWidth',3);
hold on;
plot(dis, partio_0_6, '--b+','LineWidth',3);


[~, hObjs] = legend({'d_{ph} = 0.2 m', 'd_{ph} = 0.4 m', 'd_{ph} = 0.6 m',},'Location','northeast','Orientation','vertical', 'FontSize',fontSize, 'color', 'white');


for i = 1:length(hObjs)
    hdl = hObjs(i);
    if strcmp(get(hdl, 'Type'), 'text')
        pos = get(hdl, 'Position');
        extent = get(hdl, 'Extent');    
        pos(1) = 1-extent(1)-extent(3); 
        set(hdl, 'Position', pos);
    else     
        xData = get(hdl, 'XData');
        if length(xData) == 2 
            xDataNew = [1-xData(2), 1-xData(1)];
        else 
            xDataNew = 1-xData;
        end
        set(hdl, 'XData', xDataNew);
    end
end

legend boxoff;


grid on;
ax = gca;
ax.GridColor = [0 0 0];
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
ax.Layer = 'top';


set(ax, 'FontSize', fontSize, 'FontWeight', 'normal');
xlim([0, 15]);
ylim([-90, -50]);
set(ax, 'XTick', 0:1.5:15);
set(ax,'XTickLabel',{'0','', '3','','6','','9','','12','','15'});
set(ax, 'YTick', -90:5:-50);
set(ax, 'YTickLabel', {'-90','-85', '-80','-75','-70','-65','-60','-55','-50'});
xlabel('{\it LightThief}-to-Attacker Distance (m)');
ylabel('Signal Strength (dB)');
set(ax,'box','off');
ax.LineWidth = 1;


fig1.PaperPositionMode = 'auto';
fig_pos = fig1.PaperPosition;
print('partitionWall','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fig2=figure('Position',figuresize);

plot(dis, dry_0_2, '-r*','LineWidth',3);
hold on;
plot(dis, dry_0_4, ':gx','LineWidth',3);
hold on;
plot(dis, dry_0_6, '--b+','LineWidth',3);


[~, hObjs] = legend({'d_{ph} = 0.2 m', 'd_{ph} = 0.4 m', 'd_{ph} = 0.6 m',},'Location','northeast','Orientation','vertical', 'FontSize',fontSize, 'color', 'white');


for i = 1:length(hObjs)
    hdl = hObjs(i);
    if strcmp(get(hdl, 'Type'), 'text')
        pos = get(hdl, 'Position');
        extent = get(hdl, 'Extent');    
        pos(1) = 1-extent(1)-extent(3); 
        set(hdl, 'Position', pos);
    else
        xData = get(hdl, 'XData');
        if length(xData) == 2 
            xDataNew = [1-xData(2), 1-xData(1)];
        else 
            xDataNew = 1-xData;
        end
        set(hdl, 'XData', xDataNew);
    end
end

legend boxoff;


grid on;
ax = gca;
ax.GridColor = [0 0 0];
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
ax.Layer = 'top';

set(ax, 'FontSize', fontSize, 'FontWeight', 'normal');
xlim([0, 15]);
ylim([-90, -50]);
set(ax, 'XTick', 0:1.5:15);
set(ax,'XTickLabel',{'0','', '3','','6','','9','','12','','15'});
set(ax, 'YTick', -90:5:-50);
set(ax, 'YTickLabel', {'-90','-85', '-80','-75','-70','-65','-60','-55','-50'});
xlabel('{\it LightThief}-to-Attacker Distance (m)');
ylabel('Signal Strength (dB)');
set(ax,'box','off');
ax.LineWidth = 1;


fig2.PaperPositionMode = 'auto';
fig_pos = fig2.PaperPosition;
print('dryWall','-depsc')
