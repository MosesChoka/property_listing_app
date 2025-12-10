// config/tailwind.config.js
module.exports = {
    content: [
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.html.erb',
        './app/components/**/*.html.erb',
    ],
    theme: {
        extend: {},
    },
    plugins: [],
}