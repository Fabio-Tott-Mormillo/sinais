%% An�lise de sinais de voz


%%% Incia o ambiente matlab para uma sess�o de an�lises

clear; clc; close all;

%%% Carrega o trabalho feito anteriormente e gravado no arquivo Voz.mat

load('Voz.mat') 

%%% Vissualizando o material que temos

figure(1) % Cria uma figura para a an�lise temporal

plot(t,Vp);
title('Sinal de voz para a vogal a');
xlabel('Tempo em us');
ylabel('Tens�o em Volts'); 
grid minor

%%% modifica par�mteros do gr�fico

set(findall(gcf,'Type','line'),'LineWidth',3);
set(gca,'FontSize',14,'LineWidth',2);

figure(2) % Cria uma figura para a an�lise em frequ�ncia

plot(frequencia,Y0);
title('Espectro de amplitude da vogal a');
xlabel('Frequ�ncia em Hz');
ylabel('Magnitude em dB'); 
grid minor

%%% modifica par�mteros do gr�fico

set(findall(gcf,'Type','line'),'LineWidth',3);
set(gca,'FontSize',14,'LineWidth',2);

%%% Analisando os par�mteros graficamente

ti = 0.001126;  % come�o do primeiro per�odo inteiro
tf = 0.09537;   % fim do �ltimo per�odo inteiro

T = (tf-ti)/13; % valor m�dio dentre os 13 per�odos
f = inv(T);     % frequ�ncia associada a vibra��o gerada

figure(3)

findpeaks(Vp,t,'MinPeakDistance',0.001);

[vt,tp]=findpeaks(Vp,t,'MinPeakDistance',0.001);

Tm =mean(diff(tp));

title('Sinal de voz para a vogal a');
xlabel('Tempo em us');
ylabel('Tens�o em Volts'); 
grid minor

figure(4)

findpeaks(Y0,frequencia,'MinPeakDistance',0.9*f);

title('Espectro de amplitude da vogal a');
xlabel('Frequ�ncia em Hz');
ylabel('Magnitude em dB'); 
grid minor

[Md,fp]=findpeaks(Y0,frequencia,'MinPeakDistance',0.9*f);


%%% Harm�nicas

H(1) = 130;
H(2) = 270;
H(3) = 400;
H(4) = 540;
H(5) = 670;
H(6) = 800;
H(7) = 940;
H(8) = 1070;

delta  =  diff(H);

%%% Valor m�dio da harm�nica

Hm = mean(delta);

%%%% Formantes

FRM(1) = 670;
FRM(2) = 1480;
FRM(3) = 2700;




