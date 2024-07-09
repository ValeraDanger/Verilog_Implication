module implic_tb;

    logic a, b, c_impl, c_ex_impl;

    const logic [0:3] AParams = 4'b0011;
    const logic [0:3] BParams = 4'b0101;

    const logic [0:3] CImplExpected = 4'b1101;
    const logic [0:3] CExImplExpected = 4'b0010;     

    implic impl (
        .a(a),
        .b(b),
        .c(c_impl)
    );

    ex_implic ex_impl (
        .a(a),
        .b(b),
        .c(c_ex_impl)
    );

    initial
    begin
        for (int i = 0; i < 4; i++)
        begin
            a = AParams[i];
            b = BParams[i];
            #10;


            assert(CImplExpected[i] == c_impl)
                $display("%b -> %b = %b",
                    a, b, c_impl);
            else 
            begin
                $display({"Ошибка: %b -> %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, c_impl, CImplExpected[i]);

                $fatal;
            end


            assert(CExImplExpected[i] == c_ex_impl)
                $display("~(%b -> %b) = %b\n",
                    a, b, c_ex_impl);
            else 
            begin
                $display({"Ошибка: %b -> %b \n", 
                            "Получено: %b \n",
                            "Ожидаемо: %b"},
                    a, b, c_ex_impl, CExImplExpected[i]);

                $fatal;
            end
        end
    end
endmodule