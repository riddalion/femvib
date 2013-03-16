at_node_1 = [10.13 20.25 30.38 40.51 50.64];
at_node_2 = [46.41 92.82 139.23 185.64 232.05];
depth = [5 10 15 20 25];
plot(depth,at_node_1,'--b*','linewidth',2);
hold on
plot(depth,at_node_2,':ro','linewidth',2);
xlabel('Depth of the beam ');
ylabel('Variation of natural frequency');
title('Plot of Variation of natural frequency with Depth of the Beam');
legend('Natural frequency variation at node 1','Natural frequency variation at node 2');
hold off