//
//  FontManager.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/16/25.
//

import UIKit

enum FontManager {
    case pretendard(Pretendard)
    case reddit(Reddit)

    enum Pretendard {
        case titleSb26, titleM24, titleR20, titleM18,
             titleM16, titleL16
        case bodySb15, bodyR15, bodySb13, bodyR13
        case captionM12, captionR12, captionL12, captionSb11,
             captionL11, captionL10, captionR9

        var config: (size: CGFloat, font: UIFont.PretendardFont) {
            switch self {
            case .titleSb26: return (26, .semibold)
            case .titleM24: return (24, .medium)
            case .titleR20: return (20, .regular)
            case .titleM18: return (18, .medium)
            case .titleM16: return (16, .medium)
            case .titleL16: return (16, .light)
                
            case .bodySb15: return (15, .semibold)
            case .bodyR15: return (15, .regular)
            case .bodySb13: return (13, .semibold)
            case .bodyR13: return (13, .regular)
                
            case .captionM12: return (12, .medium)
            case .captionR12: return (12, .regular)
            case .captionL12: return (12, .light)
            case .captionSb11: return (11, .semibold)
            case .captionL11: return (11, .light)
            case .captionL10: return (10, .light)
            case .captionR9: return (9, .regular)
            }
        }
    }

    enum Reddit {
        case bodyR14
        case captionM13, captionSb12, captionM12
        
        var config: (size: CGFloat, font: UIFont.RedditFont) {
            switch self {
            case .bodyR14: return (14, .regular)
            case .captionM13: return (13, .medium)
            case .captionSb12: return (12, .semibold)
            case .captionM12: return (12, .medium)
            }
        }
    }
}
