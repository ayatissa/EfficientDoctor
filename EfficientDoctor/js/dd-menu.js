/**
 * DDMenu
 *
 * @version 0.2
 *
 * Released under the MIT license (https://tldrlegal.com/license/mit-license)
 */
(function() {
	'use strict';

	var helpers = {
		hasClass: function(el, className) {
			var regexp = new RegExp('(^|\\s+)' + className + '(\\s+|$)');

			return regexp.test(el.className);
		},

		addClass: function(el, className) {
			if (!this.hasClass(el, className)) {
				el.className = el.className ? [el.className, className].join(' ') : className;
			}
		},

		removeClass: function(el, className) {
			var finalClassName = el.className, regexp, i;

			var classNames = className.split(' ');

			for (i = 0; i < classNames.length; i++) {
				if (this.hasClass(el, classNames[i])) {
					regexp = new RegExp('(^|\\s+)' + classNames[i] + '(\\s+|$)');

					finalClassName = finalClassName.replace(regexp, ' ');
				}
			}

			el.className = finalClassName;
		},

		extend: function(to, from) {
			for (var item in from) {
				if (from.hasOwnProperty(item)) {
					to[item] = from[item];
				}
			}
		},

		getBrowserEventName: function(eventNames) {
			var element = document.createElement('ddmenu'),
				name = '';

			for (name in eventNames) {
				if (element.style[name] !== undefined) {
					return eventNames[name];
				}
			}

			return false;
		}
	};

	helpers.transitionEnd = (function() {
		return helpers.getBrowserEventName({
			WebkitTransition: 'webkitTransitionEnd',
			MozTransition: 'transitionend',
			OTransition: 'oTransitionEnd otransitionend',
			transition: 'transitionend'
		});
	})();

	helpers.animationEnd = (function() {
		return helpers.getBrowserEventName({
			WebkitAnimation: 'webkitAnimationEnd',
			MozAnimation: 'animationend',
			OAnimation: 'oAnimationEnd oanimationend',
			animation: 'animationend'
		});
	})();

	/**
	 * DDMenu.
	 *
	 * @constructor
	 */
	function DDMenu(menuEl, options) {
		var that = this;

		this.menuEl = menuEl;
		this.opt = options;
		this.buttonEl = document.querySelector(menuEl.getAttribute('data-button'));
		this.overlay = null;

		//******
		this.helpers = helpers;
		//******

		this.listeners = {};

		this.afterOpenCallback = function() {
			if (that.helpers.transitionEnd) {
				that.menuEl.removeEventListener(that.helpers.transitionEnd, that.afterOpenCallback, false);
			}

			that.dispatchEvent('afterOpen');
		};

		if (this.buttonEl) {
			this.buttonEl.addEventListener('click', function(e) {
				e.preventDefault();

				that.open();
			}, false);
		}

		this.setupCloseButton();
	}

	DDMenu.prototype = {
		addListener: function(eventName, listener) {
			if (!this.listeners[eventName]) {
				this.listeners[eventName] = [];
			}

			this.listeners[eventName].push(listener);
		},

		removeListener: function(eventName, listener) {
			var listeners, i;

			if (!this.listeners[eventName]) {
				return;
			}

			listeners = this.listeners[eventName];

			for (i = 0; i < listeners.length; i++) {
				if (listeners[i] === listener) {
					listeners.splice(i, 1);
					break;
				}
			}
		},

		dispatchEvent: function(eventName) {
			var listeners, i;

			if (!this.listeners[eventName]) {
				return;
			}

			listeners = this.listeners[eventName];

			for (i = 0; i < listeners.length; i++) {
				listeners[i].apply(this);
			}
		},

		addOverlay: function() {
			var that = this;

			if (!this.overlay) {
				this.overlay = document.createElement('div');
				this.overlay.setAttribute('id', 'dd-menu-overlay');
				document.body.appendChild(this.overlay);

				this.overlay.addEventListener('click', function(e) {
					e.preventDefault();
					that.close();
				}, false);
			}

			this.overlay.style.display = 'block';
			this.overlay.offsetWidth;

			this.helpers.addClass(this.overlay, 'open');
		},

		removeOverlay: function() {
			var that = this;
			var complete = function() {
				if (that.helpers.transitionEnd) {
					that.overlay.removeEventListener(that.helpers.transitionEnd, complete);
				}

				that.overlay.style.display = 'none';
			};

			if (this.helpers.transitionEnd) {
				this.overlay.addEventListener(this.helpers.transitionEnd, complete);
			} else {
				complete();
			}

			this.overlay.classList.remove('open');
		},

		/**
		 * Open.
		 */
		open: function() {
			this.addOverlay();

			switch (this.opt.effect) {
				case 'slideFromLeft':
					this.slideFrom('left');
					break;

				case 'slideFromRight':
					this.slideFrom('right');
					break;
			}
		},

		/**
		 * Setup the menu "close" button.
		 */
		setupCloseButton: function() {
			var that = this;

			this.menuEl.addEventListener('click', function(e) {
				if (e.target && e.target.className.search('dd-menu-close') === -1) {
					return;
				}

				that.close();
			}, false);
		},

		/**
		 * Slide the menu in.
		 *
		 * @param {String} from Either left or right.
		 */
		slideFrom: function(from) {
			var width,
				transform,
				opacity,
				that = this;

			this.helpers.addClass(this.menuEl, 'ddm-before-open');

			width = this.menuEl.offsetWidth;

			if (from === 'left') {
				this.helpers.addClass(this.menuEl, 'ddm-left');
			} else {
				this.helpers.addClass(this.menuEl, 'ddm-right');
			}

			this.dispatchEvent('beforeOpen');

			if (this.helpers.transitionEnd) {
				this.menuEl.addEventListener(this.helpers.transitionEnd, this.afterOpenCallback, false);
			}

			requestAnimationFrame(function() {
				that.helpers.addClass(that.menuEl, 'open');

				if (!that.helpers.transitionEnd) {
					that.afterOpenCallback();
				}
			});
		},

		/**
		 * Close the menu.
		 */
		close: function() {
			var that = this;

			var complete = function() {
				this.removeEventListener(that.helpers.transitionEnd, complete, false);

				that.helpers.removeClass(that.menuEl, 'open close ddm-left ddm-right ddm-before-open');
			};

			this.menuEl.addEventListener(this.helpers.transitionEnd, complete, false);

			this.helpers.addClass(this.menuEl, 'close');

			this.removeOverlay();
		}
	};

	window.getDDMenu = function(menuEl, customOptions) {
		var item;
		var options = {
			effect: 'slideFromRight'
		};

		if (!customOptions) {
			customOptions = {};
		}

		// Override default options.
		helpers.extend(options, customOptions);

		return new DDMenu(menuEl, options);
	};
})();
