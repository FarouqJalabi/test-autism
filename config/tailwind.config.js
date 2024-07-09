module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      padding: {
        '5p': '5%',
        '10p': '10%',
        '15p': '15%',
        '20p': '20%',
        '25p': '25%',
        '30p': '30%',
        '35p': '35%',
        '40p': '40%',
        '45p': '45%',
        '50p': '50%',
        '55p': '55%',
        '60p': '60%',
        '65p': '65%',
        '70p': '70%',
        '75p': '75%',
        '80p': '80%',
        '85p': '85%',
        '90p': '90%',
        '95p': '95%',
        '100p': '100%',
      },
    },
  },
  plugins: [
    require('daisyui'),
    // require('@tailwindcss/forms'),
    require('@tailwindcss/forms')({ strategy: 'class' }),

    require('@tailwindcss/typography'),
  ],
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/theming/themes")["light"],
          primary: "#1575D1",

        },
      },
    ],
  },
}
