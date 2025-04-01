return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml" },
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
    },
    single_file_support = true,
}
