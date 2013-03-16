at_node_1 = [506.37 126.59 56.26 31.65 20.25];
at_node_2 = [2320.48 580.12 257.83 145.03 92.82];
length = [100 200 300 400 500];
plot(length,at_node_1,'--b*','linewidth',2);
hold on
plot(length,at_node_2,':ro','linewidth',2);
hold off
%  polyfit(length,at_node_1,2)
xlabel('Length of the beam ');
ylabel('Variation of natural frequency');
title('Plot of Variation of natural frequency with Length of the Beam');
legend('Natural frequency variation at node 1','Natural frequency variation at node 2');