classdef DSP_funcs
    methods(Static = true)
        function H = derivative(w)
            w(abs(w) > pi)=0;
            H = pi*w*100;
        end
        
        % this function was taken from Dr. Erol Kalkan, P.E.
        % (ekalkan@usgs.gov)
        % https://www.mathworks.com/matlabcentral/fileexchange/59027-time-domain-sinc-interpolation-resampling
        function yp = resampleSINC(y,m)
            %   TIME-DOMAIN SINC INTERPOLATION (RESAMPLING)
            %
            %   Syntax:    
            %       yp = resampleSINC(y, m)
            %
            %   Input: 
            %         y = input signal to be resampled to higher sampling rate (y must be a row vector)
            %
            %         m = resampling factor (e.g., if y is 100 sps and yp will be
            %                                    200 sps, then m is 200/100 = 2)
            %        yp = resampled signal
            %
            %   Example: Input is 15 Hz sinusoidal signal sampled at 200 sps. It will
            %   be resampled to 400 sps using time-domain sinc interpolation
            %
            %       n = 256;
            %       dt = 1/200;
            %       t = dt*(0:n-1);
            %       T = dt*n;
            %       y = sin(2*pi*15*t/T);
            %       m = 2;
            %       yp = resampleSINC(y,m);
            %       u = linspace(0,length(y),length(y));
            %       up = linspace(0,length(y),length(y)*m);
            %       plot(u,y,'-ob'); hold on; plot(up,yp,'-*r');
            u = linspace(1,length(y),length(y)*m); 
            x = linspace(1,length(y),length(y));
            for i=1:length(u)
                yp(i) = sum(y.*sinc(u(i) - x));           
            end
        end
    end
end