//
//  CGImage+Crop.swift
//  Waifu2x-mac
//
//  Created by xieyi on 2020/3/7.
//  Copyright © 2020 xieyi. All rights reserved.
//

import Foundation

extension CGImage {
    
    public func getCropRects(from waifu2x: Waifu2x) -> ([CGRect]) {
        let num_w = width / waifu2x.block_size
        let num_h = height / waifu2x.block_size
        let ex_w = width % waifu2x.block_size
        let ex_h = height % waifu2x.block_size
        var rects: [CGRect] = []
        
        var i = 0
        while i < num_w {
            var j = 0
            while j < num_h {
                let x = i * waifu2x.block_size
                let y = j * waifu2x.block_size
                let rect = CGRect(x: x, y: y, width: waifu2x.block_size, height: waifu2x.block_size)
                rects.append(rect)
                
                j += 1
            }
            
            i += 1
        }
        
        if ex_w > 0 {
            let x = width - waifu2x.block_size
            
            var i = 0
            while i < num_h {
                let y = i * waifu2x.block_size
                let rect = CGRect(x: x, y: y, width: waifu2x.block_size, height: waifu2x.block_size)
                rects.append(rect)
                
                i += 1
            }
        }
        if ex_h > 0 {
            let y = height - waifu2x.block_size
            
            var i = 0
            while i < num_w {
                let x = i * waifu2x.block_size
                let rect = CGRect(x: x, y: y, width: waifu2x.block_size, height: waifu2x.block_size)
                rects.append(rect)
                
                i += 1
            }
        }
        if ex_w > 0 && ex_h > 0 {
            let x = width - waifu2x.block_size
            let y = height - waifu2x.block_size
            let rect = CGRect(x: x, y: y, width: waifu2x.block_size, height: waifu2x.block_size)
            rects.append(rect)
        }
        return rects
    }
}
