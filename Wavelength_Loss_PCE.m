% vectors Wavelength and Delta_V3
Wavelength = 500:5:1200;
Delta_V3 = 0.04:0.02:0.42;
IdealEQE = 90; % To set the EQE as a step function, type a value here

% Preallocate the matrix for efficiency
PCE = zeros(length(Wavelength), length(Delta_V3));
Delta_V = zeros(length(Delta_V3), 1);

% Nested loops to calculate f for each combination of Wavelength and Delta_V3
for i_wave = 1:length(Wavelength)
    for j_v3 = 1:length(Delta_V3)
        E_g = 1240/Wavelength(i_wave);
        EQEMatrix = GenerateEQE(E_g, IdealEQE);
        [J0, JSC, VOCsq] = calculate_J0_JSC_VOC(EQEMatrix);
        VOC = VOCsq - 0.05 - Delta_V3(j_v3);
        muOC = VOC / 0.0259;
        FF = (muOC-log(muOC + 0.72))/(muOC+1)-0.05;
        PCE(i_wave, j_v3) = JSC * VOC * FF; % Replace this with your actual function
        Delta_V(j_v3) = E_g - VOC;
    end
end
PCE_skim = PCE'
[x, y] = meshgrid(Wavelength, Delta_V); % Delta_V for total loss or Delta_V3 for non-radiative loss
contour(x, y, PCE_skim); %contour plot
% PCE now contains the table of function values
