Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B172DEA4B
	for <lists+samba-technical@lfdr.de>; Fri, 18 Dec 2020 21:35:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pVeJxaqD8CCNdLzbOPHbb++AvJYc4Gf3j/OFnQdmUxQ=; b=bc/IBm5H3T7i0Y5UPF4P9Iz6sC
	/N0jmq3g3zSAfddSvJTl4bvP3V238Of2uq0p6jakoQGpfimrryyHYURG/+Hf0XfZHA+7s3BOCkU8E
	lIMn5qvIixTcxYJpmyKkTRJP+00iXPe5HnGSxiSrc5ofBe8wDzkp7Egy1Nmi6eGm/kxBrXF61afb8
	BfiNN/pKbvH8+z59aEijvy+snPNKVRQBtFp7U7ynovy8Cj26rpKRwN7hx6Tl2UtuQdAhZH5+Y+gIm
	GvAR9DRLYL7slbZuz97cnnt+pnLabIYbfzKzRk65dAVmalXQOWBcw8hEayI8q4V3NUdQjoz/HOYUQ
	Lb2RFSGA==;
Received: from ip6-localhost ([::1]:43338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kqMSk-0020II-Qq; Fri, 18 Dec 2020 20:34:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqMSY-0020I9-1z
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 20:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=pVeJxaqD8CCNdLzbOPHbb++AvJYc4Gf3j/OFnQdmUxQ=; b=cC5n6YQiHRXp/4o5iIYs81ENGf
 l1pzMjgUpQfe1BiIQBfUuDvft863O11WUqYa7dHw8EciM1wnzniz85SGPR9wj+FlFLyGB7oV9on4s
 RSJou26KRGk4RZ1kVg50FwjfjAJADR3u77dUTYNOiTfxchOBLgIAp7iwjcijv9PlnRMQ+CLLmFBVC
 rx4jOHKRrKxKHuzCAU8NzSVm8S7gNipe++Pi+BWawldBRb/jB6ejXynQn4vpP3DNPb++uMbqYYTI5
 +YrJ8vL8DjQTjyRKimDrVyAyp+ryTiqU9hokxeXzYqs0WCjO0+dE0LKtUmXDHbFnIHvSo3gzP+jf5
 Na82c9g6GOh/UjHaPkrCSTtzStKteg/i7/aQ6r5lSGgaLlLP2xEHqz2hHB1ThfjWHboMYa/bZZNZl
 2r63IWG1cbdIZiUJiSzbKJK7bjZ6c/qoVfdOttCBVtb+mr963R8Hc8sm0GMB+fSS0WciPyocdqDjN
 UWHG5b74nY6DTtcOvFYm4OZk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqMSH-0006jQ-0N; Fri, 18 Dec 2020 20:34:25 +0000
Message-ID: <2104f98f38d3234ecef0caabd14fb0a9cd4d4c62.camel@samba.org>
Subject: Re: vfs_acl_[xattr|tdb] and timestamp in ACL hash
To: Ralph Boehme <slow@samba.org>, Jeremy Allison <jra@samba.org>
Date: Sat, 19 Dec 2020 09:34:13 +1300
In-Reply-To: <86aa9f39-3535-01ca-f96d-f22acc36778b@samba.org>
References: <86aa9f39-3535-01ca-f96d-f22acc36778b@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-12-18 at 16:31 +0100, Ralph Boehme wrote:
> Hi Jeremy,
> hi Andrew,
> 
> here comes another question related to vfs_acl_xattr.
> 
> This is triggered by a customer request who is storing xattrs in some 
> kind of database (external to Samba) and they're trying to leverage 
> xattr deduping.
> 
> They have a xattr dedupe feature in their backend such then when to 
> files have the same xattr it's only stored once in the backend.
> 
> But when using this with vfs_acl_xattr they stumbled upon the fact that 
> we skew the ACL blob bash with timestamp, so even if two files have an 
> identical ACL, they will have a different timestamp so the overall xattr 
> blob will be different.

This is what I wrote at the time:


commit 25526ed3f590e4fa90c237a37f08bb23f449dd8c
Author: Andrew Bartlett <abartlet@samba.org>
Date:   Wed Oct 10 16:36:47 2012 +1100

    vfs: Implement an improved vfs_acl_common that uses the hash of the system ACL
    
    Where supported by the system ACL backend, this avoids hashing the
    result of the ACL mapping, instead hashing the original ACL,
    linearlised.
    
    For maximum robustness, the hash of the NT and system ACL are stored,
    along with the time and a description of the system ACL.  This variety
    of extra metadata may assist some future implementation in determining
    which hash to validate.
    
    Andrew Bartlett
    
    Signed-off-by: Andrew Bartlett <abartlet@samba.org>
    Reviewed-by: Christian Ambach <ambi@samba.org>

So there isn't a current, concrete reason for the time, just a thought
that one might want to somehow work out if the ACL in the xattr was
'recent' or 'current' somehow later.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



