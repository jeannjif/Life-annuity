function [scr,m_d_BOF] = solvency(apv_nd,apv)
%apv_nd is from undifferenciation
% To calculate BE_t, note that "ce qui reste à recevoir" has 5000 values
% bcoz of different simulation
% apv is a list containing PV of future benefits outgo: "ce qui reste à
% payer en t". 
  capital = 1+0.005;
  actual = 1/(1+0.01);
  
  A_0 = mean(apv_nd);
  BE_0 =  apv(1,:)-0; % 10|a_50
  BOF_0 = A_0 - BE_0;
  
  A_1 = A_0.*capital;
  BE_1 = apv(2,:); % 9|a_51
  BOF_1 = A_1 - BE_1;
  % DELTA BOF
  m_d_BOF = BOF_0 - BOF_1./actual;
  m_d_BOF(m_d_BOF<0) = 0;
  
  scr = quantile(m_d_BOF,0.995);
  
end
