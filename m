Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958C6C85F9
	for <lists+samba-technical@lfdr.de>; Fri, 24 Mar 2023 20:32:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IliWdXA7YXjngkY42bn6P2yGvaTOLYpe4kN6r+hyV6k=; b=AdNnsaVAerKBnFcUcXqVRtgHVF
	+AN/edgG1Ksgg1Qwbgve51xlkoBocSLnh6dVtuomVJ7ss2KFjH/yxmzTQJg52ABJ6p2GalvXufqdD
	vjcxTjvYUTbJJK4HvJDfV/qu4HnQuXjXnsll9rkmUVb8WEM1rqEaZfdq2aL1K6U7frfnShjwbdqSp
	U7AK99k86JcGFQ+m5BsIkLwsyyeFhbBGTTJ0f75UesSx5W3fcEu2QrYsnMtuLxN3GIK2JxirePhxr
	XzKP5ndbWhOygxgXZnS6iSKUVGqAdmy2or26CB3vjOftns8QGLX8nth2p7tDJxH5JEs1tV3vPaLsU
	BhfShv+w==;
Received: from ip6-localhost ([::1]:29560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfn8V-004Ocp-9U; Fri, 24 Mar 2023 19:31:39 +0000
Received: from [104.200.28.160] (port=45124 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1pfn8Q-004Ocg-Tu
 for samba-technical@lists.samba.org; Fri, 24 Mar 2023 19:31:37 +0000
Received: from edfu.localnet (c-73-114-43-44.hsd1.ma.comcast.net
 [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 9D86CC5D;
 Fri, 24 Mar 2023 19:31:31 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: Possible regression in samba-tool provision
Date: Fri, 24 Mar 2023 15:31:31 -0400
Message-ID: <6599838.e9J7NaK4W3@edfu>
In-Reply-To: <06a484a872e1413eaaa3fc54cf2c9bab3535316b.camel@samba.org>
References: <5862845.irdbgypaU6@edfu>
 <06a484a872e1413eaaa3fc54cf2c9bab3535316b.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: Anoop C S <anoopcs@cryptolab.net>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, March 24, 2023 3:01:26 PM EDT Andrew Bartlett via samba-technical 
wrote:
> Please propose such a patch in GitLab, if you can!

Sure thing.  https://gitlab.com/samba-team/samba/-/merge_requests/2991

It's still a draft as I don't have resources to test it locally at the moment.  
I'll revisit it more thoroughly next week.



