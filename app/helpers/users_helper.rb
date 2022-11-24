module UsersHelper

    def get_roles
        {
            "Administrador" => :administrador,
            "Personal Bancario" => :personal_bancario
        }
    end
end