Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CE718EE
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2019 15:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=03X3P2kio76SiVZK+cV6+3S9RzzgUWAlCgRLvOpQCIA=; b=qPIr5zmidCxweuKKT5zBFLIwKL
	R/eg38qHm0W4zBWHWqkAuO2PjMNJ4SOpgjFeHIEEjkrGraWiamNI3LYRC1QxQn8kYzsc7eE6WyQCw
	BLv7aUwdBBeJ/rs/bI6ngszlw/jjtGAEbt1JEtefJ+1qrAeGBNFlCwkXzOD+irBe7mWDgjn8y9biC
	zNKx0QjFqkGAd47ldKD7V6xPur6r7QX0GmFe2vcoaqNhL4fzGVJ5m2ySkeGUC7v4+9am52t+9Bm+L
	plHi+nRhbbX9+kvqL8Wycc4i9BMAaxs2O38CQPMcBtJtciH+nbm46tWiYFWtpmiUGhXx06vE0osqG
	sudmWsVQ==;
Received: from localhost ([::1]:59708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hpua0-001zJg-1w; Tue, 23 Jul 2019 13:11:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51340) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hpuZv-001zJZ-Qv
 for samba-technical@lists.samba.org; Tue, 23 Jul 2019 13:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=03X3P2kio76SiVZK+cV6+3S9RzzgUWAlCgRLvOpQCIA=; b=gFVsnsC7JGIZC98YqDqlxc54Ux
 WbJQVjSwyhrKeKmz4aMY9g1x3oeekW2B86fW48ZH/DHQjDieAf1tlM2r0002ze7Sf+f3A9CY4jt81
 kn4K9loreMQtIYuDh36dsjlBCIB7mOifFCAgWTcSYnOQA472iHElRloPdiZBKWt6aKl4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hpuZu-00006O-Ey; Tue, 23 Jul 2019 13:11:38 +0000
To: swen@linux.ibm.com
Subject: Re: [PATCH] resolv_wrapper: prevent RTLD_DEEPBIND if run with libasan
Date: Tue, 23 Jul 2019 15:11:37 +0200
Message-ID: <2630461.v4r0AqFQku@magrathea.fritz.box>
In-Reply-To: <754eb6da79776c66d8df834a0b0f287ab9e09aa1.camel@linux.ibm.com>
References: <754eb6da79776c66d8df834a0b0f287ab9e09aa1.camel@linux.ibm.com>
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, July 22, 2019 3:09:38 PM CEST swen wrote:
> The only one missing afer Andreas' update.
> 
> Please review and push if happy.

Hi Swen,

this should normally be tested, so implementing this involves a bit more than 
just that single patch :-)

See for example how I did it with uid_wrapper:
https://gitlab.com/cwrap/uid_wrapper/merge_requests/1/commits


This runs the tests with Address Sanitizer, so it also makes sure that this 
works correctly.


Cheers,


	Andreas



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



