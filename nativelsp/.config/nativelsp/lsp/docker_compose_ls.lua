return {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = { "yaml.docker-compose" },
    root_marker = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    settings = {
        yamlls = {
            path = "yaml-language-server",
        },
        single_file_support = true,
    },
}
