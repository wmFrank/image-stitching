# Image Stitching

## Intro
This repo implements a image stitching method with keypoint detection and selection.

## Workflow
- get correspondences with [VLFeat](https://www.vlfeat.org/) and [Ransac](https://homepages.inf.ed.ac.uk/rbf/CVonline/LOCAL_COPIES/FISHER/RANSAC/)
- compute [homography matrix](https://en.wikipedia.org/wiki/Homography_(computer_vision))
- warp between image planes
- ouput the stitching image

## Results

| <img src="https://user-images.githubusercontent.com/30235642/177033247-c350539e-2a70-41f4-9bb5-010123fa8ab0.jpeg" width="500" height="300"/> | <img src="https://user-images.githubusercontent.com/30235642/177033244-a40a0b08-d755-4a72-beda-bbf00b1bedd8.jpeg" width="500" height="300"/> |
| ----------- | ----------- |
| input 1 | input 2 |

| <img src="https://user-images.githubusercontent.com/30235642/177033249-91d5aa7a-0176-4402-bc6a-86b72d822ef5.png" width="600" height="360"/> |
| ----------- |
|  output |
