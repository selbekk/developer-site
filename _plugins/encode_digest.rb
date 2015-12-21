require 'base64'
require 'digest/md5'
require "mimemagic"

module Bring
  module Base64AndHashFilters
    def base64_encode(input)
      Base64.encode64(input)
    end
    def base64_decode(input)
      Base64.decode64(input)
    end
    def md5(input)
      Digest::MD5.hexdigest(input)
    end
  end
  module Tags
    class Base64EncodeTag < Liquid::Tag
      def initialize(tag_name, file, options)
        @file = file.strip
        super
      end
      def render(context)
        encode_file
      end
      def encode_file
        f = open(@file)
        encoded_file = Base64.strict_encode64(f.read)
        data_type = MimeMagic.by_magic(f)
        f.close
        "data:#{data_type};base64, #{encoded_file}"
      end
    end
  end
end

Liquid::Template.register_filter(Bring::Base64AndHashFilters)
Liquid::Template.register_tag('base64', Bring::Tags::Base64EncodeTag)
