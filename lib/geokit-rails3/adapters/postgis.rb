module Geokit
  module Adapters
    class Postgis < Abstract
      
      def sphere_distance_sql(lat, lng, multiplier)
        %|
          ST_Distance(#{qualified_geom_column_name}, ST_GeographyFromText('POINT(#{lng} #{lat})'))
         |
      end
      
      def flat_distance_sql(origin, lat_degree_units, lng_degree_units)
        %|
          ST_Distance(#{qualified_geom_column_name}, ST_GeographyFromText('POINT(#{lng_degree_units} #{lat_degree_units})'))
         |
      end
    end
  end
end