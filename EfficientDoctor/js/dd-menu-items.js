/**
 * @version 0.2
 */
(function() {
	'use strict';

	function DDMenuItems(ddMenu) {
		var that = this;

		this.ddMenu = ddMenu;
		this.stack = [];

		this.beforeOpen = function() {
			that.reset();

			// Push the initial menu to the stack.
			that.stack.push({
				menu: that.ddMenu.menuEl.querySelector('.dd-menu-items'),
				title: that.getTitle()
			});
		};

		this.maybeSubMenu = function(e) {
			if (e.target.nodeName == 'A') {
				that.maybeOpenSubmenu(e.target);
			}
		};

		this.prevMenu = function() {
			that.switchMenu('prev');
		};

		this.ddMenu.addListener('beforeOpen', this.beforeOpen);
		this.ddMenu.menuEl.addEventListener('click', this.maybeSubMenu, false);
		this.ddMenu.menuEl.querySelector('.dd-menu-prev').addEventListener('click', this.prevMenu, false);
	}

	DDMenuItems.prototype = {
		getTitle: function() {
			return this.ddMenu.menuEl.querySelector('.dd-menu-title').innerHTML;
		},

		setTitle: function(newTitle) {
			var titleEl = this.ddMenu.menuEl.querySelector('.dd-menu-title');

			titleEl.innerHTML = newTitle;
		},

		reset: function() {
			if (this.stack.length >= 2) {}

			this.stack = [];
		},

		startAnimation: function(currentMenu, nextMenu) {
			var that = this;
			var transitionEnd = this.ddMenu.helpers.transitionEnd;
			var helpers = this.ddMenu.helpers;

			if (transitionEnd) {
				currentMenu.addEventListener(transitionEnd, function() {
					this.style.display = 'none';
					helpers.removeClass(this, 'open');
					helpers.removeClass(this, 'close');
				}, false);
			}

			nextMenu.style.display = 'block';
			nextMenu.offsetWidth;

			requestAnimationFrame(function() {
				helpers.addClass(currentMenu, 'close');
				helpers.addClass(nextMenu, 'open');
			});
		},

		switchMenu: function(dir, menu, title) {
			var that = this;
			var transitionEnd = this.ddMenu.helpers.transitionEnd;
			var currentMenu;
			var prevMenu;
			var curLevel = this.stack.length;
			var helpers = this.ddMenu.helpers;

			if (dir == 'prev') {
				if (this.stack.length <= 1) {
					return;
				}

				currentMenu = this.stack.pop();
				prevMenu = this.stack[this.stack.length - 1];
				menu = prevMenu.menu;
				title = prevMenu.title;
			} else {
				currentMenu = this.stack[this.stack.length - 1];
				helpers.addClass(menu, 'next');

				this.stack.push({
					menu: menu,
					title: title
				});
			}

			if (title) {
				this.setTitle(title);
			}

			// Add the level-{1,2,3,...} class.
			this.ddMenu.helpers.removeClass(this.ddMenu.menuEl, 'level-' + curLevel);
			this.ddMenu.helpers.addClass(this.ddMenu.menuEl, 'level-' + this.stack.length);

			that.startAnimation(currentMenu.menu, menu);
		},

		maybeOpenSubmenu: function(link) {
			var submenuId = link.getAttribute('data-submenu');
			var submenu;

			if (!submenuId) {
				return;
			}

			submenu = document.getElementById(submenuId);

			this.switchMenu('next', submenu, link.innerHTML);
		}
	};

	window.DDMenuItems = DDMenuItems;
})();
