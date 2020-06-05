function F = cfit2mfile(cfobj,FName)
%CFIT2MFILE Converts a cfit object to a MATLAB file.
%   CFIT2MFILE(cfobj,fname) converts the cfit object cfobj to a MATLAB file 
%   defined in fname.
%
%   F = CFIT2MFILE(cfobj,fname) returns a function handle in F.
%
%   Example:
%       load census
%       [fit1,gof1,out1] = fit(cdate,pop,'poly2');
%       F = cfit2mfile(fit1,'censusfitfcn')
[fdir fname fext] = fileparts(FName);
if ~strcmp(fext,'m')
      FName = [fdir fname '.m'];
end
body = [];
header = ['function X = ' fname '('];
func = ['X = ' formula(cfobj) ';'];
args = argnames(cfobj);
for n = 1:length(args)
      try
          v = getfield(cfobj,args{n});
          body = [body args{n} ' = ' num2str(v) '; '];
      catch
          header = [header args{n} ','];
      end
end
header(end) =')';
[fID,message] = fopen(FName,'w');
if fID~=1
      fprintf(fID,'%s\n%s\n%s',header,body,func);
      fclose(fID);
      clear(FName);
      if nargout>0
          F = str2func(fname);
      end
else
      error(message)
end