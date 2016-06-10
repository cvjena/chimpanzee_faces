function myOut = getFieldWithDefault ( myStruct, myField, myDefault )
% function myOut = getFieldWithDefault ( myStruct, myField, myDefault )
% 
%  BRIEF:
%    Get the content of a named field of a struct if existing, or return a
%    specified default value instead
%    ...inspired by NICE::Config.gI ('section','name', default )
% 
%  INPUT:
%    myStruct  -- a struct
%    myField   -- string with desired field name
%    myDefault -- default value to use if field is non-existing or empty
% 
%  OUTPUT:
%    myOut     -- content of field or default value
% 
% 
% author: Alexander Freytag
% date  : 04-03-2014 ( dd-mm-yyyy )

    if ( ~isempty(myStruct) && isfield(myStruct, myField) && ~isempty( myStruct.( myField ) ))
        myOut = myStruct.( myField );
    else
        myOut = myDefault;
    end
end