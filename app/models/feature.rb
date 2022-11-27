class Feature
  def self.enabled?(feature_name)
    case feature_name.to_sym
    when :paywalled_search_results
      !Rails.env.production?
    when :redirect_db_id_profiles
      # Remove 2 weeks after deploy to let Google index.
      true
    when :redesign
      ENV.fetch("REDESIGN", false)
    else
      raise "Unknown feature name: #{feature_name}"
    end
  end
end
