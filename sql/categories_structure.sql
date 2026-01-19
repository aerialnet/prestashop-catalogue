-- PrestaShop Category Structure Setup
-- This script creates a sample category structure with 10 main categories and subcategories
-- Adjust as needed for your specific catalogue

-- Note: This is a template. Actual IDs and structure will depend on your PrestaShop installation
-- It's recommended to create categories through the PrestaShop Admin interface

-- Example Category Structure:
/*

Main Categories (10):
1. Electronics
   - Computers & Laptops
   - Mobile Phones
   - Cameras & Photography
   - Audio & Headphones
   - Smart Home
   - Gaming
   - Wearables
   - Accessories
   - Tablets
   - Computer Components

2. Fashion & Apparel
   - Men's Clothing
   - Women's Clothing
   - Kids' Clothing
   - Shoes
   - Bags & Accessories
   - Watches
   - Jewelry
   - Sunglasses
   - Sportswear
   - Seasonal

3. Home & Garden
   - Furniture
   - Home Decor
   - Kitchen & Dining
   - Bedding & Bath
   - Lighting
   - Storage & Organization
   - Garden Tools
   - Outdoor Furniture
   - Home Improvement
   - Smart Home

4. Sports & Outdoors
   - Fitness Equipment
   - Outdoor Recreation
   - Team Sports
   - Water Sports
   - Winter Sports
   - Cycling
   - Camping & Hiking
   - Running
   - Yoga & Pilates
   - Sports Accessories

5. Beauty & Health
   - Skincare
   - Makeup
   - Hair Care
   - Fragrances
   - Personal Care
   - Health Supplements
   - Medical Supplies
   - Wellness
   - Grooming
   - Beauty Tools

6. Books & Media
   - Fiction
   - Non-Fiction
   - Educational
   - Magazines
   - Comics & Graphic Novels
   - Music
   - Movies & TV
   - Video Games
   - E-books
   - Audiobooks

7. Toys & Games
   - Action Figures
   - Dolls & Playsets
   - Building Toys
   - Educational Toys
   - Board Games
   - Puzzles
   - Outdoor Toys
   - Electronic Toys
   - Crafts & Arts
   - Collectibles

8. Automotive
   - Car Accessories
   - Car Electronics
   - Maintenance & Care
   - Interior Accessories
   - Exterior Accessories
   - Motorcycle Accessories
   - Tools & Equipment
   - Performance Parts
   - Tires & Wheels
   - Car Audio

9. Office & Stationery
   - Office Supplies
   - Writing Instruments
   - Paper Products
   - Desk Accessories
   - Filing & Storage
   - Art Supplies
   - School Supplies
   - Office Electronics
   - Calendars & Planners
   - Labels & Stamps

10. Food & Beverages
    - Snacks & Sweets
    - Beverages
    - Gourmet Foods
    - Organic Products
    - Dietary & Specialty
    - Baking Supplies
    - Condiments & Sauces
    - Coffee & Tea
    - Breakfast Foods
    - International Foods

*/

-- Instructions for creating categories:
/*

1. Log in to PrestaShop Admin Panel
2. Go to Catalog > Categories
3. Click "Add new category"
4. For each main category:
   - Enter category name
   - Add description (optional)
   - Upload category image (recommended)
   - Set parent category to "Home"
   - Enable the category
   - Save

5. For each subcategory:
   - Click "Add new category"
   - Enter subcategory name
   - Add description (optional)
   - Upload image (optional)
   - Set parent category to the corresponding main category
   - Enable the category
   - Save

6. Configure category display settings:
   - Go to Shop Parameters > Product Settings
   - Set number of products per page
   - Configure sorting options

7. Assign products to categories:
   - Go to Catalog > Products
   - Edit each product
   - In "Categories" tab, check the appropriate categories
   - Save

*/

-- Alternative: If you prefer to create via database, you'll need to:
-- 1. Insert into ps_category table
-- 2. Insert into ps_category_lang table (for each language)
-- 3. Insert into ps_category_shop table
-- 4. Update nested set values (lft, rgt) for proper hierarchy
-- 5. Generate category URLs

-- This is complex and error-prone. Using the Admin interface is strongly recommended.
