module CarrierWave
  module MiniMagick
    def from_orientation(landscape, portrait)
      manipulate! do |img|
        if img[:width] > img[:height] # Landscape
          width, height = landscape
        else # Portrait
          width, height = portrait
        end
        img.resize "#{width}x#{height}>"
        img
      end
    end
  end
end

