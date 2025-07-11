import { vitePlugin as remix } from "@remix-run/dev";
import { installGlobals } from "@remix-run/node";
import { defineConfig } from "vite";
import tsconfigPaths from "vite-tsconfig-paths";

installGlobals();

export default defineConfig({
	plugins: [remix(), tsconfigPaths()],
	server: {
		host: "0.0.0.0",
		port: 3000,
		watch: {
			usePolling: true,
			interval: 1000,
		},
	},
});
