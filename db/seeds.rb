# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create!(:name => 'Daley', :city => cities.first)

puts 'Se ingresarán permisos (roles)'

Permiso.create!([
  {:tipo_permiso => "jefe_carrera", :descripcion => "Jefe de Carrera"},
  {:tipo_permiso => "profesor", :descripcion => "Profesor Investigador"},
  {:tipo_permiso => "encargado_laboratorio", :descripcion => "Encargado del Laboratorio"},
  {:tipo_permiso => "secretaria", :descripcion => "Secreataria del Instituto"},
])

puts 'Permisos ingresados'
puts 'Se ingresarán institutos'

instituto = Instituto.create!(:clave => "IUNO", :nombre => "Instituto uno", :descripcion => "Instituto UNO")
Instituto.create!([
  {:clave => "IDOS", :nombre => "Instituto dos", :descripcion => "Instituto DOS"},
  {:clave => "ITRES", :nombre => "Instituto tres", :descripcion => "Instituto TRES"}
])

puts 'Institutos ingresados'

puts 'Se ingresarán carreras'

Carrera.create!([
  {:clave => "01", :nombre => "Ing. en Computación"},
  {:clave => '02', :nombre => 'Ing. en Electrónica'},
  {:clave => '05', :nombre => "Ing. Industrial"}
])

puts 'Carreras ingresadas'

puts 'Se ingresarán profesores'

Profesor.create!(:numero_trabajador => "32342", :nombre => "MIGUEL", :apellido_paterno => "GARCÍA", :apellido_materno => "LÓPEZ")
Profesor.create!(:numero_trabajador => "32522", :nombre => "PATRICIA", :apellido_paterno => "MÉNDEZ", :apellido_materno => "CARIÑO")

puts 'Profesores ingresados'

puts 'Se ingresarán ciclos'

ciclo1 = Ciclo.create!(:clave => "2005-2006 A", :tipo => "1", :fecha_inicio => "2005/11/01".to_date, :fecha_fin => "2006/02/20")
Ciclo.create!([
  {:clave => "2005-2006 A", :tipo => "impar", :fecha_inicio => "2005/11/01".to_date, :fecha_fin => "2006/02/20"},
  {:clave => "2005-2006 B", :tipo => "par", :fecha_inicio => "2006/03/01".to_date, :fecha_fin => "2006/07/20"},
  {:clave => "2006-2007 A", :tipo => "impar", :fecha_inicio => "2006/11/01".to_date, :fecha_fin => "2007/02/20"},
  {:clave => "2006-2007 B", :tipo => "par", :fecha_inicio => "2007/03/01".to_date, :fecha_fin => "2007/07/20"},
  {:clave => "2007-2008 A", :tipo => "impar", :fecha_inicio => "2007/11/01".to_date, :fecha_fin => "2008/02/20"},
  {:clave => "2007-2008 B", :tipo => "par", :fecha_inicio => "2008/03/01".to_date, :fecha_fin => "2008/07/20"},
  {:clave => "2008-2009 A", :tipo => "impar", :fecha_inicio => "2008/11/01".to_date, :fecha_fin => "2009/02/20"},
  {:clave => "2008-2009 B", :tipo => "par", :fecha_inicio => "2009/03/01".to_date, :fecha_fin => "2009/07/20"},
  {:clave => "2009-2010 A", :tipo => "impar", :fecha_inicio => "2009/11/01".to_date, :fecha_fin => "2010/02/20"}
])
ciclo2 = Ciclo.create!(:clave => "2009-2010 B", :tipo => "2", :fecha_inicio => "2010/03/01".to_date, :fecha_fin => "2010/07/20")

puts 'Ciclos ingresados'

puts 'Se ingresará generaciones'

Generacion.create!(:clave => "2000-2005", :ciclo1_id => ciclo1.id, :ciclo2_id => ciclo2.id)

puts 'Generaciones ingresadas'
puts 'Se ingresará alumnos'

Alumno.create!([
  {:nombre => "AAA", :apellido_paterno => "AAA", :apellido_materno => "AAA", :sexo => "H", :matricula => "AAA", :porcentaje_beca => 0},
  {:nombre => "BBB", :apellido_paterno => "BBB", :apellido_materno => "BBB", :sexo => "H", :matricula => "BBB", :porcentaje_beca => 0},
  {:nombre => "CCC", :apellido_paterno => "CCC", :apellido_materno => "CCC", :sexo => "H", :matricula => "CCC", :porcentaje_beca => 0},
  {:nombre => "DDD", :apellido_paterno => "DDD", :apellido_materno => "DDD", :sexo => "M", :matricula => "DDD", :porcentaje_beca => 0},
  {:nombre => "EEE", :apellido_paterno => "EEE", :apellido_materno => "EEE", :sexo => "H", :matricula => "EEE", :porcentaje_beca => 0},
  {:nombre => "FFF", :apellido_paterno => "FFF", :apellido_materno => "FFF", :sexo => "H", :matricula => "FFF", :porcentaje_beca => 0},
])

puts 'Alumnos ingresados'

puts 'Se ingresarán semestres'

sem = Semestre.create!([
  {:numero => 1, :nombre => "PRIMERO", :descripcion => ""},
  {:numero => 2, :nombre => "SEGUNDO", :descripcion => ""},
  {:numero => 3, :nombre => "TERCERO", :descripcion => ""},
  {:numero => 4, :nombre => "CUARTO", :descripcion => ""},
  {:numero => 5, :nombre => "QUINTO", :descripcion => ""},
  {:numero => 6, :nombre => "SEXTO", :descripcion => ""},
  {:numero => 7, :nombre => "SÉPTIMO", :descripcion => ""},
  {:numero => 8, :nombre => "OCTAVO", :descripcion => ""},
  {:numero => 9, :nombre => "NOVENO", :descripcion => ""},
  {:numero => 10, :nombre => "DÉCIMO", :descripcion => ""}
])

puts 'Semestres ingresados'

puts 'Se ingresarán materias'

Materia.create!([
  {:clave => "1", :nombre => "MATERIA uno", :creditos => 10, :semestre => sem[0]},
  {:clave => "2", :nombre => "MATERIA dos", :creditos => 10, :semestre => sem[0]},
  {:clave => "3", :nombre => "MATERIA tres", :creditos => 10, :semestre => sem[1]},
  {:clave => "4", :nombre => "MATERIA cuatro", :creditos => 10, :semestre => sem[2]},
  {:clave => "5", :nombre => "MATERIA cinco", :creditos => 10, :semestre => sem[3]},
  {:clave => "6", :nombre => "MATERIA seis", :creditos => 10, :semestre => sem[3]},
  {:clave => "7", :nombre => "MATERIA siete", :creditos => 10, :semestre => sem[4]},
  {:clave => "8", :nombre => "MATERIA ocho", :creditos => 10, :semestre => sem[4]},
  {:clave => "9", :nombre => "MATERIA nueve", :creditos => 10, :semestre => sem[4]},
  {:clave => "10", :nombre => "MATERIA diez", :creditos => 10, :semestre => sem[4]},
  {:clave => "11", :nombre => "MATERIA once", :creditos => 10, :semestre => sem[4]},
  {:clave => "12", :nombre => "MATERIA doce", :creditos => 10, :semestre => sem[5]},
  {:clave => "13", :nombre => "MATERIA trece", :creditos => 10, :semestre => sem[6]},
  {:clave => "14", :nombre => "MATERIA catorce", :creditos => 10, :semestre => sem[6]},
  {:clave => "15", :nombre => "MATERIA quince", :creditos => 10, :semestre => sem[6]},
  {:clave => "16", :nombre => "MATERIA diez y seis", :creditos => 10, :semestre => sem[6]},
  {:clave => "17", :nombre => "MATERIA diez y siete", :creditos => 10, :semestre => sem[7]},
  {:clave => "18", :nombre => "MATERIA diez y ocho", :creditos => 10, :semestre => sem[7]},
  {:clave => "19", :nombre => "MATERIA diez y nueve", :creditos => 10, :semestre => sem[7]},
  {:clave => "20", :nombre => "MATERIA veinte", :creditos => 10, :semestre => sem[8]},
  {:clave => "21", :nombre => "MATERIA veintiuno", :creditos => 10, :semestre => sem[9]},
  {:clave => "22", :nombre => "MATERIA veintidos", :creditos => 10, :semestre => sem[9]}
])

puts 'Materias ingresadas'


puts 'Se ingresarán grupos'

Grupo.create!([
  {:nombre => '105 A', :semestre => sem[0]},
  {:nombre => '205 A', :semestre => sem[1]},
  {:nombre => '305 A', :semestre => sem[2]},
  {:nombre => '405 A', :semestre => sem[3]},
  {:nombre => '505 A', :semestre => sem[4]},
  {:nombre => '605 A', :semestre => sem[5]},
  {:nombre => '705 A', :semestre => sem[6]}
])

puts 'Grupos ingresados'



puts 'Se ingresarán profesores-ciclos'

ProfesorCiclo.create!([
  {
    :ciclo => Ciclo.last, :profesor => Profesor.first, 
    :profesores_materias_attributes => [
      {
        :materia => Materia.last, :grupo => Grupo.first,
        :hora1 => "10:00", 
        :hora2 => "10:00", 
        :hora3 => "10:00", 
        :hora4 => "10:00", 
        :hora5 => "10:00"
      }
    ]
  },
      {
    :ciclo => Ciclo.last, :profesor => Profesor.last, 
       :profesores_materias_attributes => [
         {
           :materia => Materia.last,
           :grupo => Grupo.find(2),
          :hora1 => "10:00", 
          :hora2 => "10:00 - 12:00", 
          :hora3 => "10:00", 
          :hora4 => "10:00", 
          :hora5 => "10:00"
         }
    ]
  },
  {
    :ciclo => Ciclo.first, :profesor => Profesor.first, 
    :profesores_materias_attributes => [
      {
        :materia => Materia.first, :grupo => Grupo.last,
        :hora1 => "10:00", 
        :hora2 => "10:00", 
              :hora3 => "10:00", 
              :hora4 => "10:00", 
              :hora5 => "10:00"
      }
    ]
  },
  {
    :ciclo => Ciclo.first, :profesor => Profesor.last, 
    :profesores_materias_attributes => [
      {
        :materia => Materia.first, :grupo => Grupo.find(3),
        :hora1 => "10:00", 
        :hora2 => "10:00 - 13:00", 
        :hora3 => "10:00", 
        :hora4 => "10:00", 
        :hora5 => "10:00"
      }
    ]
  },
])

puts 'Profesores-cilos ingresados'

puts 'Se ingresarán aulas'

Aula.create!([
  {:nombre => 'A-1'},
  {:nombre => 'A-2'},
  {:nombre => 'A-3'},
  {:nombre => 'A-4'},
  {:nombre => 'A-5'},
])

puts 'Aulas ingresadas'


puts 'Se ingresarán alumnos-ciclos'

AlumnoCiclo.create!(:alumno => Alumno.first, :ciclo => Ciclo.last, :grupo => Grupo.last)
AlumnoCiclo.create!(:alumno => Alumno.last, :ciclo => Ciclo.last, :grupo => Grupo.last)

puts "Alumnos-ciclos agregados"

puts 'Se ingresarán tutorias'

Tutoria.create!(:alumno => Alumno.first, :profesor => Profesor.first)
Tutoria.create!(:alumno => Alumno.last, :profesor => Profesor.last)

puts "Tutorias agregadas"

puts 'Se ingresarán registro-tutorias'

RegistroTutoria.create!(:tutoria => Tutoria.first, :fecha => Date.yesterday, :tiempo => 1, :asunto => 'Un asunto', :compromiso => 'Un compromiso')
RegistroTutoria.create!(:tutoria => Tutoria.last, :fecha => Date.today, :tiempo => 2, :asunto => 'Otro asunto', :compromiso => 'Otro compromiso')

puts "Registro-tutorias agregados"


puts "FIN DE SEEDS" 
