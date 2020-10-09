# frozen_string_literal: true

# /lib/crawler/crawler_category.rb
class CrawlerCategory
  def logger
    @logger ||= Logger.new(Rails.root.join('log', 'crawler', 'crawler_categoty.log'))
  end

  def crawler
    page = Base.new('https://www.bocotrangdiem.net/').init_noko_data
    arr_text = page.css('.ddsmoothmenu ul li a[title]').map(&:text)
    arr_text.map { |value| Brand.find_or_create_by(name: value) }
  rescue StandardError
    logger.error "Có lỗi khi crawler data danh mục \n#{e}"
  end
end
