<script lang="ts">
	import { request, gql } from 'graphql-request';
	import { onMount } from 'svelte';
	import { createEditor } from 'svelte-editorjs';

	const customURL = import.meta.env.CUSTOM_API_URL;
	let url = 'http://localhost:8000/graphql/';

	if (customURL) {
		console.log('Setting custom API url to: ' + customURL);
		url = customURL;
	} else {
		console.log('Using standard URL');
	}

	const query = gql`
		{
			getUsers {
				name
			}
		}
	`;

	let e: any;
	onMount(async () => {
		/*console.log(':o');
		const resp = await request(url, query);
		console.log(resp);
		wop = resp;*/

		const HeaderObj = await import('@editorjs/header');
		const DelimiterObj = await import('@editorjs/delimiter');
		const NestedListObj = await import('@editorjs/nested-list');
		const ImageObj = await import('@editorjs/image');
		const TooltipObj = await import('editorjs-tooltip');
		const TableObj = await import('@editorjs/table');

		const Header = HeaderObj.default;
		const Delimiter = DelimiterObj.default;
		const NestedList = NestedListObj.default;
		const Image = ImageObj.default;
		const Tooltip = TooltipObj.default;
		const Table = TableObj.default;

		const { editor, data, isReady } = createEditor({
			tools: {
				header: Header,
				delimiter: Delimiter,
				list: {
					class: NestedList,
					inlineToolbar: true,
					config: {
						defaultStyle: 'unordered'
					}
				},
				table: Table
				/*tooltip: {
					class: Tooltip,
					config: {
						location: 'left',
						highlightColor: '#FFEFD5',
						underline: true,
						backgroundColor: '#154360',
						textColor: '#FDFEFE',
						holder: 'editorId'
					}
				},
				image: {
					class: Image,
					config: {
						endpoints: {
							byFile: 'http://localhost:8008/uploadFile', // Your backend file uploader endpoint
							byUrl: 'http://localhost:8008/fetchUrl' // Your endpoint that provides uploading by Url
						}
					}
				}*/
			}
		});
		e = editor;
	});

	let wop;
</script>

{JSON.stringify(wop)}

{#if e}
	<div class="editor" use:e />
{/if}

<style>
	.editor {
		border: 2px solid #ccc;
	}
</style>
