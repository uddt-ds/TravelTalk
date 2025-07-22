//
//  DateManager.swift
//  TravelTalk
//
//  Created by Lee on 7/22/25.
//

import UIKit

struct DateManager {
    static let shared = DateManager()

    let formatter = DateFormatter()
    let formatter2 = DateFormatter()

    private init() {}
}

// 아래 코드 공부 중...
// DateFormatter 자체에 대한 이해가 떨어져서 학습 필요

//1. 열거형으로 DateFormat 구현
enum DateFormat: String {
    case totalDate = "YYYY.MM.dd HH:mm"
    case yearMonthDate = "YY. MM. dd"
    case time = "HH:mm a"
}


//2. DateFormat extension :
// a, b, c, d, e 화면이 있다고 했을 때 a, b에 주로 머무르고 c, d, e를 안가는 경우에는 유용할 수 있음
// 현재 과제에서는 그다지 유용한 방법은 아닌 상황

extension DateFormat {
    // 싱글턴 패턴으로 cachedFormatters 생성(NSString을 key로, DateFormatter를 value로 캐시)
    private static var cachedFormatters: NSCache<NSString, DateFormatter> = .init()

    // formatter 프로퍼티를 생성하면서 cachedFormatter 타입 메서드 호출, 타입 메서드의 return으로 DateFormatter 생성
    var formatter: DateFormatter {
        Self.cachedFormatter(ofDateFormat: rawValue)
    }

    static func cachedFormatter(ofDateFormat dateFormat: String) -> DateFormatter {
        // NSString으로 rawValue를 key값으로 설정
        let dateFormatKey = NSString(string: dateFormat)
        // cahcedFormatters에 key에 해당하는 값이 있으면 해당 값을 return
        if let cachedFormatter = cachedFormatters.object(forKey: dateFormatKey) {
            return cachedFormatter
        }

        // 없으면 formatter 생성. rawValue를 넣어준 formatter를 만들고,
        let formatter = makeFormatter(withDateFormat: dateFormat)
        // 해당 키를 사용해서 cachedFormatters에 formatter를 저장
        cachedFormatters.setObject(formatter, forKey: dateFormatKey)
        // formatter 리턴
        return formatter
    }

    private static func makeFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        // formatter 만들어주고
        let formatter = DateFormatter()
        // dateFormat에 만들어준 formatter 할당
        formatter.dateFormat = dateFormat
        // locale을 kr로 설정
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
}

extension Date {
    func formattedString(dateFormat: DateFormat) -> String {
        //딕셔너리로 캐싱된 DateFormatter를 재사용
        return dateFormat.formatter.string(from: self)
    }
}
