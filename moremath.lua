function math.sign(n) return n>0 and 1 or n<0 and -1 or 0 end

-- Checks if two line segments intersect. Line segments are given in form of ({x,y},{x,y}, {x,y},{x,y}).
function checkIntersect(l1p1, l1p2, l2p1, l2p2)
	local function checkDir(pt1, pt2, pt3) return math.sign(((pt2[1]-pt1[1])*(pt3[2]-pt1[2])) - ((pt3[1]-pt1[1])*(pt2[2]-pt1[2]))) end
	return (checkDir(l1p1,l1p2,l2p1) ~= checkDir(l1p1,l1p2,l2p2)) and (checkDir(l2p1,l2p2,l1p1) ~= checkDir(l2p1,l2p2,l1p2))
end

function toPolar(x, y)
  return math.sqrt(x*x + y*y), math.atan2(y, x)
end

function toCartesian(r, theta)
  return r*math.cos(theta), r*math.sin(theta)
end

function rotate(x, y, angle)
  r, theta = toPolar(x, y)
  theta = theta + angle
  return {toCartesian(r, theta)}
end
