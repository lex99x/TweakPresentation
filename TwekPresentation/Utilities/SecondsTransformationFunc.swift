//
//  BlankManager.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 31/10/22.
//

import Foundation

func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
    let tempoFormatado = DateComponentsFormatter()
    tempoFormatado.allowedUnits = [.hour,.minute,.second]
    tempoFormatado.unitsStyle = .positional
    tempoFormatado.zeroFormattingBehavior = .pad
    let tempoFormatadoString = tempoFormatado.string(from: TimeInterval(seconds))!
    return tempoFormatadoString
}

func secondsToMinutesSeconds(_ seconds: Int) -> String {
    let tempoFormatado = DateComponentsFormatter()
    tempoFormatado.allowedUnits = [.minute,.second]
    tempoFormatado.unitsStyle = .positional
    tempoFormatado.zeroFormattingBehavior = .pad
    let tempoFormatadoString = tempoFormatado.string(from: TimeInterval(seconds))!
    return tempoFormatadoString
}
func secondsToMinutesSecondsWithText(_ seconds: Int) -> String {
    let tempoFormatado = DateComponentsFormatter()
    tempoFormatado.allowedUnits = [.minute,.second]
    tempoFormatado.unitsStyle = .brief
    tempoFormatado.zeroFormattingBehavior = .pad
    let tempoFormatadoString = tempoFormatado.string(from: TimeInterval(seconds))!
    return tempoFormatadoString

}

func dayTimeToSeconds(hour: Int, minute: Int, second: Int) -> Int {
    return hour * 3600 + minute * 60 + second
}

func formatDayTime(hour: Int, minute: Int, second: Int) -> String {
    let formatedTime = DateComponentsFormatter()
    formatedTime.allowedUnits = [.hour, .minute, .second]
    formatedTime.unitsStyle = .positional
    formatedTime.zeroFormattingBehavior = .pad
    return formatedTime.string(from: TimeInterval(dayTimeToSeconds(hour: hour, minute: minute, second: second)))!
}
