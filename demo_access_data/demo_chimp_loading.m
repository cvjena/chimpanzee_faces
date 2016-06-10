function demo_chimp_loading 
% 
% BRIEF
%  show hot to load provided data for both chimpanzee datasets
% 

    % CZoo or CTai?
    % true  -> use CZoo
    % false -> use CTai
    b_zoo_but_not_tai = true;

    %
    % set the folder which contains the data we sent in february
    % requires the *_information.mat and filelist_face_images.txt
    %
    s_dest_current   = pwd();
    idx_pos_of_slash = strfind( s_dest_current, '/' );
    s_dest_root      = s_dest_current( 1:(idx_pos_of_slash(end)-1) );
    if ( b_zoo_but_not_tai )
        s_destData       = sprintf( '%s/datasets_cropped_chimpanzee_faces/data_CZoo/', s_dest_root );
    else
        s_destData       = sprintf( '%s/datasets_cropped_chimpanzee_faces/data_CTai/', s_dest_root );
    end

    settingsLoad.b_load_age          = true;
    settingsLoad.b_load_gender       = true;
    settingsLoad.b_load_age_group    = true;
    settingsLoad.b_load_identity     = true;
    dataset_chimpansees              = load_chimpansees( s_destData, settingsLoad );

    dataset_splits = {};
    if ( b_zoo_but_not_tai )
        s_destSplits   = './dataset_splits_CZoo.mat';
    else
        s_destSplits   = './dataset_splits_CTai.mat';
    end

    load ( s_destSplits,  'dataset_splits' );

    % loop over all 5 runs
    i_numRuns = length(dataset_splits);
    for run=1:i_numRuns

        datasplits = dataset_splits{run};
        idxTrain = datasplits.idxTrain;
        idxTest  = datasplits.idxTest;        

        % these are the file names to the cropped images, i.e., they only
        % contain bounding boxes of the ape's faces
        % see mail of beginning of feb.
        s_fn_images_train = dataset_chimpansees.s_images( idxTrain );
        s_fn_images_test  = dataset_chimpansees.s_images( idxTest );

        % and here are labels for the identities. The corresponding names as
        % strings are accessible via  dataset_chimpansees.s_all_identities
        f_labels_train    = dataset_chimpansees.f_labels( idxTrain );
        f_labels_test     = dataset_chimpansees.f_labels( idxTest );
        %
        % note: all classes have at least 4 examples during training and 1 during
        % testing


        % do some evaluations here...
        % part 1 - train model
        %    using s_fn_images_train
        %
        % parr 2 - evalute model
        %    using s_fn_images_test

        % for demonstration purpose: display first image of train and test
        hfig = figure;
        imshow ( imread ( s_fn_images_train{1} ) );
        set ( hfig, 'Name', sprintf(' Run %d -- 1st Train Image', run) ,'NumberTitle','off');
        pause;

        imshow ( imread ( s_fn_images_test{1} ) );
        % display image name at the top of the window
        set ( hfig, 'Name', sprintf(' Run %d -- 1st Test Image', run) ,'NumberTitle','off');
        drawnow 

        pause;    
        close( hfig );

    end

end