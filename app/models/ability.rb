class Ability
  include CanCan::Ability

  def initialize(usuario)
    usuario ||= Usuario.new
    if usuario.permiso? :jefe_carrera or usuario.permiso? :profesor
      can :read, :all
      can :create, [Asesoria, Asistencia, AsistenciaGrupo, AvanceProgramatico, Aviso, Calificacion, Comentario, RegistroTutoria, Tutoria]

      can [:update, :destroy], Asistencia do |asistencia|
        asistencia.asistencia_grupo.profesor_materia.profesor_ciclo.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], AsistenciaGrupo do |asistencia_grupo|
        asistencia_grupo.profesor_materia.profesor_ciclo.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], AvanceProgramatico do |avance_programatico|
        avance_programatico.profesor_materia.profesor_ciclo.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], Calificacion do |calificacion|
        calificacion.profesor_materia.profesor_ciclo.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], RegistroTutoria do |registro_tutoria|
        registro_tutoria.tutoria.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], Tutoria do |tutoria|
        tutoria.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], Asesoria do |asesoria|
        asesoria.profesor_id == usuario.profesor_id
      end
      can [:update, :destroy], Usuario  do |_usuario|
        _usuario.id == usuario.id
      end
      cannot :read, Asesoria
      can :read, Asesoria do |asesoria|
        asesoria.profesor_id == usuario.profesor_id
      end
      cannot :read, RegistroTutoria
      can :read, RegistroTutoria do |registro_tutoria|
        registro_tutoria.tutoria.profesor_id == usuario.profesor_id
      end
      cannot :read, ProfesorCiclo
      can :read, ProfesorCiclo do |profesor_ciclo|
        profesor_ciclo.profesor_id == usuario.profesor_id
      end
      can [:reporte, :genera_reporte], [Asesoria, Tutoria, AsistenciaGrupo, Calificacion, AvanceProgramatico]

      can :update, [Aviso, Comentario], :usuario_id => usuario.id
      can :lista, AsistenciaGrupo
      can :semana, Laboratorio

      can [:read, :update, :destroy], Calificacion do |calificacion|
        calificacion && calificacion.profesor_materia.profesor_ciclo.profesor_id == usuario.profesor_id
      end

      can :manage, Documento
    end

    if usuario.permiso? :jefe_carrera
      can :manage, [AlumnoCiclo, Alumno, Aula, CalendarioEntrega, Ciclo, Instituto, Egresado, Generacion, Grupo, Laboratorio, Materia, Permiso, ProfesorCiclo, Profesor, ProfesorMateria, RecursoLaboratorio, Semestre, Tutoria, Carrera]
      can [:create, :update], [CalendarioRecurso, Laboratorio, RecursoLaboratorio]
    end

    if usuario.permiso? :profesor
      cannot :read, Permiso
    end

    if usuario.permiso? :encargado_laboratorio
      can :read, [AlumnoCiclo, Alumno, Ciclo, Instituto, Egresado, Generacion, Grupo, Materia, Semestre]
      can :manage, [CalendarioRecurso, Laboratorio, RecursoLaboratorio, Documento]
      can :create, [Aviso, Comentario]
      can :update, [Aviso, Comentario], :usuario_id => usuario.id
    end

    if usuario.permiso? :secretaria
      can :manage, [AlumnoCiclo, Alumno, Aula, CalendarioEntrega, Ciclo, Instituto, Egresado, Generacion, Grupo, Materia, ProfesorCiclo, Profesor, ProfesorMateria, Semestre, Carrera, Documento]
      can :create, [Aviso, Comentario]
      can :update, [Aviso, Comentario], :usuario_id => usuario.id
      can :read, [Asistencia, AvanceProgramatico, CalendarioRecurso, Calificacion, Laboratorio, RecursoLaboratorio]
      can :semana, Laboratorio
    end

    can :read, [Aviso, Comentario]
    can :consultar, Aviso
  end
end
