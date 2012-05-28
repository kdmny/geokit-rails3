module Geokit
  module Adapters
    class PostGIS < Abstract
      
      def sphere_distance_sql(origin, d)
        %|
          ST_DWithin(#{qualified_geom_column_name}, ST_GeographyFromText('POINT(#{origin.lng} #{origin.lat})'), #{d})
         |
      end      
    end
  end
end