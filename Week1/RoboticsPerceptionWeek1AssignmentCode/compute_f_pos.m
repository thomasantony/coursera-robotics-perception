function [ f, pos ] = compute_f_pos( d1_ref, d2_ref, H1, H2, ratio, f_ref )
%% Compute camera focal length and camera position to achieve centain ratio between objects
%
% In this function, we focus on two objects: object A with height H1 and
% d1_ref as distance to camera in 3D world, object B with height H2 and
% d2_ref as distance to camera in 3D world.
% We will keep the size of object A in image the same as before while
% adjusting the size of object B in image.
%
% Input:
% - d1_ref: distance of the first object
% - d2_ref: distance of the second object
% - H1: height of the first object in physical world
% - H2: height of the second object in physical world
% - ratio: ratio between two objects in image coordinate (h1/h2)
% - f_ref: 1 by 1 double, previous camera focal length
% Output:
% - f: 1 by 1, camera focal length
% - pos: 1 by 1, camera position on z axis

% YOUR CODE HERE
%
%     f_ref*H1/d1_ref = f*H1/(d1_ref-pos) -> f = f_ref/d1_ref * (d1_ref - pos);
%
%      ratio = h1/h2 =  (f*H1*(d2_ref-pos)/(f*H2*(d1_ref-pos))
%                    =  (H1/H2)*(d2_ref-pos)/(d1_ref-pos)
% ->   ratio*d1_ref - ratio*pos = (H1/H2)*d2_ref - H1*pos/H2
% ->   ratio*d1_ref - H1*d2_ref/H2 = pos*(ratio - H1/H2)
% ->          pos = (ratio*d1_ref - H1*d2_ref/H2)/(ratio - H1/H2)

pos = (ratio*d1_ref - H1*d2_ref/H2)/(ratio - H1/H2);
f = compute_focal_length(d1_ref, f_ref, pos);
end

