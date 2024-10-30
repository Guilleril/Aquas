% PROYECTO FIN DE CARRERA - Jorge L. Vega Valle
% Fichero  redes_abiertas.m



%SUPOSICION IMPORTANTE !!!
%EN LAS REDES ABIERTAS SE ASUME QUE EL MODELO DE 
%LOS DISTINTOS ES EL M/M/s, A SECAS.




%Este fichero se encarga de leer el valor de lambda, mu
%y numero de servidores para cada nodo que forma la red.
%Tambien se encarga de leer el valor de las probabilidades
%desde cada nodo de la red a todos los restantes.


%Cerramos la ventana anterior (en un primer caso, es la que
%pregunta sobre el numero de nodos de la red, mientras que 
%en un segundo caso pregunta sobre los parametros de entrada
%de un determinado nodo de la red de Jackson abierta).

close(1)

figure('Units', 'normalized',...
	   'Position', [0.05 0.05 0.9 0.9],...
       'MenuBar', 'none', ...
       'name', 'Resolucion analitica: Parametros de entrada de la red de Jackson abierta', ...
       'NumberTitle', 'off', ...
       'resize','off');
     
pasos = pasos + 1;
     
     
frame_redes_abiertas_1 = uicontrol(gcf, 'Style', 'Frame', ...
   'Units', 'normalized', ...
   'BackgroundColor', [.6 .6 .6],...
   'Position', [0.15 0.78 0.8 0.2]);     

frame_redes_abiertas_2 = uicontrol(gcf, 'Style', 'Frame', ...
   'Units', 'normalized', ...
   'BackgroundColor', [.6 .6 .6],...
   'Position', [0.15 0.2 0.8 0.55]);     



texto1=strcat('Nodo n� ',' ',num2str(pasos));

text_redes_abiertas_1 = uicontrol(gcf, 'Style', 'Text', ...
   	'String', texto1, ...
   	'Units', 'normalized', ...
	'Position', [0.4 0.91 0.25 0.05], ...
    'FontUnits', 'normalized', ...
    'FontWeight', 'bold', ...
    'FontSize', 0.5, ...
    'BackgroundColor', [.6 .6 .6],...
    'HorizontalAlignment', 'Center');
   
%Lambda
text_redes_abiertas_lambda = uicontrol(gcf, 'Style', 'Text', ...
   	'String', 'Lambda = ', ...
   	'Units', 'normalized', ...
	'Position', [0.2 0.8 0.10 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.6 .6 .6],...
    'HorizontalAlignment', 'Center');   
   
lambda_abiertas = uicontrol(gcf, 'Style', 'Edit', ...
   	'Units', 'normalized', ...
	'Position', [0.32 0.8 0.08 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.702 .702 .702],...
    'HorizontalAlignment', 'Center');
   
%Mu   
text_redes_abiertas_mu = uicontrol(gcf, 'Style', 'Text', ...
   	'String', 'Mu = ', ...
   	'Units', 'normalized', ...
	'Position', [0.45 0.8 0.05 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.6 .6 .6],...
    'HorizontalAlignment', 'Center'); 
   
mu_abiertas = uicontrol(gcf, 'Style', 'Edit', ...
   	'Units', 'normalized', ...
	'Position', [0.52 0.8 0.08 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.702 .702 .702],...
    'HorizontalAlignment', 'Center');

%Numero de servidores
text_redes_abiertas_servidores = uicontrol(gcf, 'Style', 'Text', ...
   	'String', 'Servidores = ', ...
   	'Units', 'normalized', ...
	'Position', [0.65 0.8 0.15 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.6 .6 .6],...
    'HorizontalAlignment', 'Center');  
   
servidores_abiertas = uicontrol(gcf, 'Style', 'Edit', ...
   	'Units', 'normalized', ...
	'Position', [0.82 0.8 0.08 0.05], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.4, ...
	'BackgroundColor', [.702 .702 .702],...
    'HorizontalAlignment', 'Center');
   
%Leemos el valor de la probabilidad de ir de un determinado de la red a otro
for j=1:nodos_abiertas
   texto_probabilidad=strcat('Probabilidad de ir al nodo n� ',num2str(j));
   
   text_redes_abiertas_probabilidad = uicontrol(gcf, 'Style', 'Text', ...
      	'String', texto_probabilidad, ...
   	    'Units', 'normalized', ...
		'Position', [0.3 (0.75-0.55*(j/(nodos_abiertas+1))) 0.35 0.05], ...
        'FontUnits', 'normalized', ...
        'FontSize', 0.4, ...
		'BackgroundColor', [.6 .6 .6],...
        'HorizontalAlignment', 'Center');  
   
   prob_abiertas(j) = uicontrol(gcf, 'Style', 'Edit', ...
       	'Units', 'normalized', ...
		'Position', [0.7 (0.75-0.55*(j/(nodos_abiertas+1))) 0.08 0.05], ...
        'FontUnits', 'normalized', ...
        'FontSize', 0.4, ...
	    'BackgroundColor', [.702 .702 .702],...
        'HorizontalAlignment', 'Center');

end      

clear texto1;
clear texto_redes_abiertas_probabilidad;


%Si se hace click en el boton de siguiente, se ejecuta el fichero 
%redes_abiertas_comprobar que se encarga de comprobar si los parametros
%introducidos son correctos. A su vez, el fichero redes_abiertas_comprobar
%volvera a llamar al fichero redes_abiertas mientras no se hayan leido
%los parametros de todos los nodos de la red

boton_redes_abiertas_sig = uicontrol(gcf, 'Style', 'Pushbutton',...
  'String', 'Siguiente >>', 'Value', 0, ...
  'Units', 'normalized', ...
  'Position', [0.38 0.05 0.2 0.1], ...
  'FontUnits', 'normalized', ...
  'FontWeight', 'bold', ...
  'FontSize', 0.2, ...
  'Callback', 'redes_abiertas_comprobar');
