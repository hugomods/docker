const autoprefixer = require("/usr/local/lib/node_modules/autoprefixer");
const rtlcss = require("/usr/local/lib/node_modules/rtlcss");
// Support both CJS + ESM export shapes across postcss-purgecss versions.
const purgecssMod = require("/usr/local/lib/node_modules/@fullhuman/postcss-purgecss");
const purgecss = purgecssMod.default ?? purgecssMod.purgeCSSPlugin ?? purgecssMod;

module.exports = {
  plugins: [
    autoprefixer,
    purgecss({
      content: ["index.html"],
    }),
    rtlcss,
  ],
};
