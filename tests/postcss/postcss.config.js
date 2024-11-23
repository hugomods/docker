const autoprefixer = require('/usr/local/lib/node_modules/autoprefixer')
const rtlcss = require('/usr/local/lib/node_modules/rtlcss')
const purgecss = require('/usr/local/lib/node_modules/@fullhuman/postcss-purgecss').default

module.exports = {
  plugins: [
      autoprefixer,
      purgecss({
        content: ['index.html']
      }),
      rtlcss
  ]
}
