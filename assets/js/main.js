(function() {
  "use strict";

  /**
   * Header toggle
   */
  const headerToggleBtn = document.querySelector('.header-toggle');
  const headerElement = document.querySelector('#header');

  function headerToggle() {
    if (!headerElement || !headerToggleBtn) return;
    headerElement.classList.toggle('header-show');
    headerToggleBtn.classList.toggle('bi-list');
    headerToggleBtn.classList.toggle('bi-x');
  }
  if (headerToggleBtn) {
    headerToggleBtn.addEventListener('click', headerToggle);
  }

  /**
   * Normalize navbar active state by current page path.
   * Keeps nav markup consistent across pages without hardcoded active classes.
   */
  function setNavActiveByPath() {
    const navLinks = document.querySelectorAll('#navmenu a[href]');
    if (!navLinks.length) return;

    navLinks.forEach(link => link.classList.remove('active'));

    const rawPath = window.location.pathname.split('/').pop() || 'index.html';
    const page = rawPath.toLowerCase();

    const resolveTargetHref = function() {
      if (page === '' || page === 'index.html') return 'index.html';
      if (page === 'about.html') return 'about.html';
      if (page === 'produk.html' || page.startsWith('paket-')) return 'produk.html';
      if (page === 'service.html' || page === 'service-details.html' || page.startsWith('layanan-')) return 'service.html';
      if (page === 'blog.html' || page === 'artikel.html' || page.startsWith('panduan-') || page.startsWith('strategi-') || page.startsWith('template-') || page.startsWith('cara-')) return 'blog.html';
      if (page === 'portfolio-details.html' || page.startsWith('portofolio-')) return 'portfolio-details.html';
      if (page === 'lokasi-layanan.html') return 'lokasi-layanan.html';
      if (page === 'galeri.html') return 'galeri.html';
      if (page === 'faq-seo.html') return 'faq-seo.html';
      if (page === 'starter-page.html') return 'starter-page.html';
      return '';
    };

    const targetHref = resolveTargetHref();
    if (!targetHref) return;

    const targetLink = document.querySelector(`#navmenu a[href="${targetHref}"]`);
    if (!targetLink) return;

    targetLink.classList.add('active');

    const dropdownItem = targetLink.closest('li.dropdown');
    if (dropdownItem) {
      const dropdownToggle = dropdownItem.querySelector(':scope > a');
      if (dropdownToggle) {
        dropdownToggle.classList.add('active');
      }
    }
  }

  setNavActiveByPath();

  /**
   * Hide mobile nav on same-page/hash links
   */
  document.querySelectorAll('#navmenu a').forEach(navmenu => {
    navmenu.addEventListener('click', () => {
      if (document.querySelector('.header-show')) {
        headerToggle();
      }
    });

  });

  /**
   * Toggle mobile nav dropdowns
   */
  document.querySelectorAll('.navmenu .toggle-dropdown').forEach(navmenu => {
    navmenu.addEventListener('click', function(e) {
      e.preventDefault();
      this.parentNode.classList.toggle('active');
      this.parentNode.nextElementSibling.classList.toggle('dropdown-active');
      e.stopImmediatePropagation();
    });
  });

  /**
   * Preloader
   */
  const preloader = document.querySelector('#preloader');
  if (preloader) {
    window.addEventListener('load', () => {
      preloader.remove();
    });
  }

  /**
   * Scroll top button
   */
  let scrollTop = document.querySelector('.scroll-top');

  function toggleScrollTop() {
    if (scrollTop) {
      window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
    }
  }
  if (scrollTop) {
    scrollTop.addEventListener('click', (e) => {
      e.preventDefault();
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  }

  window.addEventListener('load', toggleScrollTop);
  document.addEventListener('scroll', toggleScrollTop);

  /**
   * Global floating WhatsApp button
   * Adds button only on pages that do not already render a dedicated floating WA.
   */
  function ensureFloatingWaButton() {
    if (document.querySelector('.floating-wa, .floating-wa-global')) return;

    const waBtn = document.createElement('a');
    waBtn.className = 'floating-wa-global d-flex align-items-center justify-content-center';
    waBtn.href = 'https://wa.me/62895639068080?text=Halo%20Vendor%20Souvenir%20Kantor%2C%20saya%20ingin%20konsultasi%20souvenir%20kantor.';
    waBtn.target = '_blank';
    waBtn.rel = 'noopener';
    waBtn.setAttribute('aria-label', 'Chat WhatsApp');
    waBtn.innerHTML = '<i class="bi bi-whatsapp"></i>';
    document.body.appendChild(waBtn);
  }

  ensureFloatingWaButton();

  /**
   * Auto TOC for detail pages (article/product/service).
   */
  function initDetailPageToc() {
    const tocList = document.getElementById('tocList');
    if (!tocList) return;

    const contentContainer = document.querySelector('.article-content, .product-content, .service-content');
    if (!contentContainer) return;

    const tocWrapper = document.getElementById('tocWrapper');
    const headings = contentContainer.querySelectorAll('h2');
    if (!headings.length) return;

    tocList.innerHTML = '';

    headings.forEach(function(heading, index) {
      if (!heading.id) {
        heading.id = 'h2-' + (index + 1);
      }

      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = '#' + heading.id;
      link.textContent = heading.textContent;
      link.addEventListener('click', function() {
        if (window.innerWidth < 992 && tocWrapper) {
          tocWrapper.open = false;
        }
      });

      item.appendChild(link);
      tocList.appendChild(item);
    });
  }

  initDetailPageToc();

  /**
   * Share buttons for detail pages.
   */
  function getShareLabelByPage() {
    const body = document.body;
    if (!body) return 'Lihat halaman ini';
    if (body.classList.contains('artikel-page')) return 'Baca artikel ini';
    if (body.classList.contains('product-package-page')) return 'Baca detail paket ini';
    if (body.classList.contains('service-package-page')) return 'Baca detail layanan ini';
    return 'Lihat halaman ini';
  }

  function initDetailShareButtons() {
    const shareWa = document.getElementById('shareWa');
    const shareFb = document.getElementById('shareFb');
    const shareX = document.getElementById('shareX');
    const shareLinkedin = document.getElementById('shareLinkedin');
    const copyBtn = document.getElementById('copyLinkBtn');

    if (!shareWa && !shareFb && !shareX && !shareLinkedin && !copyBtn) return;

    const currentUrl = window.location.href;
    const pageUrl = encodeURIComponent(currentUrl);
    const pageTitle = encodeURIComponent(document.title);
    const waLabel = getShareLabelByPage();
    const waText = encodeURIComponent(waLabel + ': ' + document.title + ' - ' + currentUrl);

    if (shareWa) {
      shareWa.href = 'https://wa.me/?text=' + waText;
    }
    if (shareFb) {
      shareFb.href = 'https://www.facebook.com/sharer/sharer.php?u=' + pageUrl;
    }
    if (shareX) {
      shareX.href = 'https://twitter.com/intent/tweet?url=' + pageUrl + '&text=' + pageTitle;
    }
    if (shareLinkedin) {
      shareLinkedin.href = 'https://www.linkedin.com/sharing/share-offsite/?url=' + pageUrl;
    }

    if (copyBtn && !copyBtn.dataset.bound) {
      copyBtn.dataset.bound = 'true';
      copyBtn.addEventListener('click', function() {
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(currentUrl).then(function() {
            copyBtn.textContent = 'Link Tersalin';
            setTimeout(function() {
              copyBtn.innerHTML = '<i class="bi bi-link-45deg"></i> Copy Link';
            }, 1400);
          });
        }
      });
    }
  }

  initDetailShareButtons();

  /**
   * Hide self-link in related portfolio cards
   */
  function normalizePath(pathname) {
    return (pathname || '').replace(/\\/g, '/').replace(/\/+$/, '');
  }

  function syncRelatedPortfolioCards() {
    const currentPath = normalizePath(window.location.pathname);
    const relatedItems = document.querySelectorAll('.portfolio-related .related-item');
    if (!relatedItems.length) return;

    relatedItems.forEach(function(item) {
      const link = item.querySelector('a[href]');
      if (!link) return;

      const url = new URL(link.getAttribute('href'), window.location.href);
      if (normalizePath(url.pathname) === currentPath) {
        item.style.display = 'none';
      }
    });
  }

  syncRelatedPortfolioCards();

  /**
   * Animation on scroll function and init
   */
  function aosInit() {
    if (typeof AOS === 'undefined') return;
    AOS.init({
      duration: 600,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    });
  }
  window.addEventListener('load', aosInit);

  /**
   * Init typed.js
   */
  const selectTyped = document.querySelector('.typed');
  if (selectTyped && typeof Typed !== 'undefined') {
    let typed_strings = selectTyped.getAttribute('data-typed-items');
    if (typed_strings) {
      typed_strings = typed_strings.split(',');
      new Typed('.typed', {
        strings: typed_strings,
        loop: true,
        typeSpeed: 100,
        backSpeed: 50,
        backDelay: 2000
      });
    }
  }

  /**
   * Initiate glightbox
   */
  if (typeof GLightbox !== 'undefined') {
    GLightbox({
      selector: '.glightbox'
    });
  }

  /**
   * Init isotope layout and filters
   */
  document.querySelectorAll('.isotope-layout').forEach(function(isotopeItem) {
    if (typeof imagesLoaded === 'undefined' || typeof Isotope === 'undefined') return;

    let layout = isotopeItem.getAttribute('data-layout') ?? 'masonry';
    let filter = isotopeItem.getAttribute('data-default-filter') ?? '*';
    let sort = isotopeItem.getAttribute('data-sort') ?? 'original-order';
    const isotopeContainer = isotopeItem.querySelector('.isotope-container');
    let pendingSortConfig = null;

    if (!isotopeContainer) return;

    let initIsotope;
    imagesLoaded(isotopeContainer, function() {
      initIsotope = new Isotope(isotopeContainer, {
        itemSelector: '.isotope-item',
        layoutMode: layout,
        filter: filter,
        sortBy: sort,
        getSortData: {
          price: function(itemElem) {
            return parseFloat(itemElem.getAttribute('data-price')) || 0;
          },
          popularity: function(itemElem) {
            return parseFloat(itemElem.getAttribute('data-popularity')) || 0;
          },
          newest: function(itemElem) {
            return parseInt(itemElem.getAttribute('data-date'), 10) || 0;
          }
        }
      });

      if (pendingSortConfig) {
        initIsotope.arrange(pendingSortConfig);
      }
    });

    isotopeItem.querySelectorAll('.isotope-filters li').forEach(function(filters) {
      filters.addEventListener('click', function() {
        const activeFilter = isotopeItem.querySelector('.isotope-filters .filter-active');
        if (activeFilter) {
          activeFilter.classList.remove('filter-active');
        }
        this.classList.add('filter-active');
        if (!initIsotope) return;
        initIsotope.arrange({
          filter: this.getAttribute('data-filter')
        });
        if (typeof aosInit === 'function') {
          aosInit();
        }
      }, false);
    });

    const sortOptions = isotopeItem.querySelectorAll('.dropdown-menu .dropdown-item[data-sort]');
    const sortButton = isotopeItem.querySelector('.filters .dropdown .btn');

    sortOptions.forEach(function(option) {
      option.addEventListener('click', function(e) {
        e.preventDefault();

        const sortBy = this.getAttribute('data-sort') || 'original-order';
        const sortOrder = this.getAttribute('data-sort-order') || 'asc';
        const sortAscending = sortOrder !== 'desc';

        sortOptions.forEach(item => item.classList.remove('active'));
        this.classList.add('active');

        if (sortButton) {
          sortButton.innerHTML = '<i class="bi bi-sort-down me-2"></i> ' + this.textContent.trim();
        }

        const sortConfig = {
          sortBy: sortBy,
          sortAscending: sortAscending
        };

        if (!initIsotope) {
          pendingSortConfig = sortConfig;
          return;
        }

        initIsotope.arrange(sortConfig);
        if (typeof aosInit === 'function') {
          aosInit();
        }
      });
    });

  });

  /**
   * Init swiper sliders
   */
  function initSwiper() {
    if (typeof Swiper === 'undefined') return;

    document.querySelectorAll(".init-swiper").forEach(function(swiperElement) {
      const configNode = swiperElement.querySelector(".swiper-config");
      if (!configNode) return;

      let config;
      try {
        config = JSON.parse(configNode.innerHTML.trim());
      } catch (error) {
        return;
      }

      if (swiperElement.classList.contains("swiper-tab") && typeof initSwiperWithCustomPagination === 'function') {
        initSwiperWithCustomPagination(swiperElement, config);
      } else {
        new Swiper(swiperElement, config);
      }
    });
  }

  window.addEventListener("load", initSwiper);

  /**
   * Initiate Pure Counter
   */
  if (typeof PureCounter !== 'undefined') {
    new PureCounter();
  }

  /**
   * Ecommerce Cart Functionality
   * Handles quantity changes and item removal
   */

  function ecommerceCartTools() {
    // Get all quantity buttons and inputs directly
    const decreaseButtons = document.querySelectorAll('.quantity-btn.decrease');
    const increaseButtons = document.querySelectorAll('.quantity-btn.increase');
    const quantityInputs = document.querySelectorAll('.quantity-input');
    const removeButtons = document.querySelectorAll('.remove-item');

    // Decrease quantity buttons
    decreaseButtons.forEach(btn => {
      btn.addEventListener('click', function() {
        const quantityInput = btn.closest('.quantity-selector').querySelector('.quantity-input');
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
          quantityInput.value = currentValue - 1;
        }
      });
    });

    // Increase quantity buttons
    increaseButtons.forEach(btn => {
      btn.addEventListener('click', function() {
        const quantityInput = btn.closest('.quantity-selector').querySelector('.quantity-input');
        let currentValue = parseInt(quantityInput.value);
        if (currentValue < parseInt(quantityInput.getAttribute('max'))) {
          quantityInput.value = currentValue + 1;
        }
      });
    });

    // Manual quantity inputs
    quantityInputs.forEach(input => {
      input.addEventListener('change', function() {
        let currentValue = parseInt(input.value);
        const min = parseInt(input.getAttribute('min'));
        const max = parseInt(input.getAttribute('max'));

        // Validate input
        if (isNaN(currentValue) || currentValue < min) {
          input.value = min;
        } else if (currentValue > max) {
          input.value = max;
        }
      });
    });

    // Remove item buttons
    removeButtons.forEach(btn => {
      btn.addEventListener('click', function() {
        btn.closest('.cart-item').remove();
      });
    });
  }

  ecommerceCartTools();

  /**
   * Product Image Zoom and Thumbnail Functionality
   */

  function productDetailFeatures() {
    // Initialize Drift for image zoom
    function initDriftZoom() {
      // Check if Drift is available
      if (typeof Drift === 'undefined') {
        console.error('Drift library is not loaded');
        return;
      }

      const driftOptions = {
        paneContainer: document.querySelector('.image-zoom-container'),
        inlinePane: window.innerWidth < 768 ? true : false,
        inlineOffsetY: -85,
        containInline: true,
        hoverBoundingBox: false,
        zoomFactor: 3,
        handleTouch: false
      };

      // Initialize Drift on the main product image
      const mainImage = document.getElementById('main-product-image');
      if (mainImage) {
        new Drift(mainImage, driftOptions);
      }
    }

    // Thumbnail click functionality
    function initThumbnailClick() {
      const thumbnails = document.querySelectorAll('.thumbnail-item');
      const mainImage = document.getElementById('main-product-image');

      if (!thumbnails.length || !mainImage) return;

      thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener('click', function() {
          // Get image path from data attribute
          const imageSrc = this.getAttribute('data-image');

          // Update main image src and zoom attribute
          mainImage.src = imageSrc;
          mainImage.setAttribute('data-zoom', imageSrc);

          // Update active state
          thumbnails.forEach(item => item.classList.remove('active'));
          this.classList.add('active');

          // Reinitialize Drift for the new image
          initDriftZoom();
        });
      });
    }

    // Image navigation functionality (prev/next buttons)
    function initImageNavigation() {
      const prevButton = document.querySelector('.image-nav-btn.prev-image');
      const nextButton = document.querySelector('.image-nav-btn.next-image');

      if (!prevButton || !nextButton) return;

      const thumbnails = Array.from(document.querySelectorAll('.thumbnail-item'));
      if (!thumbnails.length) return;

      // Function to navigate to previous or next image
      function navigateImage(direction) {
        // Find the currently active thumbnail
        const activeIndex = thumbnails.findIndex(thumb => thumb.classList.contains('active'));
        if (activeIndex === -1) return;

        let newIndex;
        if (direction === 'prev') {
          // Go to previous image or loop to the last one
          newIndex = activeIndex === 0 ? thumbnails.length - 1 : activeIndex - 1;
        } else {
          // Go to next image or loop to the first one
          newIndex = activeIndex === thumbnails.length - 1 ? 0 : activeIndex + 1;
        }

        // Simulate click on the new thumbnail
        thumbnails[newIndex].click();
      }

      // Add event listeners to navigation buttons
      prevButton.addEventListener('click', () => navigateImage('prev'));
      nextButton.addEventListener('click', () => navigateImage('next'));
    }

    // Initialize all features
    initDriftZoom();
    initThumbnailClick();
    initImageNavigation();
  }

  productDetailFeatures();

  /**
   * Correct scrolling position upon page load for URLs containing hash links.
   */
  window.addEventListener('load', function(e) {
    if (window.location.hash) {
      let section = null;
      try {
        section = document.querySelector(window.location.hash);
      } catch (error) {
        section = null;
      }

      if (section) {
        setTimeout(() => {
          let scrollMarginTop = getComputedStyle(section).scrollMarginTop;
          window.scrollTo({
            top: section.offsetTop - parseInt(scrollMarginTop),
            behavior: 'smooth'
          });
        }, 100);
      }
    }
  });

  /**
   * Navmenu Scrollspy
   */
  let navmenulinks = document.querySelectorAll('.navmenu a');

  function navmenuScrollspy() {
    navmenulinks.forEach(navmenulink => {
      if (!navmenulink.hash) return;
      let section = null;
      try {
        section = document.querySelector(navmenulink.hash);
      } catch (error) {
        section = null;
      }
      if (!section) return;
      let position = window.scrollY + 200;
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        document.querySelectorAll('.navmenu a.active').forEach(link => link.classList.remove('active'));
        navmenulink.classList.add('active');
      } else {
        navmenulink.classList.remove('active');
      }
    })
  }
  window.addEventListener('load', navmenuScrollspy);
  document.addEventListener('scroll', navmenuScrollspy);

})();
