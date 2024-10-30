% PROYECTO FIN DE CARRERA - Jorge L. Vega Valle
% Fichero  cambiar_parametros_abiertas.m

%Modificacion de los parametros de la red de Jackson abierta


close(1)

figure('Units', 'normalized',...
		  'Position', [0.05 0.05 0.9 0.9],...
          'MenuBar', 'none', ...
          'name', 'Resolucion analitica: Cambiar parametros de la red de Jackson abierta', ...
          'NumberTitle', 'off', ...
          'resize','off');
     
frame_cambiar_parametros_1 = uicontrol(gcf, 'Style', 'Frame', ...
   'Units', 'normalized', ...
   'BackgroundColor', [.6 .6 .6],...
   'Position', [0.07 0.2 0.88 0.73]); 

frame_cambiar_parametros_2 = uicontrol(gcf, 'Style', 'Frame', ...
   'Units', 'normalized', ...
   'BackgroundColor', [.702 .702 .702],...
   'Position', [0.07 0.94 0.88 0.055]); 

text_cambiar_parametros = uicontrol(gcf, 'Style', 'Text', ...
    'String', 'Cambiar parametros de la red de Jackson abierta', ...
    'Units', 'normalized', ...
    'Position', [0.25 0.95 0.5 0.04], ...
  	'BackgroundColor', [.702 .702 .702], ...
    'FontUnits', 'normalized', ...
    'FontWeight', 'bold', ...
    'FontSize', 0.6, ...
    'HorizontalAlignment', 'Center');


%Para cada nodo, mostramos los valores existentes hasta ese momento
%(lambda, mu, s y p)
for i=1:nodos_abiertas
   
   texto_nodo='Nodo n�';
   
   texto_nodo=strcat(texto_nodo, ' ',num2str(i));
   
   text_lambda = uicontrol(gcf, 'Style', 'Text', ...
 	   'String', texto_nodo, ...
   	   'Units', 'normalized', ...
	   'Position', [0.08 0.98-0.8*i/(nodos_abiertas+1) 0.10 0.05], ...
   	   'BackgroundColor', [.6 .6 .6],...
       'FontUnits', 'normalized', ...
       'FontWeight', 'bold',...
       'FontSize', 0.4, ...
   	   'HorizontalAlignment', 'Center');

        
   text_lambda = uicontrol(gcf, 'Style', 'Text', ...
 	   'String', 'Lambda = ', ...
   	   'Units', 'normalized', ...
	   'Position', [0.2 0.98-0.8*i/(nodos_abiertas+1) 0.08 0.05], ...
       'BackgroundColor', [.6 .6 .6],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.4, ...
   	   'HorizontalAlignment', 'Center');
   
   vector_lambda_comprobar(i) = uicontrol(gcf, 'Style', 'Edit', ...
      'String', num2str(vector_lambda_abiertas(i)), ...
   	  'Units', 'normalized', ...
	  'Position', [0.3 0.98-0.8*i/(nodos_abiertas+1) 0.08 0.05], ...
   	  'BackgroundColor', [.702 .702 .702],...
	  'FontUnits', 'normalized', ...
      'FontSize', 0.4, ...
      'HorizontalAlignment', 'Center');
   
   
   text_mu = uicontrol(gcf, 'Style', 'Text', ...
 	   'String', 'Mu = ', ...
   	   'Units', 'normalized', ...
	   'Position', [0.45 0.98-0.8*i/(nodos_abiertas+1) 0.08 0.05], ...
   	   'BackgroundColor', [.6 .6 .6],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.4, ...
   	   'HorizontalAlignment', 'Center');
   
   vector_mu_comprobar(i) = uicontrol(gcf, 'Style', 'Edit', ...
       'String', num2str(vector_mu_abiertas(i)), ...
   	   'Units', 'normalized', ...
	   'Position', [0.55 0.98-0.8*i/(nodos_abiertas+1) 0.08 0.05], ...
   	   'BackgroundColor', [.702 .702 .702],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.4, ...
       'HorizontalAlignment', 'Center');
   
  text_servidores = uicontrol(gcf, 'Style', 'Text', ...
 	   'String', 'Servidores = ', ...
   	   'Units', 'normalized', ...
	   'Position', [0.7 0.98-0.8*i/(nodos_abiertas+1) 0.12 0.05], ...
   	   'BackgroundColor', [.6 .6 .6],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.4, ...
   	   'HorizontalAlignment', 'Center');
   
   vector_servidores_comprobar(i) = uicontrol(gcf, 'Style', 'Edit', ...
        'String', num2str(vector_servidores_abiertas(i)), ...
   	    'Units', 'normalized', ...
	    'Position', [0.84 0.98-0.8*i/(nodos_abiertas+1) 0.08 0.05], ...
      	'BackgroundColor', [.702 .702 .702],...
        'FontUnits', 'normalized', ...
        'FontSize', 0.4, ...
        'HorizontalAlignment', 'Center');
   
   for j=2:nodos_abiertas+1
      
      indice='p (';
      indice=strcat(indice,num2str(i),',',num2str(j-1),')');
      
      text_indice = uicontrol(gcf, 'Style', 'Text', ...
 	   'String', indice, ...
   	   'Units', 'normalized', ...
	   'Position', [0.2+0.65*(j-2)/nodos_abiertas 0.98-0.8*i/(nodos_abiertas+1)-0.06 0.05 0.05], ...
   	   'BackgroundColor', [.6 .6 .6],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.2, ...
      'HorizontalAlignment', 'Center');
   
	   matriz_prob_abiertas_comprobar(i+1,j) = uicontrol(gcf, 'Style', 'Edit', ...
       'String', num2str(matriz_prob_abiertas(i+1,j)), ...
   	   'Units', 'normalized', ...
	   'Position', [0.25+0.65*(j-2)/nodos_abiertas 0.98-0.8*i/(nodos_abiertas+1)-0.06 0.05 0.05], ...
   	   'BackgroundColor', [.702 .702 .702],...
       'FontUnits', 'normalized', ...
       'FontSize', 0.2, ...
       'HorizontalAlignment', 'Center');

   
   end
   
      
   
end

boton_cambiar_parametros_sig = uicontrol(gcf, 'Style', 'Pushbutton',...
    'String', 'Resolver >>', 'Value', 0, ...
  	'Units', 'normalized', ...
    'Position', [0.38 0.05 0.2 0.1], ...
    'FontUnits', 'normalized', ...
    'FontSize', 0.2, ...
    'Callback', 'resolver_cambiar_parametros_ab');

