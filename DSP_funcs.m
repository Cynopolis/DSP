classdef DSP_funcs
    methods(Static = true)
        function H = derivative(w)
            w(abs(w) > pi)=0;
            H = pi*w*100;
        end

        function yr = continuous(xn, T)
            test = 
        end
    end
end