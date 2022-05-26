    figure(i)
    plot(x_by_c_lower,Cp_lower,"-or");
    hold on;
    plot(x_by_c_upper,Cp_upper,"-xb");
    xlabel("x/c -->");
    ylabel("C_p -->");
    title("C_p vs x/c for \alpha ="+ num2str(AoA(i,1)) +"\circ");
    legend("C_p lower Surface", "C_p upper Surface");