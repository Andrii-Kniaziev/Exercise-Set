package com.kniaziev.ua.exerciseset.web

import com.kniaziev.ua.exerciseset.domain.ExerciseSet
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("api/v1/exercise-sets")
class ExerciseSetController {

    @GetMapping
    fun getExerciseSets(): ResponseEntity<List<ExerciseSet>> {
        return ResponseEntity(
            listOf(ExerciseSet("Morning", "For energy for a day", 123)),
            HttpStatus.OK
        )
    }
}