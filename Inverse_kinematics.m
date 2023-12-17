clc;

a2 = 0.13;
a3 = 0.124;
a4 = 0.130;

xe = 0.04;
ye = 0;
ze = 0.05:0.001:0.15;
d1 = 0.077;
alpha = pi/2;

for i = ze
    q0 = atan2(ye,xe);
    q0_deg = rad2deg(q0);
    r4 = sqrt(xe^2 +ye^2);
    
    r3 = r4 -a4*cos(alpha);
    z3 = i +a4*sin(alpha);
    
    D = (a2^2 + a3^2 - r3^2 - (z3 - d1)^2)/(2*a2*a3);
    
    % if(abs(D)>1)
    %     disp('position non atteignable')
    % else
    %     disp('position atteignable')
    % end
    
    q2 = pi/2 - acos(D) -11*pi/180;
    q2_deg = rad2deg(q2);
    
    r2 = r3 - a3*cos(q2);
    z2 = z3  +a3*sin(q2);
    
    q1 = atan2(r2 , z2) +11*pi/180;
    q1_deg = rad2deg(q1);
    
    q3 = q1 +alpha -q2 - pi/2;
    q3_deg = rad2deg(q3);
    
    % Paramètres export en PDF de la figure par rapport à l'écran
    savefig=1; %Générer des figures PDF? oui=1 , non~=1 
    interligne=0.8;
    sf=20; % Taille police
    scrsz = get(0,'ScreenSize');
    set(0,'DefaultFigurePosition',scrsz*1.5)
    set(0,'DefaultAxesFontSize', sf) 
    set(0,'DefaultTextFontname', 'Times New Roman')
    set(0,'DefaultTextFontSize', sf)  
    
    % Paramètres format de la forme
    
    width=2; %épaisseur de ligne
    color1=[1,0,0]; %couleur1
    color2=[1,1,0]; %couleur2
    color3=[0,0,1];
    color4=[0,1,1];
    color5=[0.5,1,1];
    color6=[0,0,0];
    
    
    A=[0,0]; % Point A
    B=[0,0.077]; % Point B défini en fonctoin de A. On ne définit qu'une fois les points (pas de copier coller inutiles)
    C=B+[a2*sin(q1),a2*cos(q1)];
    D=C+[0.024*cos(q1),-0.024*sin(q1)];
    E= [r3,z3];
    F = [r4,i];
    
    figure(1)
    clf
    
    axis([[-0.200,0.200], [0,0.700]]);
    % Set the dimensions of the figure window
    hold on
    plot([A(1), B(1)], [A(2), B(2)], 'b', 'LineWidth', 2);
    plot([B(1), C(1)], [B(2), C(2)], 'r', 'LineWidth', 2);
    plot([D(1), C(1)], [D(2), C(2)], 'r', 'LineWidth', 2);
    plot([D(1), E(1)], [D(2), E(2)], 'g', 'LineWidth', 2);
    plot([F(1), E(1)], [F(2), E(2)], 'c', 'LineWidth', 2);
    
    
    axis square;
    title('Tracé des segments');
    hold off
end


axis equal
grid on


set(gca, 'Color', 'none'); set(gcf, 'Color', 'w');
