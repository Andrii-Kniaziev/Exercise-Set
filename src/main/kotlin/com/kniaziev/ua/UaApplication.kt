package com.kniaziev.ua

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class UaApplication

fun main(args: Array<String>) {
	runApplication<UaApplication>(*args)
}
