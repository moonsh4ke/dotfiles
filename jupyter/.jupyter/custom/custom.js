require([
	'base/js/namespace',
	'codemirror/keymap/vim',
	'nbextensions/vim_binding/vim_binding'
], function(ns) {
	CodeMirror.Vim.defineEx("run", "r", function(cm){
        ns.keyboard_manager.actions.call('jupyter-notebook:run-cell');
	});
});
