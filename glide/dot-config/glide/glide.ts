// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!

glide.o.hint_size = "16px";

// Remove bindings that mess with “enter search”
glide.keymaps.del(["normal", "insert"], "<C-k>");
glide.keymaps.del(["normal", "insert"], "<C-j>");

// Tab management
glide.keymaps.set("normal", "<leader>tn", () => {
  glide.excmds.execute("tab_new");
});

glide.keymaps.set("normal", "<leader>ty", () => {
  glide.excmds.execute("tab_duplicate");
});

glide.keymaps.set("normal", "<leader>tc", () => {
  glide.excmds.execute("tab_close");
});

glide.keymaps.set("normal", "<leader>tp", () => {
  glide.excmds.execute("tab_pin_toggle");
});

glide.keymaps.set("normal", "[t", () => {
  glide.excmds.execute("tab_prev");
});

glide.keymaps.set("normal", "]t", () => {
  glide.excmds.execute("tab_next");
});

// Figma has its own extensive set of keymaps
glide.autocmds.create("UrlEnter", /figma\.com/, async () => {
  await glide.excmds.execute("mode_change ignore");

  return () => glide.excmds.execute("mode_change normal");
});
