# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb
# Geographic hierarchy seed for Argentina / Mendoza
# Models assumed:
#   Country   has_many :provinces
#   Province  belongs_to :country, has_many :departments
#   Department belongs_to :province, has_many :districts
#   District  belongs_to :department
#
# Minimal attributes used: name (string). Add code, iso, etc. if your schema has them.

puts "Seeding / Mendoza..."


Winery.delete_all

District.delete_all
Department.delete_all
Province.delete_all
Country.delete_all



# ---------------------------------------------------------------------------
# Country
# ---------------------------------------------------------------------------
argentina = Country.find_or_create_by!(name: "Argentina") do |c|
  c.iso2 = "AR"
  c.iso3  = "ARG"
end

# ---------------------------------------------------------------------------
# Province
# ---------------------------------------------------------------------------
mendoza = Province.find_or_create_by!(name: "Mendoza", country: argentina)

# ---------------------------------------------------------------------------
# Departments + Districts
# Data source: official administrative division of Mendoza Province
# (Capital uses "secciones", the rest use "distritos")
# ---------------------------------------------------------------------------

departments_data = {
  "Capital" => [
    { name: "1ª Sección Parque Central" },
    { name: "2ª Sección Barrio Cívico" },
    { name: "3ª Sección Parque O'Higgins" },
    { name: "4ª Sección Área Fundacional" },
    { name: "5ª Sección Residencial Sur" },
    { name: "6ª Sección Residencial Norte" },
    { name: "7ª Sección Residencial Parque" },
    { name: "8ª Sección Aeroparque" },
    { name: "9ª Sección Parque General San Martín" },
    { name: "10ª Sección Residencial Los Cerros" },
    { name: "11ª Sección San Agustín" },
    { name: "12ª Sección Piedemonte" }
  ],

  "General Alvear" => [
    { name: "Bowen" },
    { name: "General Alvear" },
    { name: "San Pedro del Atuel" },
    { name: "Colonia Alvear Oeste" }
  ],

  "Godoy Cruz" => [
    { name: "Gobernador Benegas" },
    { name: "Godoy Cruz" },
    { name: "Las Tortugas" },
    { name: "Presidente Sarmiento" },
    { name: "San Francisco del Monte" },
    { name: "Trapiche" },
    { name: "Villa Marini" },
    { name: "Villa Hipódromo" },
    { name: "Villa del Parque" }
  ],

  "Guaymallén" => [
    { name: "Belgrano" },
    { name: "El Bermejo" },
    { name: "Buena Nueva" },
    { name: "Capilla del Rosario" },
    { name: "Colonia Molina" },
    { name: "Colonia Segovia" },
    { name: "Dorrego" },
    { name: "El Sauce" },
    { name: "Jesús Nazareno" },
    { name: "Kilómetro 8" },
    { name: "Kilómetro 11" },
    { name: "La Primavera" },
    { name: "Las Cañas" },
    { name: "Los Corralitos" },
    { name: "Nueva Ciudad" },
    { name: "Pedro Molina" },
    { name: "Puente de Hierro" },
    { name: "Rodeo de la Cruz" },
    { name: "San Francisco del Monte" },
    { name: "San José" },
    { name: "Villa Nueva" }
  ],

  "Junín" => [
    { name: "Algarrobo Grande" },
    { name: "Alto Verde" },
    { name: "Ingeniero Giagnoni" },
    { name: "Junín" },
    { name: "La Colonia" },
    { name: "Los Barriales" },
    { name: "Medrano" },
    { name: "Mundo Nuevo" },
    { name: "Phillips" },
    { name: "Rodríguez Peña" }
  ],

  "La Paz" => [
    { name: "La Paz Norte" },
    { name: "La Paz Sur" },
    { name: "Desaguadero" },
    { name: "Villa Antigua" },
    { name: "Villa Nueva (Cabecera) de La Paz" }
  ],

  "Las Heras" => [
    { name: "Capdevilla" },
    { name: "El Algarrobal" },
    { name: "El Borbollón" },
    { name: "El Challao" },
    { name: "El Pastal" },
    { name: "El Plumerillo" },
    { name: "El Resguardo" },
    { name: "El Zapallar" },
    { name: "La Cieneguita" },
    { name: "Las Cuevas" },
    { name: "Las Heras" },
    { name: "Panquehua" },
    { name: "Uspallata" },
    { name: "Puente del Inca" },
    { name: "Los Penitentes" }
  ],

  "Lavalle" => [
    { name: "Alto del Olvido" },
    { name: "Colonia Italia" },
    { name: "Costa de Araujo" },
    { name: "El Carmen" },
    { name: "El Chilcal" },
    { name: "El Plumero" },
    { name: "El Vergel" },
    { name: "Gustavo André" },
    { name: "Jocolí" },
    { name: "Jocolí Viejo" },
    { name: "La Bajada" },
    { name: "La Asunción" },
    { name: "La Holanda" },
    { name: "La Palmera" },
    { name: "La Pega" },
    { name: "Las Violetas" },
    { name: "Lagunas del Rosario" },
    { name: "El Paramillo" },
    { name: "San Francisco" },
    { name: "San José" },
    { name: "San Miguel" },
    { name: "Tres de Mayo" },
    { name: "Villa Tulumaya" },
    { name: "Oscar Mendoza" }
  ],

  "Luján de Cuyo" => [
    { name: "Agrelo", wineries: [
      { name: "Belasco de Baquedano", address: "Cobos 8260", website: "belascodebaquedano.com" },
      { name: "Catena Zapata", address: "Cobos s/n", website: "catenazapata.com" },
      { name: "Chandon", address: "Ruta Pcial. 15 Km 29", website: "chandon.com.ar" },
      { name: "Dominio del Plata", address: "Cochabamba 7801", website: "dominiodelplata.com.ar" },
      { name: "Susana Balbo", address: "Cochabamba 7801", website: "susanabalbowines.com" },
      { name: "Ruca Malen", address: "Ruta Nacional 7", website: "bodegarucamalen.com" },
      { name: "Séptima", address: "Ruta Internacional N°7 Km 1061", website: "bodegaseptima.com" },
      { name: "Pulenta Estate", address: "Ruta Provincial 86 km 6,5", website: "pulentaestate.com" },
      { name: "Bressia", address: "Cochabamba 7725", website: "bressiabodega.com" },
      { name: "Dolium", address: "RP15 Km 30" }
    ]},
    { name: "Cacheuta" },
    { name: "Carrodilla" },
    { name: "Chacras de Coria", wineries: [
      { name: "Alta Vista", address: "Alzaga 3972 / Álzaga 392", website: "altavistawines.com" },
      { name: "Clos de Chacras", address: "Monte Líbano 1025", website: "closdechacras.com.ar" }
    ]},
    { name: "El Carrizal" },
    { name: "Industrial" },
    { name: "La Puntilla" },
    { name: "Las Compuertas", wineries: [
      { name: "Durigutti Family Winemakers", address: "Callejón de la Reta s/n", website: "durigutti.com" }
    ]},
    { name: "Luján de Cuyo", wineries: [
      { name: "Viña Cobos", address: "Costa Flores, S/N y RN7,", website: "vinacobos.com" },
      { name: "Kaiken", address: "Roque Sáenz Peña 5516", website: "kaikenwines.com" },
      { name: "Renacer", address: "Brandsen 1863", website: "bodegarenacer.com.ar" }
    ]},
    { name: "Mayor Drummond", wineries: [
      { name: "Benegas", address: "Aráoz 1600", website: "bodegabenegas.com" },
      { name: "Lagarde", address: "San Martín 1745", website: "lagarde.com.ar" },
      { name: "Carmelo Patti", address: "San Martín 2614", website: "bodegacarmelopatti.com" }
    ]},
    { name: "Perdriel", wineries: [
      { name: "Achaval Ferrer", address: "Calle Cobos 2601 (esq. Bella Vista)", website: "achaval-ferrer.com" },
      { name: "Bodega A16", address: "Cobos 5890", website: "a16sa.com" },
      { name: "Bodega Norton", address: "Ruta 15 km 23.5", website: "norton.com.ar" }
    ]},
    { name: "Potrerillos" },
    { name: "Ugarteche", wineries: [
      { name: "Alpamanta", address: "Calle Cobos s/n", website: "alpamanta.com"},
      { name: "Familia Blanco", address: "Ruta 86 km 7", website: "familiablancowines.com" }
    ] },
    { name: "Vistalba", wineries: [
      { name: "Nieto Senetiner", address: "Guardia Vieja 2000", website: "nietosenetiner.com.ar" }
    ]},
    { name: "Vertientes del Pedemonte" }
  ],

  "Maipú" => [
    { name: "Colonia Bombal" },
    { name: "Coquimbito", wineries: [
      { name: "Bodega La Rural", address: "Montecaseros 2625", website: "larural.com.ar" }
    ]},
    { name: "Cruz de Piedra", wineries: [
      { name: "Argento", address: "Juan de la Cruz Videla S/N", website: "bodegaargento.com" },
      { name: "CarinaE", address: "Videla Aranda 2899", website: "linktr.ee/bodegaCarinae" }
    ]},
    { name: "Fray Luis Beltrán" },
    { name: "General Gutiérrez", wineries: [
      { name: "López", address: "Ozamis Norte 375", website: "bodegaslopez.com.ar" }
    ]},
    { name: "General Ortega" },
    { name: "Las Barrancas", wineries: [
      { name: "Finca Flichman", address: "Munives 800", website: "flichman.com.ar" }
    ]},
    { name: "Lunlunta" },
    { name: "Luzuriaga" },
    { name: "Maipú", wineries: [
      { name: "Trapiche", address: "C. Nueva Mayorga s/n", website: "trapiche.com.ar" },
      { name: "Santa Julia", address: "RP33 km 7,5", website: "santajulia.com.ar" },
      { name: "Tempus Alba", address: "BPS, Moreno 572", website: "tempusalba.com" },
      { name: "Trivento", address: "Ruta 60 y Canal Pescara", website: "trivento.com" },
      { name: "Casa Vigil", address: "Videla Aranda 7008", website: "universovigil.com" }
    ]},
    { name: "Rodeo del Medio" },
    { name: "Russell", wineries: [
      { name: "Antigal", address: "Maza y Manuel A. Sáez", website: "antigal.com" }
    ]},
    { name: "San Roque" },
    { name: "Santa Blanca" }
  ],

  "Malargüe" => [
    { name: "Agua Escondida" },
    { name: "Malargüe" },
    { name: "Río Barrancas" },
    { name: "Río Grande" }
  ],

  "Rivadavia" => [
    { name: "Andrade" },
    { name: "El Mirador" },
    { name: "La Central" },
    { name: "La Libertad" },
    { name: "Los Árboles" },
    { name: "Los Campamentos" },
    { name: "Los Huarpes" },
    { name: "Medrano" },
    { name: "Mundo Nuevo" },
    { name: "Reducción" },
    { name: "Rivadavia" },
    { name: "Santa María de Oro" },
   { name:  "San Isidro" }
  ],

  "San Carlos" => [
    { name: "Chilecito" },
    { name: "Eugenio Bustos" },
    { name: "La Consulta" },
    { name: "Pareditas" },
    { name: "Villa San Carlos", wineries: [
      { name: "Zuccardi", address: "Costa Canal Uco s/n - Paraje Altamira", website: "zuccardiwines.com" }
    ]}
  ],

  "San Martín" => [
    { name: "Alto Salvador" },
    { name: "Alto Verde" },
    { name: "Buen Orden" },
    { name: "Chapanay" },
    { name: "Chivilcoy" },
    { name: "El Central" },
    { name: "El Divisadero" },
    { name: "El Espino" },
    { name: "El Ramblón" },
    { name: "Ingeniero Giagnoni" },
    { name: "Las Chimbas" },
    { name: "Montecaseros" },
    { name: "Nueva California" },
    { name: "Palmira" },
    { name: "San Martín" },
    { name: "Tres Porteñas" }
  ],

  "San Rafael" => [
    { name: "Cañada Seca" },
    { name: "Cuadro Benegas" },
    { name: "Cuadro Nacional" },
    { name: "El Cerrito" },
    { name: "El Nihuil" },
    { name: "El Sosneado" },
    { name: "Goudge" },
    { name: "Jaime Prats" },
    { name: "La Llave" },
    { name: "Las Malvinas" },
    { name: "Las Paredes" },
    { name: "Monte Comán" },
    { name: "Punta del Agua" },
    { name: "Rama Caída" },
    { name: "Real del Padre" },
    { name: "San Rafael" },
    { name: "Veinticinco de Mayo" },
    { name: "Villa Atuel" }
  ],

  "Santa Rosa" => [
    { name: "Doce de Octubre" },
    { name: "La Dormida" },
    { name: "Las Catitas" },
    { name: "Ñacuñan" },
    { name: "Ciudad de Santa Rosa" },
    { name: "El Marcado" }
  ],

  "Tunuyán" => [
    { name: "Campo de los Andes" },
    { name: "Colonia Las Rosas" },
    { name: "El Algarrobo" },
    { name: "El Totoral" },
    { name: "La Primavera" },
    { name: "Las Pintadas" },
    { name: "Los Árboles", wineries: [
      { name: "Bodegas Salentein", address: "GQ32+M2", website: "bodegasalentein.com" }
    ] },
    { name: "Los Chacayes" },
    { name: "Los Sauces" },
    { name: "Tunuyán", wineries: [
      { name: "Casa de Uco", address: "Ruta 94, kilómetro 14.5", website: "casadeuco.com" }
    ] },
    { name: "Villa Seca" },
    { name: "Vista Flores" }
  ],

  "Tupungato" => [
    { name: "Anchoris" },
    { name: "Cordón del Plata" },
    { name: "El Peral" },
    { name: "El Zampal" },
    { name: "El Zampalito" },
    { name: "Gualtallary" },
    { name: "La Arboleda" },
    { name: "La Carrera" },
    { name: "San José" },
    { name: "Santa Clara" },
    { name: "Tupungato" },
    { name: "Villa Bastías" },
    { name: "Zapata" }
  ]
}




departments_data.each do |dept_name, districts|
  department = Department.find_or_create_by!(name: dept_name, province: mendoza)

  districts.each do |district_attrs|
    district = District.find_or_create_by!(name: district_attrs[:name], department: department)

    if district_attrs[:wineries].present?
      district_attrs[:wineries].each do |winery_attrs|
        Winery.find_or_create_by!(name: winery_attrs[:name], district: district) do |w|
          w.website = winery_attrs[:website]
          w.address = winery_attrs[:address]
        end
      end
    end

  end
end

puts "Done!"
puts "  Country:    #{Country.count}"
puts "  Provinces:  #{Province.count}"
puts "  Departments:#{Department.count}"
puts "  Districts:  #{District.count}"
puts "  Wineries:  #{Winery.count}"

















Product.delete_all

p1 = Product.create(
  title: 'Salentein Portillo Merlot',
  description:
    %(<p>
      De color rojo brillante e intenso. Posee aromas que recuerdan a la guinda, mora y especias.
      En boca la fruta es concentrada, con taninos suaves y un final prolongado. Joven y frutado.
      Ideal para acompañar cerdo, pastas con salsas suaves, risottos y quesos semiduros.
      <p>),
  price: 5000
)
p1.image.attach(io: File.open(Rails.root.join('db', 'images', 'salentein', 'portillo_merlot.png')), filename: 'portillo_merlot.png')
p1.save!

p2 = Product.create(
  title: 'Salentein Portillo Tempranillo',
  description:
    %(<p>
      De color rojo rubí. Posee aromas a frutas rojas maduras, como la ciruela, guinda y mora.
      En boca se presenta fresco y frutado, con taninos dulces y buena concentración.
      Ideal para acompañar guisos, paellas, quesos duros y semiduros.
      <p>),
  price: 5000
)
p2.image.attach(io: File.open(Rails.root.join('db', 'images', 'salentein', 'portillo_tempranillo.png')), filename: 'portillo_tempranillo.png')
p2.save!

p3 = Product.create(
  title: 'Salentein Portillo Syrah',
  description:
    %(<p>
      De color rojo, con tonos azulados intensos y brillantes.
      Sus aromas recuerdan a especias y frutos rojos con el característico toque cárnico del Syrah.
      En boca es un vino de entrada suave, donde se perciben frutas con buena intensidad, una sutil nota especiada
      y sobre el final de boca una sensación dulce aportada por sus taninos.
      <p>),
  price: 5000
)
p3.image.attach(io: File.open(Rails.root.join('db', 'images', 'salentein', 'portillo_syrah.png')), filename: 'portillo_syrah.png')
p3.save!
