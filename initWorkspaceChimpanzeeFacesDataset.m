function initWorkspaceChimpanzeeFacesDataset
% function initWorkspaceChimpanzeeFacesDataset
% 
% BRIEF
%   Add local subfolders and 3rd party libraries to Matlabs work space.
%
%   Exemplary call from external position:
%        CHIMPFACEDATASETDIR = '/place/to/this/repository/';
%        currentDir = pwd;
%        cd ( CHIMPFACEDATASETDIR );
%        initWorkspaceChimpanzeeFacesDataset;
%        cd ( currentDir );
%    
%   Provides s_path_to_chimp_face_datasets as global variable.
% 
%   Author: Alexander Freytag

    %% make path to this dataset known as global variable
    global s_path_to_chimp_face_datasets;
    s_path_to_chimp_face_datasets     = sprintf( '%s/', fullfile(pwd) );



    %% add paths which come with this repository
    
    % only add the path that provides loading functionalities
    b_recursive             = true; 
    b_overwrite             = true;
    s_pathLoad              = fullfile(pwd, 'demo_access_data');
    addPathSafely ( s_pathLoad, b_recursive, b_overwrite )
    clear ( 's_pathLoad' );    

  
end


function addPathSafely ( s_path, b_recursive, b_overwrite )
    if ( ~isempty(strfind(path, [s_path , pathsep])) )
        if ( b_overwrite )
            if ( b_recursive )
                rmpath( genpath( s_path ) );
            else
                rmpath( s_path );
            end
        else
            fprintf('initWSChimpanzeeFacesDataset - %s already in your path but overwriting de-activated.\n', s_path);
            return;
        end
    end
    
    if ( b_recursive )
        addpath( genpath( s_path ) );
    else
        addpath( s_path );
    end
end
