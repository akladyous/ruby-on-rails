
    validates_presence_of  :name, :species, :birthdate, :weight, :gender, :color
    validates :gender, inclusion: {in: %W('male' 'female')}
    validates :color, length: {minimum:3, maximum:100}
    validates :weight, numericality: {only_integer: true}


    # required_fields = {}
    # debugger
    # Pets::Pet.validators.each do | validator |
        # validator.attributes.each do |attr|
            # {}.
            # required_fields[validator.kind] = { } lambda { |attr| }
        # end
        # required_fields [v.kind] = v.attributes
        # required_fields << v.attributes.first if v.kind == :presence
    # end
    # puts required_fields
end

def constrains(model_name)
    model_name.validators.each_with_object({}) do | valitator, hash |
        hash[valitator] = valitator.attributes
    ends

------------------------------------------------------------------------------------

    <%= content_tag :div, nil, class: 'form-group' do %>
        <%= model_attributes.keys.each do |k,v| -%>
            <%= form.label k, class: 'form-label' %>
            <%= form.number_field :species, class: 'form-control' %>
        <% end %>
    <% end %>

------------------------------------------------------------------------------------

def constrains()
        {
            name: {
                presence: {message: '^name is required'},
                length: {minimum:3, maximum: 64, message: '^name must be between 6 and 64 characters'}
            },
            species: {
                presence: {message: '^name is required'},
                in: ['one', 'two', 'three']
            }
        }
    end


    def attribute_map
        # v1 = Pets::Pet.validators_on(:gender).each_with_object({}) { |o,h| h['validator'] = {type: o.kind, options: o.options} }

        Pets::Pet.validators_on(:color).each_with_object({}) do |o,h|
            h[o.kind]= o.options
            # h[o.kind.to_s]= o.options
            h['validator'] = { type: o.kind, options: o.options.empty? ? nil : o.options }
    end
    end

    def model_attributes
        # Pets::Pet.attribute_names.reject { |att| att if %w(id created_at updated_at).include? att }.map &:to_sym

        Pets::Pet.columns_hash.each_with_object({}) {  |col, hash|
            validators = Pets::Pet.validators_on(col.first).each_with_object({}) { |o,h| h['validator'] = {type: o.kind, options: o.options.empty? ? nil : o.options} }
            hash[col.first] = {
                type: col.last.type
            }.merge(validators)
        }
            .reject { |k,_| k if %w(id created_at updated_at).include? k.to_s }
            .transform_keys &:to_sym
    end
