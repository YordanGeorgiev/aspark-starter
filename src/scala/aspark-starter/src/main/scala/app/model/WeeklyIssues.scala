package app.model 

import java.math.BigDecimal 


case class WeeklyIssue (

   level: 			Int
 , seq: 				Int
 , prio: 			Int
 , status: 			String
 , tags: 			String
 , category: 		String
 , name: 			String
 , description: 	String
 , start_time: 	String
 , stop_time: 		String
 , planned_hours: BigDecimal
 , actual_hours: 	BigDecimal
 , _type: 			String
 , owner: 			String
 , guid: 			String

)
