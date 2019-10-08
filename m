Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0715D00AE
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 20:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BdNmyWvrjR/bdqwLWEynl9kSHLP474WTzcPNzJBWpLM=; b=hIKqQB6rvxGI1zT6JSLh8aIL13
	PHfTCh5XUgAJ2qCtu/Gs+alDcIWsuGAR3Q70v0qG8KXWCwbaiifPaY6xflbs3guvIf4U92WqB7jkp
	/rqu9+khjJDJxovTjfK2a+Rz0Xa5xBpQeLOVA7gifnhlOeX3i61ntATLd+p5I3rglZjsIWX0eERA6
	AUnfiYUBYCVM7yBvu/pU95UXoNTpKbYiUsSZyMEtzzNGvHTp8PKkw492jAjX7g+V/YEhi8V5ni3fN
	GIMJkPC1Ssm+mjoKw21U5Jxw9axSoqZgf4TYSeY5GPFhTv8/XhBOm1aF0IT/ydM3Ih8xUzfWH8UkQ
	CJkhyo/g==;
Received: from localhost ([::1]:64858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHuAN-002A9q-8N; Tue, 08 Oct 2019 18:24:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuAJ-002A9j-3u
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 18:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=BdNmyWvrjR/bdqwLWEynl9kSHLP474WTzcPNzJBWpLM=; b=BmiOVFrCA8vAN+YMtZYPx4qJuJ
 Uzc9+G/YU2kAG3FPqrdN3F3MTI0C/uB48Xz81U05p38sAse5UuGcOBGYUEA/2kYBUuJGLmcZ7W5mp
 hspXJAxdG2X6lTLl2dm6lLI9ss9WM3Qkx9y386c7sPdHXB0H9LxuOyLr/Z2MNpSC6qsU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuAI-0000tz-9h; Tue, 08 Oct 2019 18:24:54 +0000
Date: Tue, 8 Oct 2019 11:24:51 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Samba and legacy Windows support
Message-ID: <20191008182451.GA1583@jra4>
References: <5849953.E8HlOTvGIY@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 08, 2019 at 10:59:41AM +0200, Andreas Schneider via samba-technical wrote:
> Samba with version 4.11 currently still support a lot of systems which are 
> already out of support. We still get bugs to either fix support for Windows 
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is 
> still deployed.
> 
> In order to remove support for those platforms which are very long EOL, we 
> should try to make announcements when we plan to remove support.
> 
> ## Steps planned
> 
> With Samba 4.12 we plan to disable SMB1 by default and then remove support for 
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.

I think aiming for this by the end of 2020 is possible. There is
a lot of work to do first though.

Announcing this is what we're going for is a good first step to
allow people to prepare to move off SMB1-dependent systems.

Jeremy.

