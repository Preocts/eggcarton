function RunFormatCommand()
    local filetype = vim.bo.filetype
    local filename = vim.api.nvim_buf_get_name(0)

    if filetype == "python" then
        print("Running black")
        vim.cmd("silent w")
        vim.cmd("silent !black " .. filename)

    else
        print("No format command for filetype: " .. filetype)

    end
end
