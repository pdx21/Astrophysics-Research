%V_HYA_6 DATA BINNING
clear;

%load in data from Siddharth
DATA_Hya = readtable("VHya6_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Hya.Var1;
intensity = DATA_Hya.Var2;
q = DATA_Hya.Var3;
u = DATA_Hya.Var4;
q_error = DATA_Hya.Var5;
u_error = DATA_Hya.Var6;
%P = DATA_Hya.Var7;
%PA = DATA_Hya.Var8;
P_error = DATA_Hya.Var9;
PA_error = DATA_Hya.Var10;

%set points
Hya_points = 2927;

%determine how many new points there should be
Hya_groups = floor(Hya_points/101);


%pre-allocate space for the new points
binned_wavelength = zeros(Hya_groups, 1);
binned_intensity = zeros(Hya_groups, 1);
binned_q = zeros(Hya_groups, 1);
binned_u = zeros(Hya_groups, 1);
binned_q_error = zeros(Hya_groups, 1);
binned_u_error = zeros(Hya_groups, 1);
binned_P = zeros(Hya_groups, 1);
binned_PA = zeros(Hya_groups, 1);
binned_P_error = zeros(Hya_groups, 1);
binned_PA_error = zeros(Hya_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2927 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Hya_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end

%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2927
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'VHya6_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Hya_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);


%%
%VX_ERI_9 DATA BINNING
clear;

%load in data from Siddharth
DATA_Eri = readtable("VXEri9_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Eri.Var1;
intensity = DATA_Eri.Var2;
q = DATA_Eri.Var3;
u = DATA_Eri.Var4;
q_error = DATA_Eri.Var5;
u_error = DATA_Eri.Var6;
%P = DATA_Eri.Var7;
%PA = DATA_Eri.Var8;
P_error = DATA_Eri.Var9;
PA_error = DATA_Eri.Var10;

%set points
Eri_points = 2940;

%determine how many new points there should be
Eri_groups = floor(Eri_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Eri_groups, 1);
binned_intensity = zeros(Eri_groups, 1);
binned_q = zeros(Eri_groups, 1);
binned_u = zeros(Eri_groups, 1);
binned_q_error = zeros(Eri_groups, 1);
binned_u_error = zeros(Eri_groups, 1);
binned_P = zeros(Eri_groups, 1);
binned_PA = zeros(Eri_groups, 1);
binned_P_error = zeros(Eri_groups, 1);
binned_PA_error = zeros(Eri_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Eri_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2940 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Eri_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Eri_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2940
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'VXEri9_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Eri_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);



%%
%U_ANT_2 DATA BINNING
clear;

%load in data from Siddharth
DATA_Ant = readtable("UAnt2_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Ant.Var1;
intensity = DATA_Ant.Var2;
q = DATA_Ant.Var3;
u = DATA_Ant.Var4;
q_error = DATA_Ant.Var5;
u_error = DATA_Ant.Var6;
%P = DATA_Ant.Var7;
%PA = DATA_Ant.Var8;
P_error = DATA_Ant.Var9;
PA_error = DATA_Ant.Var10;

%set points
Ant_points = 2930;

%determine how many new points there should be
Ant_groups = floor(Ant_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Ant_groups, 1);
binned_intensity = zeros(Ant_groups, 1);
binned_q = zeros(Ant_groups, 1);
binned_u = zeros(Ant_groups, 1);
binned_q_error = zeros(Ant_groups, 1);
binned_u_error = zeros(Ant_groups, 1);
binned_P = zeros(Ant_groups, 1);
binned_PA = zeros(Ant_groups, 1);
binned_P_error = zeros(Ant_groups, 1);
binned_PA_error = zeros(Ant_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Ant_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2930 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Ant_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Ant_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2930
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'UAnt2_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Ant_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);

%%
%U_ANT_1 DATA BINNING

clear;

%load in data from Siddharth
DATA_Ant = readtable("UAnt1_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Ant.Var1;
intensity = DATA_Ant.Var2;
q = DATA_Ant.Var3;
u = DATA_Ant.Var4;
q_error = DATA_Ant.Var5;
u_error = DATA_Ant.Var6;
%P = DATA_Ant.Var7;
%PA = DATA_Ant.Var8;
P_error = DATA_Ant.Var9;
PA_error = DATA_Ant.Var10;

%set points
Ant_points = 2935;

%determine how many new points there should be
Ant_groups = floor(Ant_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Ant_groups, 1);
binned_intensity = zeros(Ant_groups, 1);
binned_q = zeros(Ant_groups, 1);
binned_u = zeros(Ant_groups, 1);
binned_q_error = zeros(Ant_groups, 1);
binned_u_error = zeros(Ant_groups, 1);
binned_P = zeros(Ant_groups, 1);
binned_PA = zeros(Ant_groups, 1);
binned_P_error = zeros(Ant_groups, 1);
binned_PA_error = zeros(Ant_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Ant_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2935 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Ant_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Ant_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2935
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'UAnt1_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Ant_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);

%%
%W_HYA_1 DATA BINNING
clear;

%load in data from Siddharth
DATA_Hya1 = readtable("WHya1_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Hya1.Var1;
intensity = DATA_Hya1.Var2;
q = DATA_Hya1.Var3;
u = DATA_Hya1.Var4;
q_error = DATA_Hya1.Var5;
u_error = DATA_Hya1.Var6;
%P = DATA_Hya1.Var7;
%PA = DATA_Hya1.Var8;
P_error = DATA_Hya1.Var9;
PA_error = DATA_Hya1.Var10;

%set points
Hya_points = 2934;

%determine how many new points there should be
Hya_groups = floor(Hya_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Hya_groups, 1);
binned_intensity = zeros(Hya_groups, 1);
binned_q = zeros(Hya_groups, 1);
binned_u = zeros(Hya_groups, 1);
binned_q_error = zeros(Hya_groups, 1);
binned_u_error = zeros(Hya_groups, 1);
binned_P = zeros(Hya_groups, 1);
binned_PA = zeros(Hya_groups, 1);
binned_P_error = zeros(Hya_groups, 1);
binned_PA_error = zeros(Hya_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2934 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Hya_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2934
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'WHya1_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Hya_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);

%%
%W_HYA_1 DATA BINNING
clear;

%load in data from Siddharth
DATA_Hya4 = readtable("WHya4_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Hya4.Var1;
intensity = DATA_Hya4.Var2;
q = DATA_Hya4.Var3;
u = DATA_Hya4.Var4;
q_error = DATA_Hya4.Var5;
u_error = DATA_Hya4.Var6;
%P = DATA_Hya1.Var7;
%PA = DATA_Hya1.Var8;
P_error = DATA_Hya4.Var9;
PA_error = DATA_Hya4.Var10;

%set points
Hya_points = 2937;

%determine how many new points there should be
Hya_groups = floor(Hya_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Hya_groups, 1);
binned_intensity = zeros(Hya_groups, 1);
binned_q = zeros(Hya_groups, 1);
binned_u = zeros(Hya_groups, 1);
binned_q_error = zeros(Hya_groups, 1);
binned_u_error = zeros(Hya_groups, 1);
binned_P = zeros(Hya_groups, 1);
binned_PA = zeros(Hya_groups, 1);
binned_P_error = zeros(Hya_groups, 1);
binned_PA_error = zeros(Hya_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2937 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Hya_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2937
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'WHya4_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Hya_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);

%%
%W_HYA_6 DATA BINNING
clear;

%load in data from Siddharth
DATA_Hya6 = readtable("WHya6_c0_123_stokes_unbin.txt");

%isolate columns for binning
wavelength = DATA_Hya6.Var1;
intensity = DATA_Hya6.Var2;
q = DATA_Hya6.Var3;
u = DATA_Hya6.Var4;
q_error = DATA_Hya6.Var5;
u_error = DATA_Hya6.Var6;
%P = DATA_Hya1.Var7;
%PA = DATA_Hya1.Var8;
P_error = DATA_Hya6.Var9;
PA_error = DATA_Hya6.Var10;

%set points
Hya_points = 2934;

%determine how many new points there should be
Hya_groups = floor(Hya_points/101);

%pre-allocate space for the new points
binned_wavelength = zeros(Hya_groups, 1);
binned_intensity = zeros(Hya_groups, 1);
binned_q = zeros(Hya_groups, 1);
binned_u = zeros(Hya_groups, 1);
binned_q_error = zeros(Hya_groups, 1);
binned_u_error = zeros(Hya_groups, 1);
binned_P = zeros(Hya_groups, 1);
binned_PA = zeros(Hya_groups, 1);
binned_P_error = zeros(Hya_groups, 1);
binned_PA_error = zeros(Hya_groups, 1);

endIdx = 0;
%This loop will average non-error columns
for i=1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2934 %change this value depending on star
         break;
    end 
    binned_wavelength(i) = sum(wavelength(startIdx:endIdx))./101;
    binned_intensity(i) = sum(intensity(startIdx:endIdx))./101;
    binned_q(i) = sum(q(startIdx:endIdx))./101;
    binned_u(i) = sum(u(startIdx:endIdx))./101;
    %binned_P(i) = sum(P(startIdx:endIdx))./51;
    %binned_PA(i) = sum(PA(startIdx:endIdx))./51;
end

%This loop will perform binning for P and PA columns
%P = SQRT(Q^2 + U^2)
%PA = 1/2 * arctan(U./Q)

for i=1:Hya_groups
    binned_P(i) = sqrt(binned_q(i).^2 + binned_u(i).^2);
    binned_PA(i) = 0.5 .* atan2d(binned_u(i), binned_q(i));
end


%This loop will perform averaging of error columns
endIdx = 0;
for i = 1:Hya_groups
    startIdx = endIdx + 1;
    endIdx = startIdx + 100;
    if endIdx > 2934
       break;
   end
    q_error_seg = q_error(startIdx:endIdx);
    q_error_squared = sum(q_error_seg .^2);
    binned_q_error(i) = sqrt(q_error_squared)./101;
    u_error_seg = u_error(startIdx:endIdx);
    u_error_squared = sum(u_error_seg .^2);
    binned_u_error(i) = sqrt(u_error_squared)./101;
    P_error_seg = P_error(startIdx:endIdx);
    P_error_squared = sum(P_error_seg .^2);
    binned_P_error(i) = sqrt(P_error_squared)./101;
    PA_error_seg = PA_error(startIdx:endIdx);
    PA_error_squared = sum(PA_error_seg .^2);
    binned_PA_error(i) = sqrt(PA_error_squared)./101;
end

%create and save the binned data to a new table
filename = 'WHya6_binned_101.txt';
fileID = fopen(filename, 'w');

% Write the data to the file
for row = 1:Hya_groups
    fprintf(fileID, '%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n', ...
        binned_wavelength(row), binned_intensity(row), binned_q(row), ...
        binned_u(row), binned_q_error(row), binned_u_error(row), ...
        binned_P(row), binned_PA(row), binned_P_error(row), binned_PA_error(row));
end
% Close the file
fclose(fileID);

