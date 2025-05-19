%This code will plot P/Ao as a function of distance from central star

Ao_WHya6 = 0.016;
Ao_WHya4 = 0.1514;
Ao_WHya1 = 0.0039;
Ao_VHya6 = 0.165;
Ao_VXEri9 = 0.0805;
Ao_UAnt1 = 0.1401;
Ao_UAnt2 = 0.0953;

Pmax_WHya6 = 0.78;
Pmax_WHya4 = 1.008;
Pmax_WHya1 = 0.264;
Pmax_VHya6 = 0.957;
Pmax_VXEri9 = 1.1002;
Pmax_UAnt1 = 0.823;
Pmax_UAnt2 = 0.128;

PAo_WHya6 = Pmax_WHya6 / Ao_WHya6;
PAo_WHya4 = Pmax_WHya4 / Ao_WHya4;
PAo_WHya1 = Pmax_WHya1 / Ao_WHya1;
PAo_VHya6 = Pmax_VHya6 / Ao_VHya6;
PAo_VXEri9 = Pmax_VXEri9 / Ao_VXEri9;
PAo_UAnt1 = Pmax_UAnt1 / Ao_UAnt1;
PAo_UAnt2 = Pmax_UAnt2 / Ao_UAnt2;

P_Error_WHya6 = 0.215;
P_Error_WHya4 = 0.647;
P_Error_WHya1 = 0.0379;
P_Error_VHya6 = 0.785;
P_Error_VXEri9 = 0.353;
P_Error_UAnt2 = 0.0554;
P_Error_UAnt1 = 0.496;

Ao_Error_WHya6 = 0.0119;
Ao_Error_WHya4 = 0.0422;
Ao_Error_WHya1 = 0.0029;
Ao_Error_VHya6 = 0.0212;
Ao_Error_VXEri9 = 0.0287;
Ao_Error_UAnt1 = 0.0087;
Ao_Error_UAnt2 = 0.0055;

Error_WHya6 = PAo_WHya6 * sqrt((Ao_Error_WHya6/Ao_WHya6)^2+(P_Error_WHya6/Pmax_WHya6)^2);
Error_WHya4 = PAo_WHya4 * sqrt((Ao_Error_WHya4/Ao_WHya4)^2+(P_Error_WHya4/Pmax_WHya4)^2);
Error_WHya1 = PAo_WHya1 * sqrt((Ao_Error_WHya1/Ao_WHya1)^2+(P_Error_WHya1/Pmax_WHya1)^2);
Error_VHya6 = PAo_VHya6 * sqrt((Ao_Error_VHya6/Ao_VHya6)^2+(P_Error_VHya6/Pmax_VHya6)^2);
Error_VXEri9 = PAo_VXEri9 * sqrt((Ao_Error_VXEri9/Ao_VXEri9)^2+(P_Error_VXEri9/Pmax_VXEri9)^2);
Error_UAnt1 = PAo_UAnt1 * sqrt((Ao_Error_UAnt1/Ao_UAnt1)^2+(P_Error_UAnt1/Pmax_UAnt1)^2);
Error_UAnt2 = PAo_UAnt2 * sqrt((Ao_Error_UAnt2/Ao_UAnt2)^2+(P_Error_UAnt2/Pmax_UAnt2)^2);

%units for this is arcminutes
X_WHya6 = 4.219/3.572;
X_WHya4 = 3.586/3.572;
X_WHya1 = 1.162/3.572;
X_VHya6 = 6.859/5.988;
X_VXEri9 = 7.178/4.894;
X_UAnt1 = 1.273/2.79;
X_UAnt2 = 1.859/2.79;

%order: WHya6 WHya4 WHya1 VHya6 VXEri9 UAnt1 UAnt2
PAo = [48.75, 6.6579, 67.6923, 5.8, 13.6671, 5.8744, 1.3431];
X_Data = [1.1811, 1.0039, 0.3253, 1.1455, 1.4667, 0.4563, 0.6663];
Error = [Error_WHya6, Error_WHya4, Error_WHya1, Error_VHya6, Error_VXEri9, Error_UAnt1, Error_UAnt2];

% Define colors and shapes for each point
colors = ['r', 'r', 'r', 'b', 'r', 'b', 'b']; % Different colors
%red for O and blue for C
shapes = ['s', 's', 'o', 's', 's', 'o', 'o']; % Different shapes
%Inside: o Within: s Outside: ^

% Create the plot
figure;
hold on; % Keep the plot for multiple points
grid on;

% Plot each point individually
for i = 1:length(PAo)
    errorbar(X_Data(i), PAo(i), Error(i), [colors(i), shapes(i)], 'MarkerSize', 8, 'LineWidth', 1.5);
end

xlabel('Normalized Distance (arcminutes)');
ylabel('Pmax/Ao');
title('Plot of Pmax/Ao vs. Distance');










