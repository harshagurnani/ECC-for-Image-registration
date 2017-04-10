function [xyshift, bestimage, rho ] = MC_with_ECC( RawData, refs, varargin) 

%% Parsing optional arguments
iterations=[];
levels=[];
transform=[];
initwarp=[];
montage = [];

if nargin > 2  

    charctr=0;
    numctr=0;
    start_read_var = 3;
    while start_read_var <= nargin
        vn = start_read_var-2;
       if ischar( varargin{vn} )
           charctr=1;
           if strcmp(varargin{vn}, 'iters' )
               iterations = varargin{vn+1};
               start_read_var = start_read_var + 2;
           elseif strcmp(varargin{vn}, 'montage' )
               montage = varargin{vn+1};
               start_read_var = start_read_var + 2;
           elseif strcmp(varargin{vn}, 'levels' )
               levels = varargin{vn+1};
               start_read_var = start_read_var + 2; 
           elseif strcmp(varargin{vn}, 'transform' )
               transform = varargin{vn+1};
               start_read_var = start_read_var + 2;  
           elseif strcmp(varargin{vn}, 'initwarp' )
               initwarp = varargin{vn+1};
               start_read_var = start_read_var + 2;  
           else 
                error('Argument name %s is not an optional argument', varargin{vn})
           end
       else
           if charctr == 1
               error('Paired name-value cannot come before value arguments')
           end
           numctr = numctr+1;
           switch numctr
               case 1
                   iterations = varargin{vn};
                   start_read_var = start_read_var+1;
               case 2
                   levels = varargin{vn};
                   start_read_var = start_read_var+1;
               case 3
                   transform = varargin{vn};
                   start_read_var = start_read_var+1;
               case 4
                   initwarp = varargin{vn};
                   start_read_var = start_read_var+1;
               case 5
                   montage = varargin{vn};
                   start_read_var = start_read_var+1;
           end
       end
    end

end

if ~isempty(iterations)
    par.iterations = iterations;
else
    par.iterations = 20;
end

if ~isempty(levels)
    par.levels = levels;
else
    par.levels = 3;
end

if ~isempty(transform)
    par.transform = transform;
else
    par.transform = 'translation';
end

if isempty(montage)
    montage=true;
end

%-------------------------------------------------------------------------%

end