function dataset_chimpansees = load_chimpansees ( s_destData, settings )
% function dataset_chimpansees = load_chimpansees ( s_destData, settings )
% 
%  INPUT:
%  s_destData               - string, mandatory
%  settings                 - struct with optional boolean fields
%      .b_load_age          - default: true, requires s_destData/age_information.mat
%      .b_load_gender       - default: true, requires s_destData/gender_information.mat
%      .b_load_age_group    - default: true, requires s_destData/age_group_information.mat
%      .b_load_identity     - default: true, requires s_destData/identity_information.mat
%      .b_load_image_fns    - default: true, requires s_destData/filelist_face_images.txt
% 
% OUTPUT:
%     dataset_chimpansees   - struct with optional fields
%      .f_ages              - only if b_load_age, double vector     
%      .b_genders           - only if b_load_gender, boolean vector
%      .b_age_groups        - only if b_load_age_group, boolean vector    
%      .f_labels            - only if b_load_identity, double vector     
%      .s_all_datasets      - only if b_load_dataset_name, cell array of strings
%      .s_images            - only if b_load_image_fns, cell array of strings
%      .b_idxValid          - boolean vector

    
    if ( nargin < 1 )
        settings = [];
    end
    
    %% load previously curated data
    
    b_load_age                 = getFieldWithDefault ( settings, 'b_load_age',          true );
    b_load_gender              = getFieldWithDefault ( settings, 'b_load_gender',       true );
    b_load_age_group           = getFieldWithDefault ( settings, 'b_load_age_group',    true );
    b_load_identity            = getFieldWithDefault ( settings, 'b_load_identity',     true );
    b_load_image_fns           = getFieldWithDefault ( settings, 'b_load_image_fns',    true );   
    
    if ( b_load_age )
        ageInfo                = load( sprintf( '%sage_information.mat', s_destData ) );
    end
    
    if ( b_load_gender )    
        genderInfo             = load( sprintf( '%sgender_information.mat', s_destData ) );    
    end

    if ( b_load_age_group )    
        ageGroupInfo           = load( sprintf( '%sage_group_information.mat', s_destData ) );    
    end
    
    if ( b_load_identity )    
        identity_information   = load( sprintf( '%sidentity_information.mat', s_destData ) );    
    end
    

    if ( b_load_image_fns ) 
        % fileId value - open the file
        s_filelist = sprintf( '%sfilelist_face_images.txt', s_destData );
        fid = fopen( s_filelist );

        % reads data from open test file into cell array (%s -> read string)
        s_images = textscan(fid, '%s', 'Delimiter','\n');

        % get all images
        s_images = s_images{1};

        % clean-up - close file stream
        fclose ( fid );
        
        % note: filenames are given relative to the file list
        % hence, we adapt them to absolute paths here
        s_images = cellfun( @(s) sprintf( '%s%s', s_destData, s), s_images, 'UniformOutput', false);
    end
    
    %% sanity check
    b_validityChecks = {};

    if ( b_load_age )
        b_idxAgeValid               = ~isnan ( ageInfo.f_ages);
        b_validityChecks{end+1}     = b_idxAgeValid;
    end
        
    if ( b_load_gender )    
        b_validityChecks{end+1}     = true(size(genderInfo.b_is_gender_reliable));
    end
    
    if ( b_load_age_group )
        b_validityChecks{end+1}     = ageGroupInfo.b_is_age_group_reliable;        
    end
    
    if ( b_load_identity )
        b_validityChecks{end+1}     = identity_information.b_is_id_reliable;
    end
    
    b_idxValid = [];
    for idxValCheck = 1:length(b_validityChecks)
        if ( isempty ( b_idxValid ) )
            b_idxValid = b_validityChecks{idxValCheck};
        else
            b_idxValid = b_idxValid & b_validityChecks{idxValCheck};
        end
    end

    
    %% set output
    dataset_chimpansees  = [];
    
    if ( b_load_age )
        dataset_chimpansees.f_ages           = ageInfo.f_ages;        
    end    

    if ( b_load_gender )
        dataset_chimpansees.f_genders        = genderInfo.f_genders;  
        dataset_chimpansees.s_all_genders    = genderInfo.s_all_genders;  
        
    end    
    
    if ( b_load_age_group )
        dataset_chimpansees.s_possible_age_groups ...
                                             = ageGroupInfo.s_possible_age_groups;
        dataset_chimpansees.f_labels_age_groups  ...
                                             = ageGroupInfo.f_labels_age_groups;        
    end
    
    if ( b_load_identity )
        dataset_chimpansees.f_labels         = identity_information.f_labels;        
        dataset_chimpansees.s_all_identities = identity_information.s_all_identities;        
    end
    
    if ( b_load_image_fns )
        dataset_chimpansees.s_images         = s_images;
    end
     
    dataset_chimpansees.b_idxValid           = b_idxValid;  


end