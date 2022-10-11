classdef DSP_funcs
    methods(Static = true)
        function H = derivative(w)
            w(abs(w) > pi)=0;
            H = pi*w*100;
        end
    end
end