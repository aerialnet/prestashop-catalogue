/**
 * Minimalist Catalogue Theme - JavaScript
 * Handles dual-row menu interactions and dynamic subcategory display
 */

document.addEventListener('DOMContentLoaded', function() {
  initMenu();
  initSearch();
  initMobileMenu();
});

/**
 * Initialize dual-row category/subcategory menu
 */
function initMenu() {
  const menuItems = document.querySelectorAll('.main-menu-item');
  const submenuWrapper = document.querySelector('.submenu');
  
  if (!menuItems.length || !submenuWrapper) {
    return;
  }
  
  // Category data structure (will be populated by PrestaShop)
  // This is a fallback/example structure
  const categorySubcategories = {
    // category_id: [subcategory_ids]
  };
  
  // Handle category hover/click to show subcategories
  menuItems.forEach(item => {
    const link = item.querySelector('.main-menu-link');
    const categoryId = item.dataset.categoryId;
    
    if (!link) return;
    
    // On click, set active and display subcategories
    link.addEventListener('click', function(e) {
      // Remove active class from all items
      menuItems.forEach(i => {
        i.querySelector('.main-menu-link')?.classList.remove('active');
      });
      
      // Add active class to current item
      link.classList.add('active');
      
      // Update subcategories display
      updateSubcategories(categoryId);
    });
    
    // On hover, preview subcategories
    item.addEventListener('mouseenter', function() {
      if (!link.classList.contains('active')) {
        previewSubcategories(categoryId);
      }
    });
  });
  
  // Load first category's subcategories by default
  const firstCategory = menuItems[0]?.dataset.categoryId;
  if (firstCategory) {
    menuItems[0]?.querySelector('.main-menu-link')?.classList.add('active');
    updateSubcategories(firstCategory);
  }
}

/**
 * Update subcategories in the second row
 */
function updateSubcategories(categoryId) {
  const submenu = document.querySelector('.submenu');
  if (!submenu) return;
  
  // Get subcategories for this category
  const subcategoryElements = document.querySelectorAll(`[data-parent-category="${categoryId}"]`);
  
  // Hide all subcategories
  document.querySelectorAll('.submenu-item').forEach(item => {
    item.style.display = 'none';
  });
  
  // Show subcategories for selected category
  subcategoryElements.forEach(item => {
    item.style.display = 'block';
  });
  
  // If no subcategories, show a message or keep empty
  if (subcategoryElements.length === 0) {
    submenu.innerHTML = '<span class="no-subcategories" style="padding: var(--spacing-sm); color: var(--color-text-light);">No subcategories</span>';
  }
}

/**
 * Preview subcategories on hover (lighter interaction)
 */
function previewSubcategories(categoryId) {
  // Could add a lighter visual preview here if needed
  // For now, keeping it simple
}

/**
 * Initialize search functionality
 */
function initSearch() {
  const searchInput = document.querySelector('.search-widget input[type="text"]');
  const searchForm = document.querySelector('.search-widget form');
  
  if (!searchInput) return;
  
  // Add search icon if not present
  const searchWidget = document.querySelector('.search-widget');
  if (searchWidget && !searchWidget.querySelector('.search-icon')) {
    const icon = document.createElement('span');
    icon.className = 'search-icon';
    icon.innerHTML = '🔍';
    icon.style.position = 'absolute';
    icon.style.right = '10px';
    icon.style.top = '50%';
    icon.style.transform = 'translateY(-50%)';
    icon.style.cursor = 'pointer';
    searchWidget.style.position = 'relative';
    searchWidget.appendChild(icon);
    
    icon.addEventListener('click', function() {
      searchForm?.submit();
    });
  }
  
  // Handle Enter key
  searchInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
      searchForm?.submit();
    }
  });
}

/**
 * Initialize mobile menu toggle
 */
function initMobileMenu() {
  // Create mobile menu toggle button
  const header = document.querySelector('#header');
  const mainMenu = document.querySelector('.main-menu-wrapper');
  
  if (!header || !mainMenu) return;
  
  // Check if we're on mobile
  if (window.innerWidth <= 768) {
    // Create toggle button if not exists
    let toggleBtn = document.querySelector('.mobile-menu-toggle');
    
    if (!toggleBtn) {
      toggleBtn = document.createElement('button');
      toggleBtn.className = 'mobile-menu-toggle';
      toggleBtn.innerHTML = '☰';
      toggleBtn.style.cssText = `
        position: absolute;
        top: 20px;
        right: 20px;
        font-size: 24px;
        background: none;
        border: none;
        cursor: pointer;
        z-index: 1001;
      `;
      header.appendChild(toggleBtn);
      
      // Initially hide menu on mobile
      mainMenu.style.display = 'none';
      
      // Toggle menu visibility
      toggleBtn.addEventListener('click', function() {
        if (mainMenu.style.display === 'none') {
          mainMenu.style.display = 'block';
          toggleBtn.innerHTML = '✕';
        } else {
          mainMenu.style.display = 'none';
          toggleBtn.innerHTML = '☰';
        }
      });
    }
  }
  
  // Handle window resize
  window.addEventListener('resize', function() {
    const mainMenu = document.querySelector('.main-menu-wrapper');
    const toggleBtn = document.querySelector('.mobile-menu-toggle');
    
    if (window.innerWidth > 768) {
      if (mainMenu) mainMenu.style.display = '';
      if (toggleBtn) toggleBtn.style.display = 'none';
    } else {
      if (toggleBtn) toggleBtn.style.display = 'block';
    }
  });
}

/**
 * Smooth scroll for anchor links
 */
function initSmoothScroll() {
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
}

/**
 * Lazy load images for better performance
 */
function initLazyLoading() {
  if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          const src = img.dataset.src;
          if (src) {
            img.src = src;
            img.classList.add('loaded');
            observer.unobserve(img);
          }
        }
      });
    });
    
    document.querySelectorAll('img[data-src]').forEach(img => {
      imageObserver.observe(img);
    });
  }
}

/**
 * Initialize all features
 */
initSmoothScroll();
initLazyLoading();
