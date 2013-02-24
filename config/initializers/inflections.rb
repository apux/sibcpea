# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.plural /(r|n|d|l)$/i, '\1es'
  inflect.plural /(ia)$/i, '\1s'
  inflect.plural /(z)$/i, '\ces'
  inflect.singular /([aeiou][rndl])es$/i, '\1'

  inflect.irregular 'profesor_ciclo', 'profesores_ciclos'
  inflect.irregular 'ProfesorCiclo', 'ProfesoresCiclos'
  inflect.irregular 'profesor_materia', 'profesores_materias'
  inflect.irregular 'ProfesorMateria', 'ProfesoresMaterias'
  inflect.irregular 'alumno_ciclo', 'alumnos_ciclos'
  inflect.irregular 'AlumnoCiclo', 'AlumnosCiclos'
  inflect.irregular 'avance_programatico', 'avances_programaticos'
  inflect.irregular 'AvanceProgramatico', 'AvancesProgramaticos'
  inflect.irregular 'registro_avance_programatico', 'registros_avances_programaticos'
  inflect.irregular 'RegistroAvanceProgramatico', 'RegistrosAvancesProgramaticos'
  inflect.irregular 'resumen_avance_programatico', 'resumenes_avances_programaticos'
  inflect.irregular 'ResumenAvanceProgramatico', 'ResumenesAvancesProgramaticos'
  inflect.irregular 'calendario_entrega', 'calendarios_entrega'
  inflect.irregular 'CalendarioEntrega', 'CalendariosEntrega'
  inflect.irregular 'fecha_entrega', 'fechas_entrega'
  inflect.irregular 'FechaEntrega', 'FechasEntrega'
  inflect.irregular 'recurso_laboratorio', 'recursos_laboratorio'
  inflect.irregular 'RecursoLaboratorio', 'RecursosLaboratorio'
  inflect.irregular 'calendario_recurso', 'calendario_recursos'
  inflect.irregular 'CalendarioRecurso', 'CalendarioRecursos'
end
