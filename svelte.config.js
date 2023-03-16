import adapter from "@sveltejs/adapter-node";
import preprocess from "svelte-preprocess";

/** @type {import('@sveltejs/kit').Config} */
const config = {
	// Consult https://kit.svelte.dev/docs/integrations#preprocessors
	// for more information about preprocessors
	preprocess: preprocess({
		replace: [
			["import.meta.env.CUSTOM_API_URL", JSON.stringify(process.env.APP_ENV)],
		]
	}),

	kit: {
		adapter: adapter()
	}
};

export default config;
