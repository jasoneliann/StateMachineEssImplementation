//
//  ExampleHelper.swift
//  StateMachine
//
//  Created by Jason Elian on 14/11/20.
//

import Foundation

func generateExampleEmailView() -> [EmailViewModel.Content] {
    var result: [EmailViewModel.Content] = []
    
    let loremIpsumDesc: String = """
    Justo dis morbi praesent inceptos turpis, sed hac class integer, sem imperdiet rutrum cursus.
    Habitant porta vivamus enim odio nisl euismod risus class imperdiet tortor cubilia, justo nam nulla nisi fusce
    elementum egestas eleifend lacinia penatibus sit, phasellus velit augue iaculis ac erat bibendum maecenas leo cum.
    Ut tincidunt nascetur suscipit mi fermentum auctor, lectus consequat habitasse taciti.
    """
    
    let emailView1 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "First Email",
                desc: "First, " + loremIpsumDesc
            ),
            timestamp: Date(),
            state: .normal
        )
    )
    
    let emailView2 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "Second Email",
                desc: "Second, " + loremIpsumDesc
            ),
            timestamp: Date() - minusDays(manyDays: 0.5),
            state: .normal
        )
    )
    
    let emailView3 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "Third Email",
                desc: "Third, " + loremIpsumDesc
            ),
            timestamp: Date() - minusDays(manyDays: 3),
            state: .normal
        )
    )
    
    let emailView4 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "Fourth Email",
                desc: "Fourth, " + loremIpsumDesc
            ),
            timestamp: Date() - minusDays(manyDays: 4),
            state: .normal
        )
    )
    
    let emailView5 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "Fifth Email",
                desc: "Fifth, " + loremIpsumDesc
            ),
            timestamp: Date(timeIntervalSince1970: 1605427894),
            state: .normal
        )
    )
    
    let emailView6 = EmailViewModel.Content(
        email: EmailCell.Content(
            titleDesc: TitleDescView.Content(
                title: "Sixth Email",
                desc: "Sixth, " + loremIpsumDesc
            ),
            timestamp: Date() - minusDays(manyDays: 30),
            state: .normal
        )
    )
    
    
    
    result = [emailView1, emailView2, emailView3, emailView4, emailView5, emailView6]
    return result
}

func minusDays(manyDays: Double) -> Double {
    return manyDays * 86400
}
