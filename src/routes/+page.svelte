<script lang="ts">
	import { request, gql } from 'graphql-request';
	import { onMount } from 'svelte';

    const customURL = import.meta.env.CUSTOM_API_URL;
    let url = "http://localhost:8000/graphql/";

    if (customURL) {
		console.log("Setting custom API url to: " + customURL);
		url = customURL;
	} else {
        console.log("Using standard URL");
    }

	const query = gql`
        {
            getUsers { name }
        }
  `;
    onMount(async () => {

        console.log(":o");
        const data = await request(url, query);
        console.log(data);
        wop = data;
    });

    let wop;
</script>

{JSON.stringify(wop)}
