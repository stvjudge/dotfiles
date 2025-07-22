return {
    cmd = { "helm_ls", "serve" },
    filetypes = { "yaml.helm", "yml.helm" },
    root_markers = { "Chart.yaml", "Chat.yml", "values.yaml", "values.yml" },
    settings = {
        yamlls = {
            path = "yaml-language-server",
        },
    },
}
