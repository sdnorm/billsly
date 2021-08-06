module ApplicationHelper
  include Pagy::Frontend

  def avatar_url_for(user, opts = {})
    size = opts[:size] || 48

    if user.respond_to?(:avatar) && user.avatar.attached? && user.avatar.variable?
      user.avatar.variant(
        thumbnail: "#{size}x#{size}^",
        gravity: "center",
        extent: "#{size}x#{size}"
      )
    else
      gravatar_url_for(user.email, size: size)
    end
  end

  def disable_with(text)
    "<i class=\"far fa-spinner-third fa-spin\"></i> #{text}".html_safe
  end

  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end

  def fa_icon(name, options = {})
    weight = options.delete(:weight) || "far"
    options[:class] = [weight, "fa-#{name}", options.delete(:class)]
    tag.i(nil, **options)
  end

  def badge(text, options = {})
    base = options.delete(:base) || "rounded-full py-1 px-4 text-xs inline-block font-bold leading-normal uppercase mr-2"
    color = options.delete(:color) || "bg-gray-400 text-gray-700"
    options[:class] = Array.wrap(options[:class]) + [base, color]
    tag.div(text, **options)
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
      error:   "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  # def default_meta_tags
  #   {
  #     site: 'Billsly.co',
  #     title: 'Billsly',
  #     reverse: true,
  #     separator: '|',
  #     description: 'Get paid on time... Every time.',
  #     keywordsL 'service provider, lawn, pool, maid, home services, billing',
  #     canonical: request.original_url,
  #     noindex: !Rails.env.production?,
  #     icon: [
  #       # should be logo or favicon things
  #       { href: image_url('guy_phone_card.jpg') },
  #       { href: image_url('guy_phone_card.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
  #     ],
  #     og: {
  #       site_name: 'Billsly.co',
  #       title: 'Billsly',
  #       description: 'Get paid on time... Every time.',
  #       type: 'website',
  #       url: request.original_url,
  #       image: image_url('guy_phone_card.jpg')
  #     }
  #   }
  # end
end
