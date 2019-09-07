Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72AAC43A
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 05:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UJNx4q3yiVXkJOQnvc0IQ+JydTcBtTznSjiUUZ22BAs=; b=Ys94TzTg+Kvm06DwyCogx500br
	8IBoS+WjBLXTMrzObjzzzLbxZNPDh0HFqVXSdrUk450PQ0nBsl9Yq3Ztax4poFUBLAwugaRAPWYFG
	YzSLX2/kZTkHuwE+GalfVhAC7SngFalP+Z/tVYd0/X0tb3qYwW3UXG71fSi0pu3dSZpaDv9ECqqgU
	Pk9UVikzTU1vb3zHBoiexeLR7o6uDnAsjGOi8KwzhsGebvnaH1xx+kxqQKZlfx1tRAg9mpkKQFMCT
	JBbOBS2jU4eZM0mQcFdRDKwIQY25+ME6JWuCiDyneQTYed0xiXXkcYPIVazAbJ0WFY7UaapL5+KZK
	mdlMiULw==;
Received: from localhost ([::1]:43474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6RGv-0048tw-Jv; Sat, 07 Sep 2019 03:20:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31768) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6RGm-0048tp-It
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 03:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=UJNx4q3yiVXkJOQnvc0IQ+JydTcBtTznSjiUUZ22BAs=; b=PSAKqC3BqXPlBUgN3IHwMHz6g2
 7lFvNHAZZ16B8nBHfSJmVBiAap17TZVJdymas/Vpd2nNIIhaGIVtGujsQGp0A+gi4DOv8njY3wqi/
 Ft/f/vDVz1kE6GSXi+5cz+ceAMxPI3hl/lFPNRCQrzIt0RmvM5kbNPc/EYStcTrVpg34=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6RGk-0006vq-DN; Sat, 07 Sep 2019 03:20:11 +0000
Message-ID: <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
Subject: Re: samba performance difference between old and the latest ?
To: Namjae Jeon <namjae.jeon@samsung.com>, samba-technical@lists.samba.org
Date: Sat, 07 Sep 2019 15:20:04 +1200
In-Reply-To: <006701d56457$0c77fc60$2567f520$@samsung.com>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: sergey.senozhatsky@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
wrote:
> Hello,
> 
> I found something strange during measuring performance with samba
> these days.
> I checked the performance of samba 4.7.6 and 4.10.6. 


> samba 4.7.6 : 11.6MB/s
> samba 4.10.6 : 9.5MB/s
> 

Jumping back to the top of this thread to focus on what you could help
us with.  If you built Samba for both of these tests, then perhaps you
could do a git bisect between those two versions to work out where this
degraded?

Of course, this assumes it was a single commit, but who knows, it just
might be. 

Either way, if you were able to additionally test 4.7.latest,
4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
dataset) it would be a massive help.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




