return {
    "folke/tokyonight.nvim",
    lazy = false,  -- Set false agar tema langsung aktif saat startup
    priority = 1000,  -- Pastikan tema dimuat lebih dulu
    opts = {
        style = "night",  -- Pilihan lain: "night", "day", "moon"
        transparent = false,  -- Bisa diubah ke true jika ingin background transparan
    },
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = false,
        })
        vim.cmd("colorscheme tokyonight")  -- Aktifkan tema
    end
}
