# Product Import Guide

## Overview
This guide explains how to import products into your PrestaShop Minimalist Catalogue.

## Import Methods

### Method 1: PrestaShop Admin Interface (Recommended)

1. **Prepare your CSV file** (see CSV format below)
2. **Navigate to Import**:
   - Admin Panel > Advanced Parameters > Import
3. **Select Entity Type**: Products
4. **Upload CSV file**
5. **Map CSV columns** to PrestaShop fields
6. **Configure import options**:
   - Force all ID numbers (for updates)
   - Skip regeneration of thumbnails
7. **Start import**

### Method 2: Manual Product Entry

For smaller catalogues or unique products:
1. Admin Panel > Catalog > Products
2. Click "Add new product"
3. Fill in product details
4. Save

## CSV Format

### Required Columns
- `ID`: Product ID (optional for new products)
- `Name`: Product name
- `Categories`: Category path (e.g., "Home>Electronics>Phones")
- `Reference`: Product SKU/reference
- `Active`: 1 for active, 0 for inactive

### Optional Columns (Recommended)
- `Description short`: Brief product description
- `Description`: Full product description
- `Image URLs`: Product image URLs (comma-separated)
- `Meta title`: SEO title
- `Meta description`: SEO description
- `Meta keywords`: SEO keywords
- `Available for order`: 1 or 0
- `Show price`: 0 (for catalogue mode)
- `Quantity`: Stock quantity

### Sample CSV

```csv
ID,Active,Name,Categories,Reference,Description short,Description,Image URLs,Meta title,Meta description,Available for order,Show price
1,1,"Wireless Headphones","Home>Electronics>Audio",WH-001,"Premium wireless headphones with noise cancellation","High-quality wireless headphones featuring active noise cancellation, 30-hour battery life, and premium sound quality. Perfect for music lovers and professionals.","https://example.com/images/headphones-1.jpg,https://example.com/images/headphones-2.jpg","Wireless Headphones | Premium Audio","Shop premium wireless headphones with noise cancellation",0,0
2,1,"Smart Watch","Home>Electronics>Wearables",SW-001,"Modern smartwatch with fitness tracking","Advanced smartwatch with heart rate monitor, GPS tracking, sleep analysis, and smartphone notifications. Water-resistant design.","https://example.com/images/watch-1.jpg,https://example.com/images/watch-2.jpg","Smart Watch | Fitness Tracker","Discover our smart watch with advanced fitness tracking",0,0
3,1,"Laptop Backpack","Home>Fashion>Bags",BP-001,"Durable laptop backpack for professionals","Spacious backpack with padded laptop compartment (up to 15.6 inch), multiple pockets, USB charging port, and water-resistant material.","https://example.com/images/backpack-1.jpg","Laptop Backpack | Professional","Quality laptop backpack for work and travel",0,0
```

## Step-by-Step Import Process

### 1. Prepare Categories First
Before importing products, ensure all categories exist:
- Create main categories
- Create subcategories
- Note the exact category paths

### 2. Prepare Product Data

**Image Guidelines:**
- Use high-quality images (minimum 800x800px)
- Square aspect ratio recommended
- JPG or PNG format
- Host images on reliable server or use full URLs

**Description Guidelines:**
- Short description: 100-200 characters
- Full description: Detailed product information
- Use HTML tags if needed (e.g., `<p>`, `<ul>`, `<li>`)
- Focus on features and benefits

**SEO Guidelines:**
- Meta title: 50-60 characters
- Meta description: 150-160 characters
- Include relevant keywords naturally

### 3. Import via PrestaShop

**Step-by-step:**

1. Save your CSV file (UTF-8 encoding)

2. Go to: **Advanced Parameters > Import**

3. Select **"Products"** as entity type

4. **Upload your CSV file**

5. **Configure settings:**
   - Language: Select your shop language
   - Field separator: `;` or `,` (match your CSV)
   - Multiple value separator: `,`
   - Delete all products before import: No (unless starting fresh)
   - Force all ID numbers: Yes (if updating existing products)
   - Skip thumbnails regeneration: Yes (for faster import)

6. **Map columns:**
   - Match each CSV column to corresponding PrestaShop field
   - PrestaShop will auto-detect many fields
   - Verify all mappings are correct

7. **Click "Import"**

8. **Review import results:**
   - Check for errors
   - Note how many products were imported
   - Fix any issues and re-import if needed

### 4. Verify Import

1. Go to **Catalog > Products**
2. Check imported products
3. Verify:
   - Product names and descriptions
   - Images loaded correctly
   - Categories assigned correctly
   - All fields populated as expected

### 5. Post-Import Tasks

1. **Regenerate images** (if needed):
   - Design > Image Settings
   - Regenerate thumbnails

2. **Clear cache**:
   - Advanced Parameters > Performance
   - Clear cache

3. **Check frontend**:
   - Visit category pages
   - Verify product display
   - Check responsive layout
   - Test search functionality

## Advanced Import Options

### Bulk Product Updates

To update existing products:
1. Export current products to CSV
2. Edit the CSV file
3. Import with "Force all ID numbers" enabled

### Multiple Images

Format for multiple images in CSV:
```csv
Image URLs
"https://example.com/img1.jpg,https://example.com/img2.jpg,https://example.com/img3.jpg"
```

### Custom Fields

If using custom fields:
1. Create custom fields in Product Settings
2. Add columns to CSV with exact field names
3. Map during import

## Common Import Issues

### Issue: Images not loading
**Solution:**
- Verify image URLs are accessible
- Check image format (JPG/PNG)
- Ensure proper permissions
- Consider uploading images to PrestaShop server first

### Issue: Categories not assigned
**Solution:**
- Verify category names match exactly
- Use correct category path format
- Create categories before importing products

### Issue: Special characters corrupted
**Solution:**
- Save CSV with UTF-8 encoding
- Use proper character encoding in import settings

### Issue: Import timeout
**Solution:**
- Import in smaller batches (100-200 products)
- Increase PHP timeout settings
- Skip thumbnail regeneration during import

## Best Practices

1. **Test First**: Import a small sample (10-20 products) to verify format
2. **Backup**: Always backup database before large imports
3. **Batch Import**: For 500 products, import in batches of 100
4. **Image Optimization**: Optimize images before uploading (compress, resize)
5. **Consistent Format**: Keep product data consistent
6. **Regular Updates**: Update product information regularly
7. **SEO**: Always include meta titles and descriptions

## Sample Products for Testing

You can use these sample products for testing:

```csv
ID,Active,Name,Categories,Reference,Description short,Description
1,1,"Test Product 1","Home>Electronics",TP-001,"Test product short description","This is a full description for test product 1"
2,1,"Test Product 2","Home>Fashion",TP-002,"Another test product","Full description for test product 2"
3,1,"Test Product 3","Home>Home & Garden",TP-003,"Third test product","Description for test product 3"
```

## Resources

- [PrestaShop Import Documentation](https://doc.prestashop.com/display/PS17/Importing+data)
- [CSV Format Guide](https://doc.prestashop.com/display/PS17/CSV+file)
- Sample CSV files available in `sql/` directory

## Support

For import issues:
1. Check PrestaShop logs: Admin > Advanced Parameters > Logs
2. Review import error messages
3. Consult PrestaShop documentation
4. Ask in PrestaShop community forums
