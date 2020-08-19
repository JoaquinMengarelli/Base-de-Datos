# 1
seleccione first_name, last_name
 del actor a  
  donde EXISTE ( seleccione  *
  			del actor a2
  			donde  a . apellido  =  a2 . apellido
  			y  a . actor_id  <>  a2 . actor_id )
   ordenar por apellido;
   
  
# 2
seleccione first_name, last_name
del actor a
donde NO EXISTE ( seleccione  fa . actor_id 
			de film_actor fa
			donde  fa . actor_id  =  a . actor_id );
		
		
# 3
seleccione  c . primer nombre , c . apellido 
del cliente c
donde (( select  count ( * ) de r2 de alquiler donde  r2 . customer_id  =  c . customer_id ) =  1 );


# 4
seleccione  c . primer nombre , c . apellido 
del cliente c
donde (( select  count ( * ) de r2 de alquiler donde  r2 . customer_id  =  c . customer_id ) >  1 );

# Otra forma
SELECCIONAR  c . customer_id , first_name, last_name
  DESDE alquiler r1, cliente c
 DONDE  c . customer_id  =  r1 . Identificación del cliente
   Y NO EXISTE ( SELECCIONAR  *
                     DESDE alquiler r2
 		            DONDE  r1 . customer_id  =  r2 . Identificación del cliente
 		              Y  r1 . alquiler_id  <>  r2 . alquiler_id );
 		             
# 5
seleccione first_name, last_name
del actor
donde actor_id en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . título  en ( ' TRAICION TRASERO ' , ' CAPTURA AMISTAD ' ));
 				
 			
 			
# 6
seleccione first_name, last_name
del actor
donde actor_id en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . title  =  ' TRICIONADO TRASERO ' )
y actor_id no está en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . title  =  ' CAPTAR AMISTAD ' );
 				
 				
# 7
seleccione first_name, last_name
del actor
donde actor_id en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . title  =  ' TRICIONADO TRASERO ' )
y actor_id en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . title  =  ' CAPTAR AMISTAD ' );
 				
 				
# 8
seleccione first_name, last_name
del actor
donde actor_id no está en ( seleccione  actor . actor_id 
 				del actor, película f, film_actor fa
 				donde  actor . actor_id  =  fa . actor_id 
 				y  fa . film_id  =  f . film_id 
 				y  f . título  en ( ' TRAICION TRASERO ' , ' CAPTURA AMISTAD ' ));
        
	
