# @TEST-EXEC: bro -b %INPUT 2>&1 >out
# @TEST-EXEC: btest-diff out

type Outer: record {
	id: count &optional;
};

type Inner: record {
	create: function(input: Outer) : string;
};

redef record Outer += {
	inner: Inner &optional;
};

event bro_init() {
	local o = Outer();
	print o;
}
