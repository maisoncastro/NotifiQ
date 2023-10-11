/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: "jit", // Enable JIT mode
  content: ["./app/components/**/*.{erb,html}", "./app/views/**/*.{erb,html}"],
  theme: {
    extend: {},
  },
  plugins: [],
};
