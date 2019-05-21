Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DBB24B8F
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 11:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=FVKPskMb+UHW04ei4YomylNV4sbOM3oJwJuvYSiKYjM=; b=JlZ2koMBpHuHpyPo1xFEhJJX2+
	5IgvVHZQS0JKkh1KD/DkPm8nf3j9SaCcjP+Xt5S+MFduzeVlPEDPYKlZ3Hi47FvMUXPIpo1XG/Fql
	vuLHsx+/OwS6jpchqg6DmF0kBpVbjnUrKuGPQFsUJW0Qiiy/dCI28tYGj5uwFyuheFxmLjRe3n0Iv
	6jiR2N7Fq6iYUuyYRmXtBG/GUZBcxfnNyvaSjVSKIOmo0sWXy5rPPaZkRxSYQqDBRXWHQzYOAfiuw
	G7g+vLLJO64peftbQh5NjlMuoZgYohSiYJHc+9+qANmh21YmaDXlu2UumbTm8fehXkUc5MMQFRL2T
	8xmOj/uQ==;
Received: from localhost ([::1]:38692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hT172-000vif-Tc; Tue, 21 May 2019 09:31:12 +0000
Received: from [2a01:4f8:192:486::147:1] (port=20152 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hT16y-000viY-Bw
 for samba-technical@lists.samba.org; Tue, 21 May 2019 09:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=FVKPskMb+UHW04ei4YomylNV4sbOM3oJwJuvYSiKYjM=; b=ed7DQWPNEKuF4X3iCJ2AN3vGVd
 i9Pig0PpVB9EiLDzW3z5upE52qs52F/YWFaiQhd/MpW+RCVX4/tKi5LMBDhUOnkYbETsI/Z496yOp
 JRGLd2NA/dondVE51O0/IUhD+Ki/SxzGzxqm54z+lIIi1EwmbUcwKtrUyFD45Ddi9OhI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hT16r-0001ed-Sa; Tue, 21 May 2019 09:31:02 +0000
Message-ID: <75d67f2c991f172be882ea485d77bcea9567934a.camel@samba.org>
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
To: Stefan Metzmacher <metze@samba.org>, Garming Sam
 <garming@catalyst.net.nz>,  Aaron Haslett <aaronhaslett@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Date: Tue, 21 May 2019 21:30:56 +1200
In-Reply-To: <6a709953-cfd9-c5fa-8b65-05e56c0f49b0@samba.org>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
 <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
 <1557898030.25245.8.camel@samba.org>
 <6a709953-cfd9-c5fa-8b65-05e56c0f49b0@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-05-21 at 11:26 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
> 
> > At this stage we are thinking to have GUID indexed databases use
> > the
> > new pack format, with an upgrade on first use, exclusively.  This
> > will
> > avoid changes to non-Samba LDB users while keeping the test matrix
> > compact.
> 
> How can we make sure it's possible to downgrade to 4.10 (all versions
> with GUID index) once ldb tools for the new format upgraded it?
> 
> metze

Before we use the new format (current MR is just to set up, no DB can
be created) I'll have sambaundoguididx updated to downgrade the DB to
the original format, which can then be upgraded again if using 4.8 or
above. 

I've already fixed the script to work again, but I also need to handle
undoing the RANGED_INTEGER stuff.  Not hard, just a little more fiddle.

This time it will have a test. 

I trust this satisfies!

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



