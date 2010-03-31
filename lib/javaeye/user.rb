module JavaEye
  class User

    %w[name domain id logo].each do |attr|
      attr_accessor attr.to_sym
      attr_accessor :res_code
    end

    def initialize(hash)
      hash.each do |key,value|
        send("#{key}=",value)
      end
    end

  end
end