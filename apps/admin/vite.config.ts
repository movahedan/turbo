import react from "@vitejs/plugin-react";
import { defineConfig } from "vite";

export default defineConfig({
	plugins: [react()],
	server: {
		host: "0.0.0.0",
		port: 80,
		watch: {
			usePolling: true,
			interval: 1000,
		},
	},
});
