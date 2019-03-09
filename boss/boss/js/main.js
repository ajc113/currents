/* ================================================
----------- Boss ---------- */
(function ($) {
	"use strict";
	var Boss = {
		initialised: false,
		mobile: false,
		container : $('#portfolio-item-container'),
		blogContainer: $('#blog-item-container'),
		portfolioElAnimation: true,
		init: function () {

			if(!this.initialised) {
				this.initialised = true;
			} else {
				return;
			}

			// Call Boss Functions
			this.queryLoad();
			this.checkMobile();
			this.pageHeaderTitleAlign();
			this.menuHover();
			this.stickyMenu();
			this.mobileMenuDropdownFix();
			this.navbarBtnClassToggle();
			this.headerSearchFormFix();
			this.headerSearchFormClose();
			this.toggleBtn();
			this.toggleOverlayClick();
			this.fullHeight();
			this.sideMenuCollapse();
			this.ratings();
			this.collapseArrows();
			this.scrollToTopAnimation();
			this.scrollToClass();
			this.menuOnClick();
			this.productZoomImage();
			this.filterColorBg();
			this.selectBox();
			this.boostrapSpinner();
			this.dateTimePicker();
			this.tooltip();
			this.popover();
			this.servicesHover();
			this.countTo();
			this.progressBars();
			this.registerKnob();
			this.flickerFeed();
			this.attachBg();
			this.parallax();
			this.twitterFeed();
			this.tabLavaHover();
			this.videoBg();

			/* Call function if Owl Carousel plugin is included */
			if ( $.fn.owlCarousel ) {
				this.owlCarousels();
			}

			/* Call function if Magnific Popup plugin is included */
			if ( $.fn.magnificPopup) {
				this.newsletterPopup();
				this.lightBox();
			}

			/* Call function if Media element plugin is included */
			if ($.fn.mediaelementplayer) {
				this.mediaElement();
			}

			/* Call function if Media noUiSlider plugin is included */
			if ($.fn.noUiSlider) {
				this.priceSlider();
			}

			var self = this;
			/* Imagesloaded plugin included in isotope.pkgd.min.js */
			/* Portfolio isotope + Blog masonry with images loaded plugin */
			if (typeof imagesLoaded === 'function') {
				/* */
				imagesLoaded(self.container, function() {
					self.isotopeActivate();
					// recall for plugin support
					self.isotopeFilter();

					self.infiniteScroll( $('#portfolio-item-container') , '.portfolio-item');
				});

				/* check images for blog masonry/grid */
				imagesLoaded(self.blogContainer, function() {
					self.blogMasonry();
					self.infiniteScroll( $('#blog-item-container') , '.entry' );
				});
			}

		},
		queryLoad: function () {
			var self = this;
			if ($.fn.queryLoader2) {
				$("body").queryLoader2({
					barColor: "#2a2a2a",
					backgroundColor: "rgba(255, 255, 255, 0.1)",
					percentage: true,
					barHeight: 2,
					minimumTime: 400,
					fadeOutTime:200,
					onComplete: function() {
						/* fadeout then remove loader*/
						/* You can change width-height to achieve different animations after load*/
	                    $(".boss-loader-overlay").fadeOut(400, function() {
	                       $(this).remove();
	                    });

	                    /* Trigger Scroll Animations - Call wow plugin */
						self.scrollAnimations();
                	}
				});
			}
		},
		checkMobile: function () {
			/* Mobile Detect*/
			if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
				this.mobile = true;
			} else {
				this.mobile = false;
			}
		},
		navbarBtnClassToggle: function () {
			$('#main-navbar-container').on('show.bs.collapse hide.bs.collapse', function (e) {
				$('.navbar-toggle').toggleClass('opened');
			});
		},
		toggleBtn: function () {
			var self = this;
			$('.btn-toggle').on('click', function (e) {
				$(this).toggleClass('opened');

				if ($(this).hasClass('side-menu-btn')) {
					self.toggleClassSideMenu();
				}
				e.preventDefault();
			});
		},
		toggleOverlayClick:function () {
			var self = this;
			$('.boss-menu-overlay').on('click', function (e) {
				$('.side-menu, .btn-toggle.side-menu-btn').toggleClass('opened');
				e.preventDefault();
			});
		},
		toggleClassSideMenu: function () {
			$('.side-menu').toggleClass('opened');
		},
		fullHeight: function () {
			$('.fullheight').each(function () {
				var winHeight = $(window).height();

				$(this).css('height', winHeight);
			});
		},
		pageHeaderTitleAlign: function () {
			/* Vertical align duo to absolute header*/
			if ($('.page-header-welcome.fullheight')) {
				var winHeight = $(window).height(),
					navbarHeight = $('#header').find('.navbar').outerHeight(),
					titleHeight = $('.page-header-welcome.fullheight').find('h1').height(),
					addTopSpace = ( winHeight - ( navbarHeight + titleHeight + 150 ) ) / 2;
				$('.page-header-welcome.fullheight').find('h1').css('padding-top', addTopSpace);
			}
		},
		menuHover: function () {
			if (Modernizr.mq('only all and (min-width: 768px)') && !Modernizr.touch) {
				if ($.fn.hoverIntent) {
					$('#header').find('.navbar-nav').hoverIntent({
						over: function() {
							var  $this = $(this);
							if($this.find('ul, div').length) {
								$this.addClass('open');
								$this.find('.dropdown-toggle').addClass('disabled');
							}
						},
						out: function() {
							var  $this = $(this);
							if($this.hasClass('open')) {
								$this.removeClass('open');
								$this.find('.dropdown-toggle').removeClass('disabled');
							}
						},
						selector: 'li',
						timeout: 145,
						interval: 55
					});
				}
			}
		},
		mobileMenuDropdownFix : function () {
			if (Modernizr.mq('only all and (max-width: 767px)') || Modernizr.touch) {
				$('.navbar-nav').find('.dropdown-toggle').on('click', function (e) {
					var parent = $(this).closest('li');
	                // close all the siblings and their children
	                parent.siblings().removeClass('open').find('li').removeClass('open');
	                // open which one is clicked
	                parent.toggleClass('open');

	                // prevent
	                e.preventDefault();
	                e.stopPropagation();
				});
			}
		},
		stickyMenu: function () {
			// Stickymenu with waypoint and waypoint sticky plugins
			if ($.fn.waypoint && $(window).width() >= 992) {
				$('.sticky-menu').waypoint('sticky', {
					stuckClass:'fixed',
					offset: -300
				});
			}
		},
		destroyStickyMenu: function () {
			// Destroy Stickymenu for smaller devices
			if($.fn.waypoint && $(window).width() <= 991) {
				$('.sticky-menu').waypoint('unsticky');
			}
		},
		headerSearchFormFix: function () {
			// Fix for header search form when fixed menu is active
			$("[data-target='#header-search-form']").on('click', function(e) {
		        if($('.sticky-menu').hasClass('fixed')) {
		        	$('#header-search-form').toggleClass('fixed')
		        }

		        e.preventDefault();
			});
		},
		headerSearchScrollFix: function () {
			// If header search forn oppen on fixed menu fix when fixed header is over
			if ($('#header-search-form').hasClass('fixed')) {
				var winTop = $(window).scrollTop();

				if (winTop <= 300) {
					$('#header-search-form').removeClass('fixed');
				}
			}
		},
		headerSearchFormClose: function () {
			// Close searh form when document is clicked
			$('body').on('click', function(e) {
			    if ($('#header-search-form').hasClass('in') && !$(e.target).closest('#header-search-form').length) {
			        $('#header-search-form').collapse('hide').removeClass('fixed');

			        e.preventDefault();
			    }
			});
		},
		sideMenuCollapse: function () {
			$('.side-menu').find('.navbar-nav').find('a').on('click', function(e) {

				if ($(this).siblings('ul').length) {
					$(this).siblings('ul').slideToggle(400, function () {
						$(this).closest('li').toggleClass('open');
					});
					e.preventDefault();
				} else {
					return;
				}

			});
		},
		sideMenuScrollbar: function () {
			/* Side Menu Custom Scrollbar  with slimscroll plugin */
			if ($.fn.niceScroll) {

				var sideMenu = $('.side-menu'),
					bgColor;

				/* change rail color via sie menu coloring */
				if( sideMenu.hasClass('navbar-default') ) {
					bgColor = '#7a7a7a';
				} else if ( sideMenu.hasClass('navbar-inverse')) {
					bgColor = '#9a9a9a';
				} else {
					bgColor = '#505050';
				}

				/* if data-railalign attribute is set change rail align duo to it's value */
				if (sideMenu.data('railalign')) {
					var alignRail = sideMenu.data('railalign');
				}

				$('.side-menu-wrapper').niceScroll({
					zindex: 9999,
					autohidemode: true,
					background: 'rgba(0,0,0, 0.03)' ,
					cursorcolor: bgColor,
					cursorwidth: '6px',
					cursorborder: '1px solid transparent',
					cursorborderradius: '4px',
					railalign: alignRail
				});
			}
		},
		collapseArrows : function () {
			// Sidebar category collapse (category.html )
			$('.category-widget-btn').on('click', function (e) {
				var $this = $(this),
					parent= $this.closest('li');

				if (parent.hasClass('open')) {
					parent.find('ul').slideUp(400, function() {
						parent.removeClass('open');
					});
				} else {
					parent.find('ul').slideDown(400, function() {
						parent.addClass('open');
					});
				}
				e.preventDefault();
			});
		},
		twitterFeed: function () {
			/* Twitter Feeds require jquery.tweet.min.js file and twitter api */
			if ($.fn.tweet && $('.twitter-feed-widget').length) {
				/* Twitter feed for user*/
		        $('.twitter-feed-widget').tweet({
		            modpath: './js/twitter/',
		            avatar_size: '',
					count: 3,
					username: 'eonythemes', // write your username here
					loading_text:  'searching twitter...',
		            join_text: '',
		            retweets: false,
		            template: '<div class="twitter-icon"><i class="fa fa-twitter"></i></div><div class="tweet-content">{text}{time}</div>'
		            /* etc... */
		        });
		    }
		},
		tabLavaHover: function () {
			/* Require jquery.lavalamp.min.js file */
			/* Hover Animation which is used for tabs ( checkout elements-tabs.html page to see ) */
			if ($.fn.lavalamp) {
				$('.nav-tabs-lava').lavalamp({
					setOnClick: true,
					duration: 500,
					autoUpdate: true
				});

				$('.nav-tabs-border').lavalamp({
					setOnClick: true,
					duration: 300,
					autoUpdate: true
				});
			}
		},
		ratings : function () {
			/* Calculate Ratings % and set width */
			$.each($('.ratings-result'), function () {
				var $this = $(this),
					parentWidth = $this.closest('.ratings').width(),
					rating = $(this).data('result'),
					newWidth = (parentWidth / 100) * rating;
					
				$(this).css('width', newWidth);
			});
		},
		owlCarousels: function () {
			var self = this;

			/* index25.html -  Shop Arrivals Carousel */
			$('.owl-carousel.shop-arrivals-carousel-sm').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					}
				}
	        });

	        /* index25.html -  Shop Popular Carousel */
			$('.owl-carousel.shop-popular-carousel-lg').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });

	        /* index26.html -  Shop Treding Carousel */
			$('.owl-carousel.shop-trend-carousel-lg').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });

			/* index26.html -  Shop Blog Carousel */
			$('.owl-carousel.shop-blog-carousel-lg').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });

			/* index27.html -  Latest Products */
			$('.owl-carousel.shop-latest-carousel').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

	        /* index27.html -  Popular Products */
			$('.owl-carousel.shop-popular-carousel').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

	        /* index28.html -  Latest Products */
			$('.owl-carousel.shop-latest-carousel-sm').owlCarousel({
	            loop:false,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });

	        /* index28.html -  Popular Products */
			$('.owl-carousel.shop-popular-carousel-sm').owlCarousel({
	            loop:false,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });


			/* index9.html - Clients Carousel */
			$('.owl-carousel.team-carousel-index9').owlCarousel({
				loop:false,
				margin:25,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768:{
						items:3
					},
					992:{
						items:4
					}
				}
			});

			/* index9.html - Clients Carousel */
			$('.owl-carousel.our-clients-smaller').owlCarousel({
				loop:false,
				margin:10,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: true,
				responsive:{
					0:{
						items:2
					},
					480: {
						items:3
					},
					768:{
						items:4
					},
					992:{
						items:3
					},
					1200:{
						items:3
					}
				}
			});


			/* index12.html - Portfolio Carousel */
			$('.owl-carousel.portfolio-showcase-carousel').owlCarousel({
				loop:false,
				margin:0,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768:{
						items:3
					},
					992:{
						items:4
					},
					1500: {
						items:5
					}

				}
			});

			/* index12.html - Clients Carousel */
			$('.owl-carousel.our-clients-small').owlCarousel({
				loop:false,
				margin:10,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: false,
				responsive:{
					0:{
						items:2
					},
					480: {
						items:3
					},
					768:{
						items:4
					},
					992:{
						items:3
					},
					1200:{
						items:3
					}
				}
			});

			/* index6.html - Blog Post Carousel */
			$('.owl-carousel.home-blogposts-carousel').owlCarousel({
	            loop:true,
				margin:15,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 15000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:2
					},
					992: {
						items:3
					}
				}
	        });

			/* index6.html - Clients Carousel */
			$('.owl-carousel.home-clients-carousel').owlCarousel({
				loop:true,
				margin:10,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 8000,
				responsive:{
					0:{
						items:2
					},
					480: {
						items:3
					},
					768:{
						items:4
					},
					992:{
						items:3
					}
				}
			});

			/* index6.html - Team member Carousel */
			$('.owl-carousel.home-team-carousel').owlCarousel({
	            loop:true,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

			/* index5.html - Clients Carousel */
			$('.owl-carousel.our-clients').owlCarousel({
				loop:false,
				margin:10,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-long-arrow-left">', '<i class="fa fa-long-arrow-right">'],
				dots: false,
				responsive:{
					0:{
						items:2
					},
					480: {
						items:3
					},
					768:{
						items:4
					},
					992:{
						items:5
					},
					1200:{
						items:6
					}
				}
			});

			/* index24.html - Home blog Carousel */
			$('.owl-carousel.magazine-top-carousel-lg').owlCarousel({
	            loop:true,
				margin:0,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 12000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					},
					1200: {
						items:4
					}
				}
	        });

			/* index23.html - Home blog Carousel */
			$('.owl-carousel.magazine-top-carousel').owlCarousel({
	            loop:true,
				margin:0,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: true,
				autoplay: true,
				autoplayTimeout: 12000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					}
				}
	        });

	        /* index23.html - Popular Posts */
			$('.owl-carousel.mpopular-posts').owlCarousel({
	            loop:true,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					}
				}
	        });

	        /* index23.html - Don't Midd Posts */
			$('.owl-carousel.mdontmiss-posts').owlCarousel({
	            loop:true,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 13000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					}
				}
	        });

	        /* index23.html - Bigger Carousel */
			$('.owl-carousel.mbigger-posts').owlCarousel({
	            loop:true,
				margin:0,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 15000,
				items:1
	        });

	        /* index23.html - Most Rated Posts */
			$('.owl-carousel.mmostrated-posts').owlCarousel({
	            loop:true,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 13000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					}
				}
	        });



			/* index21.html - Home blog Carousel */
			$('.owl-carousel.home-blog-carousel').owlCarousel({
	            loop:true,
				margin:0,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: true,
				autoplay: true,
				autoplayTimeout: 12000,
				responsive:{
					0:{
						items:1
					},
					600: {
						items:2
					},
					992: {
						items:3
					},
					1500: {
						items:4
					}
				}
	        });

			/* Aboutus.html - Team member Carousel */
			$('.owl-carousel.team-member-carousel').owlCarousel({
	            loop:false,
				margin:25,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

	        /* index34.html - Team member Carousel */
			$('.owl-carousel.team-member-carousel-sm').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					}
				}
	        });

	        /* Aboutus.html - About Us Slider */
			$('.owl-carousel.aboutus-slider').owlCarousel({
	            loop:false,
				margin:0,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: true,
				items:1
	        });

	        /* Aboutus2.html - About Us Carousel */
			$('.owl-carousel.aboutus-carousel').owlCarousel({
	            loop:true,
				margin:0,
				stagePadding: 50,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					992: {
						items:3,
						stagePadding: 100
					}
				}
	        });

	        /* Testimonials3.html - Testimonial Slider */
			$('.owl-carousel.testimonial-slider').owlCarousel({
	            loop:false,
				margin:0,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: true,
				items:1
	        });

	        /* Aboutme2.html - Testimonial Carousel */
			$('.owl-carousel.testimonial-carousel').owlCarousel({
	            loop:true,
				margin:10,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 9000,
				responsive:{
					0:{
						items:1
					},
					992: {
						items:2
					}
				}
	        });

	        /* Aboutme3.html - Testimonial Carousel */
			$('.owl-carousel.testimonial-carousel2').owlCarousel({
	            loop:true,
				margin:10,
				responsiveClass:true,
				nav:false,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: true,
				autoplay: true,
				autoplayTimeout: 9000,
				responsive:{
					0:{
						items:1
					},
					992: {
						items:2
					}
				}
	        });

			/* Product.html -  Product carousel to zoom product section */
			$('.owl-carousel.product-gallery-lg').owlCarousel({
	            loop:false,
				margin:6,
				responsiveClass:true,
				nav:false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:3
					},
					480: {
						items:4
					},
					768: {
						items:5
					},
					992: {
						items:6
					}
				}
	        });

	        /* product.html -  related products carousel */
			$('.owl-carousel.related-products-carousel').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

	        /* Product2.html -  Product carousel to zoom product section */
			$('.owl-carousel.product-gallery-sm').owlCarousel({
	            loop:false,
				margin:6,
				responsiveClass:true,
				nav:false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:3
					},
					480: {
						items:4
					},
					768: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

	        /* product2.html -  related products carousel */
			$('.owl-carousel.related-products-carousel2').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:3
					},
					1200: {
						items:4
					}
				}
	        });

			/* Portfolio - Related Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-related-carousel').owlCarousel({
				loop:false,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					}
				}
			});

			/* Portfolio - Other Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-other-carousel').owlCarousel({
				loop:false,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					},
					1200:{
						items:5,
					}
				}
			});

			/* Portfolio - Similiar Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-similiar-carousel').owlCarousel({
				loop:false,
				margin:30,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					}
				}
			});

			/* Portfolio - Popular Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-popular-carousel').owlCarousel({
				loop:false,
				margin:2,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					}
				}
			});

			/* Portfolio - Rated Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-rated-carousel').owlCarousel({
				loop:false,
				margin:15,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					}
				}
			});

			/* Portfolio - Liked Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.portfolio-liked-carousel').owlCarousel({
				loop:false,
				margin:0,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					768:{
						items:3,
					},
					992:{
						items:4,
					}
				}
			});

			/* Portfolio - Other Projects Carousel - (elements-carousels.html) */
			$('.owl-carousel.our-partners').owlCarousel({
				loop:false,
				margin:10,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:2,
					},
					480: {
						items:3
					},
					768:{
						items:4,
					},
					992:{
						items:5,
					},
					1200:{
						items:6,
					}
				}
			});

			/* Single.html - Related Blog Carousel - (single.html) */
			$('.owl-carousel.blog-related-carousel').owlCarousel({
				loop:false,
				margin:15,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				responsive:{
					0:{
						items:1,
					},
					480: {
						items:2
					},
					1200:{
						items:3,
					}
				}
			});

			/* Wishlist.html -  You may also like suggestion carousel */
			$('.owl-carousel.wishlist-suggestion-carousel').owlCarousel({
	            loop:false,
				margin:20,
				responsiveClass:true,
				nav:true,
				navText: ['<i class="fa fa-angle-left">', '<i class="fa fa-angle-right">'],
				dots: false,
				autoplay: true,
				autoplayTimeout: 10000,
				responsive:{
					0:{
						items:1
					},
					480: {
						items:2
					},
					768: {
						items:3
					},
					992: {
						items:4
					},
					1200: {
						items:5
					}
				}
	        });

		},
		scrollTopBtnAppear: function () {
			// This will be triggered at the bottom of code with window scroll event
			var windowTop = $(window).scrollTop(),
		            scrollTop = $('#scroll-top');

	        if (windowTop >= 300) {
	            scrollTop.addClass('fixed');
	        } else {
	            scrollTop.removeClass('fixed');
	        }
		    
		},
		scrollToAnimation: function (speed, offset, e) {
			/* General scroll to function */
			var targetEl = $(this).attr('href'),
				toTop = false;

			if (!$(targetEl).length) {
				if (targetEl === '#header' || targetEl === '#top' || targetEl === '#wrapper') {
					targetPos = 0;
					toTop = true;
				} else {
					return;
				}
			} else {
				var elem = $(targetEl),
					targetPos = offset ? ( elem.offset().top + offset ) : elem.offset().top;
			}
			
			if (targetEl || toTop) {
				$('html, body').animate({
		            'scrollTop': targetPos
		        }, speed || 1200);
		        e.preventDefault();
			}
		},
		scrollToTopAnimation: function () {
			var self = this;
			// Scroll to top animation when the scroll-top button is clicked
			$('#scroll-top').on('click', function (e) {
		        self.scrollToAnimation.call(this, 1200, 0, e);
		    });
		},
		scrollToClass: function () {
			var self = this;
			// Scroll to animation - predefined class
			// Just add this class to any element and 
			// add href attribute with target id (#targer like so ) for target 
			// you can change 0 offset to -60 (height of fixed header)
			$('.scroll-btn, .section-btn, .scrollto').on('click', function (e) {
				var offset = $(this).data('offset');
		        self.scrollToAnimation.call(this, 1200, offset, e);
		    });
		},
		menuOnClick: function() {
			var self = this;
			// Menu on click scroll animation
			$('.navbar-nav').find('a').on('click', function (e) {
				var target = $(this).attr('href');
				if ( target.indexOf('#') === -1 || !$(target).length ) {
					return;
				}

				self.scrollToAnimation.call(this, 1200, 0, e);
			});
		},
		priceSlider:function () {
			// Slider For category pages / filter price
			$('#price-range').noUiSlider({
				range: [0, 1000],
				start: [100, 900],
				handles: 2,
				connect: true,
				serialization: {
					to: [ $('#price-range-low'), $('#price-range-high') ]
				}
				
			});
		},
		filterColorBg: function () {
			/* Category-item filter color box background */
			$('.filter-color-box').each(function() {
				var $this = $(this),
					bgColor = $this.data('bgcolor');

					$this.css('background-color', bgColor);
			});
		},
		productZoomImage: function () {
			var self = this;
			// Product page zoom plugin settings
			if ($.fn.elevateZoom) {
				$('#product-zoom').elevateZoom({
					responsive: true,
					zoomType: 'inner', // lens or window can be used - options already set below
					borderColour: '#e1e1e1',
					zoomWindowPosition: 1,
					zoomWindowOffetx: 30,
					cursor: "crosshair", //
					zoomWindowFadeIn: 400,
					zoomWindowFadeOut: 250,
					lensBorderSize: 3, // lens border size
					lensOpacity: 1,
					lensColour: 'rgba(255, 255, 255, 0.5)', // lens color
					lensShape : "square", // circle lens shape can be uses
					lensSize : 200,
					scrollZoom : true
				});

				/* swap images for zoom on click event */
				$('.product-gallery').find('a').on('click', function (e) {
					var ez = $('#product-zoom').data('elevateZoom'),
						smallImg = $(this).data('image'),
						bigImg = $(this).data('zoom-image');

						ez.swaptheimage(smallImg, bigImg);
					e.preventDefault();
				});
			}
		},
		selectBox: function () {
			// Custom select box via selectbox plugin
			// Be sure to include jquery.selectbox.css and jquery.selectbox.min.js files
			if ($.fn.selectbox) {
				$('.selectbox').selectbox({
					effect: "fade"
				});
			}
			
		},
		boostrapSpinner: function () {
			// Custom spinners
			// Include jquery.bootstrap-touchspin.min.min.js file

			if ($.fn.TouchSpin) {
				// Vertical Spinner
				$(".vertical-spinner").TouchSpin({
					verticalbuttons: true
				});

				//Horizontal spinner
				$(".horizontal-spinner").TouchSpin();
			}
		},
		dateTimePicker: function () {
			// Date Time Picker
			// Include jquery.bootstrap-datetimepicker.min.min.js file

			if ($.fn.datetimepicker) {
				// Both date and time picker
				$('.form-datetime').datetimepicker({
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
			        showMeridian: 1
			    });

				// Date picker
				$('.form-date').datetimepicker({
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					minView: 2,
					forceParse: 0
			    });

				// Time picker
				$('.form-time').datetimepicker({
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 1,
					minView: 0,
					maxView: 1,
					forceParse: 0
			    });
			}
		},
		tooltip: function () {
			// Bootstrap tooltip
			if($.fn.tooltip) {
				$('.add-tooltip').tooltip();
			}
		},
		popover: function () {
			// Bootstrap tooltip
			if($.fn.popover) {
				$('.add-popover').popover({
					trigger: 'focus'
				});
			}
		},
		servicesHover: function () {
			/* Service Hover animation with animate.css */
			$('.service-hover').on('mouseover', function () {
				$.each($(this).find('.service-icon, .service-title, p'), function () {
					var animationClass= $(this).data('hover-anim');
					$(this).addClass('animated ' + animationClass);
				});
			}).on('mouseleave', function () {
				$.each($(this).find('.service-icon, .service-title, p'), function () {
					var animationClass= $(this).data('hover-anim');
					$(this).removeClass('animated ' + animationClass);
				});
			});
		},
		countTo: function () {
			// CountTo plugin used count animations for homepages
			if ($.fn.countTo) {
				if ($.fn.waypoint) {
					$('.count').waypoint(function () {
						$(this).countTo();
					}, {
						offset: function() {
							return ( $(window).height() - 100);
						},
						triggerOnce: true 
					});
				} else {
					$('.count').countTo();
				}	
			} else { 
				// fallback if count plugin doesn't included
				// Get the data-to value and add it to element
				$('.count').each(function () {
					var $this = $(this),
						countValue = $this.data('to');

						$this.text(countValue);
				});
			}
		},
		newsletterPopup : function () {
			// Newsletter form popup - require magnific-popup plugin on page load

			if ( document.getElementById('newsletter-popup-form') ) {
				jQuery.magnificPopup.open({
					items: {
						src: '#newsletter-popup-form'
					},
					type: 'inline'
				}, 0);
			}

		},
		lightBox: function () {
			/* Popup for gallery items and videso and etc.. */
			/* magnific-popup.css and jquery.magnific.popup.mi.js files need to be included */

			/* This is for gallery images */
			$('.popup-gallery').magnificPopup({
				delegate: '.zoom-item',
				type: 'image',
				closeOnContentClick: false,
				closeBtnInside: false,
				mainClass: 'mfp-with-zoom mfp-img-mobile',
				image: {
					verticalFit: true,
					titleSrc: function(item) {
						return item.el.attr('title') + '&nbsp;&nbsp;<a class="image-source-link" href="'+item.el.attr('href')+'" target="_blank">source &rarr;</a>';
					}
				},
				gallery: {
					enabled: true
				},
				zoom: {
					enabled: true,
					duration: 400, // Duration for zoom animation 
					opener: function(element) {
						return element.find('img');
					}
				}
			});

			/* Image Popup */
			$('.popup-image').magnificPopup({
				type: 'image',
				closeOnContentClick: true,
				closeBtnInside: false,
				fixedContentPos: true,
				mainClass: 'mfp-with-zoom mfp-img-mobile',
				image: {
					verticalFit: true
				},
				zoom: {
					enabled: true,
					duration: 400
				}
			});

			/* This is for iframe - youtube - vimeo videos - goole maps  with fade animation */
			$('.popup-iframe').magnificPopup({
				disableOn: 700,
				type: 'iframe',
				mainClass: 'mfp-fade',
				removalDelay: 160,
				preloader: false,
				fixedContentPos: false
			});
		},
		videoBg: function () {
			// for index7.html 
			// This plugin doesnt work on mobile devices
			if (!this.mobile) {
				if ($.fn.mb_YTPlayer) {
					$(".player").mb_YTPlayer();
				} else {
					return;
				}
			}
		},
		progressBars: function () {
			var self = this;
			// Calculate and Animate Progress 
			// With waypoing plugin calculate width of the progress bar
			if ($.fn.waypoint) {
				$('.progress-animate').waypoint(function () {
					if (!$(this).hasClass('circle-progress')) {
						var $this = $(this),
							progressVal = $(this).data('width'),
							progressText = $this.find('.progress-text, .progress-tooltip');

						$this.css({ 'width' : progressVal + '%'}, 400);

						setTimeout(function() {
							progressText.fadeIn(400, function () {
								$this.removeClass('progress-animate');
							});
						}, 100);
						
					} else {
						// Animate knob --- Circle progrss bars
						self.animateKnob();
					}
				}, {
					offset: function() {
						return ( $(window).height() - 10);
					}
				});
				
			} else {
				// Fallback if the waypoint plugin isn't included
				// Get the value and calculate width of progress bar
				$('.progress-animate').each(function () {
					var $this = $(this),
						progressVal = $(this).data('width'),
						progressText = $this.find('.progress-text');

					$this.css({ 'width' : progressVal + '%'}, 400);
					progressText.fadeIn(500);
				});
			}
		},
		registerKnob: function() {
			// Register knob plugin
			if ($.fn.knob) {
				$('.knob').knob({
					bgColor : '#eaeaea'
				});

				$('.knob.whitebg').knob({
					bgColor : '#fff'
				});
			}
		},
		animateKnob: function() {
			// Animate knob
			if ($.fn.knob) {
				$('.knob').each(function() {
					var $this = $(this),
						container = $this.closest('.progress-animate'),
						animateTo = $this.data('animateto'),
						animateSpeed = $this.data('animatespeed')
					$this.animate(
			                { value: animateTo }, 
			                {   duration: animateSpeed,
			                    easing: 'swing',
		                    progress: function() {
		                      $this.val(Math.round(this.value)).trigger('change');
		                    },
		                    complete: function () {
		                    	container.removeClass('progress-animate');
		                    }
	               		});

				});
			}
		},
		mediaElement: function () {
			/* Media element plugin for video and audio support and styling */
			$('video, audio').mediaelementplayer();
		},
		scrollAnimations: function () {

			/* 	// Wowy Plugin
				Add Html elements wow and animation class 
				And you can add duration via data attributes
				data-wow-duration: Change the animation duration
				data-wow-delay: Delay before the animation starts
				data-wow-offset: Distance to start the animation (related to the browser bottom)
				data-wow-iteration: Number of times the animation is repeated
			*/

			// Check for class WOW // You need to call wow.min.js and animate.css for scroll animations to work
			if (typeof WOW === 'function') {
				new WOW({
					boxClass:     'wow',      // default
					animateClass: 'animated', // default
					offset:       0          // default
				}).init();
			}

		},
		flickerFeed: function () {
			/* Flickr feed plugin - Sidebar */
			if ($.fn.jflickrfeed) {
				$('ul.flickr-widget-two').jflickrfeed({
					limit: 8,
					qstrings: {
						id: '54297118@N03' // change with you flickr id
					},
					itemTemplate: '<li>' + '<a href="{{image}}" title="{{title}}">' + '<img src="{{image_s}}" alt="{{title}}" />' + '</a>' + '</li>'
				});

				$('ul.flickr-widget-three').jflickrfeed({
					limit: 15,
					qstrings: {
						id: '54297118@N03' // change with you flickr id
					},
					itemTemplate: '<li>' + '<a href="{{image}}" title="{{title}}">' + '<img src="{{image_s}}" alt="{{title}}" />' + '</a>' + '</li>'
				});
				
			}
		},
		attachBg: function () {
			// Attach background for sections via data-bgattach attribute
			var sectionBg = $('[data-bgattach]');

			$.each(sectionBg, function () {
				if ($(this).data('bgattach')){
		            $(this).css('background-image', 'url(' + $(this).data('bgattach') + ')');
		        }
			});
		},
		parallax: function () {
			// Parallax - if not mobile  with skrollr js plugin 
			if ( !this.mobile && typeof skrollr === 'object') {
				skrollr.init({
					forceHeight: false
				});
			} 

			if ( this.mobile ) {
				/* if mobile, delete background attachment fixed from parallax class */
				$('.parallax, .parallax-fixed').css('background-attachment', 'initial')
			}

		},
		isotopeActivate: function() {
			// Trigger for isotope plugin
			if($.fn.isotope) {
				var container = this.container,
					layoutMode = container.data('layoutmode');

				container.isotope({
                	itemSelector: '.portfolio-item',
                	layoutMode: (layoutMode) ? layoutMode : 'masonry',
                	transitionDuration: 0
            	});

            	
			}
		},
		isotopeReinit: function () {
			// Recall for isotope plugin
			if($.fn.isotope) {
				this.container.isotope('destroy');
				this.isotopeActivate();
			}
		},
		isotopeFilter: function () {
			// Isotope plugin filter handle
			var self = this,
				filterContainer = $('#portfolio-filter');

			filterContainer.find('a').on('click', function(e) {
				var $this = $(this),
					selector = $this.attr('data-filter');

				filterContainer.find('.active').removeClass('active');

				// And filter now
				self.container.isotope({
					filter: selector,
					transitionDuration: '0.8s'
				});
				
				$this.closest('li').addClass('active');
				e.preventDefault();
			});
		},
		blogMasonry: function () {
			/* Masonry - Grid for blog pages with isotope.pkgd.min.js file */

			// This property is defined at the top of the file
			var blogContainer = this.blogContainer;

			blogContainer.isotope({
				itemSelector: '.entry',
				lasyoutMode: 'fitRows',
				masonry: {
					gutter: 15
				},
				transitionDuration: 0
			});
		},
		blogMasonryRefresh: function () {
			this.blogContainer.isotope('layout');
		},
		infiniteScroll: function (itemContainer, itemSelector) {
			if ($.fn.infinitescroll) {
				itemContainer.infinitescroll({
	                navSelector  : '#page-nav',    // selector for the paged navigation 
	                nextSelector : '#page-nav a:first',  // selector for the NEXT link (to page 2)
	                itemSelector : itemSelector,     // selector for all items you'll retrieve
	                loading: {
	                	msgText: 'Loading Posts...',
	                	finishedMsg: 'No more post to load.',
	                	img: '//eonythemes.com/themes/t/images/load.GIF' //images/load.gif // you need to give fullpath tp gif
	                }
	            }, function (newElements) {
					itemContainer.isotope('appended', $(newElements)).isotope('layout');
		            }
	        	);

				/* Unbind for manual trigger */
				if ($('#infinite-trigger').length) {
					$(window).unbind('.infscr');

	        		$('#infinite-trigger').on('click', function (e) {
	        			itemContainer.infinitescroll('retrieve');
	        			e.preventDefault();
	        		});

	        		$(document).ajaxError(function(e,xhr,opt){
	        			if(xhr.status==404)$('a#infinite-trigger').addClass('disabled');
	        		});
				}
        		
			}
		}

	};

	Boss.init();

	// Load Event
	$(window).on('load', function() {
		/* Trigger side menu scrollbar */
		Boss.sideMenuScrollbar();

		/* Small fix (vertical margin between masonry posts)
		index blog homepages refresh layout */
		if (Boss.blogContainer.length) {
			Boss.blogMasonryRefresh();
		}

	});

	// Scroll Event
	$(window).on('scroll', function () {
		/* Display Scroll to Top Button */
		Boss.scrollTopBtnAppear();

		/* Fix for header search for fixed header */
		Boss.headerSearchScrollFix();

	});

	// Resize Event 
	// Smart resize if plugin not found window resize event
	if($.event.special.debouncedresize) {
		$(window).on('debouncedresize', function() {

			/* Full Height recall */
			Boss.fullHeight();

			/*Destroy sticky menu for mobile */
			Boss.destroyStickyMenu();

	    });
	} else {
		$(window).on('resize', function () {
			
			/* Full Height recall */
			Boss.fullHeight();

			/*Destroy sticky menu for mobile */
			Boss.destroyStickyMenu();

		});
	}

})(jQuery);