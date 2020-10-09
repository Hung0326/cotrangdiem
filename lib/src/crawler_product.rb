# frozen_string_literal: true

require 'logger'

# /lib/src/crawler_product.rb
class CrawlerProduct
  def logger
    @logger ||= Logger.new(Rails.root.join('log', 'crawler', 'crawler_categoty.log'))
  end

  def crawler
    crawler_link_product.each do |value|
      page = Base.new(value).init_noko_data
      product_name = page.css('ul li h2.product_name').text
      product_price = edit_price(page)
      product_brand_id = match_brand_id(page)
      Product.find_or_create_by(name: product_name, price: product_price, brand_id: product_brand_id) do |product|
        product.description = page.css('#tabs_detail_product_feature').text
        product.image = upload_img(page, product_name)
      end
      puts ">> Total product: #{Product.count} <<"
    end
  rescue StandardError => e
    logger.error "Có lỗi khi lưu sản phẩm \n#{e}"
  end

  private

  def crawler_link_product
    list_link_crawler = []
    Settings.urlCrawler.map do |url|
      num_page = 0
      num_condition = 1
      while num_condition.positive?
        page = Base.new(url + num_page.to_s).init_noko_data
        data = page.css('//.item_product//.item_product_image/a/@href')
        data.map { |v| list_link_crawler.push(v.value) }
        num_page += 50
        num_condition = data.length.zero? ? 0 : 1
      end
    rescue StandardError => e
      logger.error "Có lỗi khi crawler link sản phẩm \n#{e}"
    end
    list_link_crawler.uniq!
  end

  def upload_img(page, name_product)
    list_img = []
    li = page.xpath("//div[contains(@class, 'detail_product_image')]//li//a/img/@src").map(&:value)
    folder_name = Slug.to_slug(name_product)
    li.each_with_index do |v, i|
      uploads = Cloudinary::Uploader.upload(v, folder: "product/#{folder_name}/", public_id: "#{folder_name}-#{i + 1}")
      list_img.push(uploads['secure_url'])
    rescue StandardError => e
      logger.error "Có lỗi khi crawler link sản phẩm #{e}"
    end
    list_img.join(',')
  end

  def edit_price(page)
    price = page.css('ul li.product_price span').text
    price.delete('^0-9')
  end

  def match_brand_id(page)
    name_brand = page.css('li.product_category span').text
    Brand.find_or_create_by(name: name_brand).try(:id)
  end
end
