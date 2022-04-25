function qsm(type, path_mag, path_ph, path_out, opts)
    % This function allows you to specify the type of qsm method you
    % would like to execute. 
    % Inputs
    % type: The name of the qsm function type to be used.
    % path_mag: The path to the magnetism dicom files.
    % path_ph: The path to the  phase dicom files.
    % path_out: The path to output the processed files.
    % opts: A JSON formatted string of options to be used for the function.
    
    % Checking for opts variable
    if exist('opts', 'var')
        options = jsondecode(opts);
        disp("Using provided options");
        disp(options);
    else
        disp("Using default options");
    end
    
    
    % Setting up default options.
    if ~ exist('options','var') || isempty(options)
        options = [];
    end
    
    % Running methods for Siemens 3T
    if type == "qsm_r2s_prisma" && exist('qsm_r2s_prisma', 'file')
        qsm_r2s_prisma(path_mag, path_ph, path_out, options)
    elseif type == "qsm_swi_prisma" && exist('qsm_swi_prisma', 'file')
        qsm_swi_prisma(path_mag, path_ph, path_out, options)
    elseif type == "qsm_hemo_prisma" && exist('qsm_hemo_prisma', 'file')
        qsm_hemo_prisma(path_mag, path_ph, path_out, options)
    elseif type == "qsm_hemo_prisma" && exist('qsm_epi_prisma', 'file')
        qsm_epi_prisma(path_mag, path_ph, path_out, options)
    else
        error("No QSM method was found");
    end    
end

