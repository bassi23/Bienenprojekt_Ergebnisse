% Frühestes Datum: 14.04.2019

% 1. Schritt: Gebt hier an von wann bis wann Daten heruntergeladen werden
% sollen. Beachtet: Wählt ihr das Intervall groß, dauert es länger bis das
% Programm durchgefahren ist.
% Syntax: "MONTH DAY, YEAR HOUR:MINUTE:SECOND
% Beispiel: "July 15, 2019 07:35:59";
%
% ODER: datetime(now, 'ConvertFrom', 'datenum'); für die aktuelle Zeit 
start = "May 14, 2019";
fin = datetime(now, 'ConvertFrom', 'datenum');

% 2. Schritt: Welcher Zeitbereich soll gezeichnet werden?
startPlot = "May 14, 2019 08:00:00";
endPlot = "September 04, 2019 12:00:00";

% 3. Schritt: Sollen Daten gemittelt werden? Falls ja, wieviele?
averaging_values = 20;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% GANZ NACH UNTEN GEHEN UND DAS HIER IGNORIEREN %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%  GEHT IN ZEILE 220  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tstart = datetime(startPlot);
tend = datetime(endPlot);
disp("hole Daten");
[bee_data, bee_time] = thingSpeakRead(697239, 'DateRange', [datetime(start), datetime(fin)], 'Fields', [1, 2, 3, 4, 5, 6, 7, 8]);
[normal_data, normal_time] = thingSpeakRead(736508, 'DateRange', [datetime(start), datetime(fin)], 'Fields', [1, 2, 3, 4, 5, 6, 7, 8]);
disp(bee_time(1, 1));
k = length(bee_time);
bee_temperature = bee_data(:, 1);
bee_humidity = bee_data(:, 2);
bee_pressure = bee_data(:, 3);
bee_CO2 = bee_data(:, 4);
bee_TVOC = bee_data(:, 5);
bee_PM2_5 = bee_data(:, 6);
bee_PM10 = bee_data(:, 7);
bee_eCO2 = bee_data(:, 8);
normal_temperature = normal_data(:, 1);
normal_humidity = normal_data(:, 2);
normal_pressure = normal_data(:, 3);
normal_CO2 = normal_data(:, 4);
normal_TVOC = normal_data(:, 5);
normal_PM2_5 = normal_data(:, 6);
normal_PM10 = normal_data(:, 7);
normal_eCO2 = normal_data(:, 8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while k == 8000
    [bee_data_temp, bee_time_temp] = thingSpeakRead(697239, 'DateRange', [datetime(start), datetime(bee_time(1, 1))], 'Fields', [1, 2, 3, 4, 5, 6, 7, 8]);
    [normal_data_temp, normal_time_temp] = thingSpeakRead(736508, 'DateRange', [datetime(start), datetime(fin)], 'Fields', [1, 2, 3, 4, 5, 6, 7, 8]);
 
    bee_time_temp = transpose(bee_time_temp);
    bee_time = transpose([bee_time_temp, transpose(bee_time)]);
 
    bee_temperature_temp = transpose(bee_data_temp(:, 1));
    bee_temperature = transpose([bee_temperature_temp, transpose(bee_temperature)]);
 
    bee_humidity_temp = transpose(bee_data_temp(:, 2));
    bee_humidity = transpose([bee_humidity_temp, transpose(bee_humidity)]);
 
    bee_pressure_temp = transpose(bee_data_temp(:, 3));
    bee_pressure = transpose([bee_pressure_temp, transpose(bee_pressure)]);
 
    bee_CO2_temp = transpose(bee_data_temp(:, 4));
    bee_CO2 = transpose([bee_CO2_temp, transpose(bee_CO2)]);
 
    bee_TVOC_temp = transpose(bee_data_temp(:, 5));
    bee_TVOC = transpose([bee_TVOC_temp, transpose(bee_TVOC)]);
 
    bee_PM10_temp = transpose(bee_data_temp(:, 6));
    bee_PM10 = transpose([bee_PM10_temp, transpose(bee_PM10)]);
 
    bee_PM2_5_temp = transpose(bee_data_temp(:, 7));
    bee_PM2_5 = transpose([bee_PM2_5_temp, transpose(bee_PM2_5)]);
 
    bee_eCO2_temp = transpose(bee_data_temp(:, 8));
    bee_eCO2 = transpose([bee_eCO2_temp, transpose(bee_eCO2)]);
 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
    normal_time_temp = transpose(normal_time_temp);
    normal_time = transpose([normal_time_temp, transpose(normal_time)]);
 
    normal_temperature_temp = transpose(normal_data_temp(:, 1));
    normal_temperature = transpose([normal_temperature_temp, transpose(normal_temperature)]);
 
    normal_humidity_temp = transpose(normal_data_temp(:, 2));
    normal_humidity = transpose([normal_humidity_temp, transpose(normal_humidity)]);
 
    normal_pressure_temp = transpose(normal_data_temp(:, 3));
    normal_pressure = transpose([normal_pressure_temp, transpose(normal_pressure)]);
 
    normal_CO2_temp = transpose(normal_data_temp(:, 4));
    normal_CO2 = transpose([normal_CO2_temp, transpose(normal_CO2)]);
 
    normal_TVOC_temp = transpose(normal_data_temp(:, 5));
    normal_TVOC = transpose([normal_TVOC_temp, transpose(normal_TVOC)]);
 
    normal_PM10_temp = transpose(normal_data_temp(:, 6));
    normal_PM10 = transpose([normal_PM10_temp, transpose(normal_PM10)]);
 
    normal_PM2_5_temp = transpose(normal_data_temp(:, 7));
    normal_PM2_5 = transpose([normal_PM2_5_temp, transpose(normal_PM2_5)]);
 
    normal_eCO2_temp = transpose(normal_data_temp(:, 8));
    normal_eCO2 = transpose([normal_eCO2_temp, transpose(normal_eCO2)]);
 
    k = length(bee_time_temp);
    disp(bee_time(1, 1));
end

bee_time = transpose(bee_time);
normale_time = transpose(normal_time);

% NUN AUSREIßER ENTFERNEN
bee_temperature = bereinige_ausreisser(bee_temperature);
bee_humidity = bereinige_ausreisser(bee_humidity);
bee_pressure = bereinige_ausreisser(bee_pressure);
bee_CO2 = bereinige_ausreisser(bee_CO2);
bee_TVOC = bereinige_ausreisser(bee_TVOC);
bee_PM2_5 = bereinige_ausreisser(bee_PM2_5);
bee_PM10 = bereinige_ausreisser(bee_PM10);
bee_eCO2 = bereinige_ausreisser(bee_eCO2);

normal_temperature = bereinige_ausreisser(normal_temperature);
normal_humidity = bereinige_ausreisser(normal_humidity);
normal_pressure = bereinige_ausreisser(normal_pressure);
normal_CO2 = bereinige_ausreisser(normal_CO2);
normal_TVOC = bereinige_ausreisser(normal_TVOC);
normal_PM2_5 = bereinige_ausreisser(normal_PM2_5);
normal_PM10 = bereinige_ausreisser(normal_PM10);
normal_eCO2 = bereinige_ausreisser(normal_eCO2);

sz = size(bee_temperature);
sz = round(floor(sz(1, 1) / averaging_values));

bee_temperature(averaging_values * sz + 1:end) = [];
bee_humidity(averaging_values * sz + 1:end) = [];
bee_pressure(averaging_values * sz + 1:end) = [];
bee_CO2(averaging_values * sz + 1:end) = [];
bee_TVOC(averaging_values * sz + 1:end) = [];
bee_eCO2(averaging_values * sz + 1:end) = [];
bee_PM2_5(averaging_values * sz + 1:end) = [];
bee_PM10(averaging_values * sz + 1:end) = [];

normal_temperature(averaging_values * sz + 1:end) = [];
normal_humidity(averaging_values * sz + 1:end) = [];
normal_pressure(averaging_values * sz + 1:end) = [];
normal_CO2(averaging_values * sz + 1:end) = [];
normal_TVOC(averaging_values * sz + 1:end) = [];
normal_eCO2(averaging_values * sz + 1:end) = [];
normal_PM2_5(averaging_values * sz + 1:end) = [];
normal_PM10(averaging_values * sz + 1:end) = [];

bee_time(averaging_values * sz + 1:end) = [];
normal_time(averaging_values * sz + 1:end) = [];

average_bee_temperature = reshape(bee_temperature, [], sz);
average_bee_temperature = transpose(mean(average_bee_temperature));

average_temperature = reshape(normal_temperature, [], sz);
average_temperature = transpose(mean(average_temperature));

average_bee_humidity = reshape(bee_humidity, [], sz);
average_bee_humidity = transpose(mean(average_bee_humidity));

average_humidity = reshape(normal_humidity, [], sz);
average_humidity = transpose(mean(average_humidity));

average_bee_pressure = reshape(bee_pressure, [], sz);
average_bee_pressure = transpose(mean(average_bee_pressure));

average_pressure = reshape(normal_pressure, [], sz);
average_pressure = transpose(mean(average_pressure));

average_bee_CO2 = reshape(bee_CO2, [], sz);
average_bee_CO2 = transpose(mean(average_bee_CO2));

average_CO2 = reshape(normal_CO2, [], sz);
average_CO2 = transpose(mean(average_CO2));

average_bee_TVOC = reshape(bee_TVOC, [], sz);
average_bee_TVOC = transpose(mean(average_bee_TVOC));

average_TVOC = reshape(normal_TVOC, [], sz);
average_TVOC = transpose(mean(average_TVOC));

average_bee_eCO2 = reshape(bee_eCO2, [], sz);
average_bee_eCO2 = transpose(mean(average_bee_eCO2));

average_eCO2 = reshape(normal_eCO2, [], sz);
average_eCO2 = transpose(mean(average_eCO2));

average_bee_PM2_5 = reshape(bee_PM2_5, [], sz);
average_bee_PM2_5 = transpose(mean(average_bee_PM2_5));

average_PM2_5 = reshape(normal_PM2_5, [], sz);
average_PM2_5 = transpose(mean(average_PM2_5));

average_bee_PM10 = reshape(bee_PM10, [], sz);
average_bee_PM10 = transpose(mean(average_bee_PM10));

average_PM10 = reshape(normal_PM10, [], sz);
average_PM10 = transpose(mean(average_PM10));

average_bee_time = reshape(bee_time, [], sz);
average_bee_time = transpose(mean(average_bee_time));

average_time = reshape(bee_time, [], sz);
average_time = transpose(mean(average_time));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







% 4. Schritt: TRAGT HIER EIN WELCHE DATEN GEZEICHNET WERDEN SOLLEN %%%%%%%%

plot(average_bee_time, average_bee_TVOC, average_time, average_TVOC);

% 5. Schritt: Was soll auf der x-Achse stehen?
xlabel('Zeit');
% 6. Schritt: Was soll auf der y-Achse stehen?
ylabel('TVOC in ppb');
xlim([tstart tend]);
grid on;














%%%%% NICHTS MEHR UNTER DIESEM KOMMENTAR VERÄNDERN !!! %%%%%%%%%%%%%%%%%%%

function [f] = bereinige_ausreisser(x)
ausreisser = isoutlier(x);
f(1, 1) = x(1, 1);
for i = 2:size(x)
    if ausreisser(i, 1) == 1
        f(i, 1) = x(i - 1, 1);
    else
        f(i, 1) = x(i, 1);
    end
end
end

