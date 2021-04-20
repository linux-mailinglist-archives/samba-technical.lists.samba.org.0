Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F56366078
	for <lists+samba-technical@lfdr.de>; Tue, 20 Apr 2021 21:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pfzUNJ9Xe3kBkHotomD20pE9J/vQndMm0MOpwkVZmq4=; b=YmegS+E+6J62t4MtHRFyyMPJcR
	qRbWLsYhCbxS1b1m56yp0rNA2VtwMbvqPiqdYw9XjSZFyeyfeN4eEXtihlFwnrduBZ/txjvzdHu6o
	CJClViFnSyKI2DgPV4Kyx8jg50C9Sc+BXMe+xnqdTN6oRTOGMczgng9cciNLWAydLoYwBWhbpwTMF
	msdIHbR/5XAgNQtaJYOE2faecP0kfjGsepBniiEDRqx5BUong5YCeWLUol2zX1+gA90xTL2ocPBzc
	peWfklgng9efR8T9LG6AHR8xLojkURYkbXPpEe8ryKCPV1y2iEkKch1WjYOUAFKfUeZi8F40Bgv4Q
	1McEGecQ==;
Received: from ip6-localhost ([::1]:35386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lYwTf-00Bpoq-P0; Tue, 20 Apr 2021 19:56:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYwTT-00Bpoe-Oz
 for samba-technical@lists.samba.org; Tue, 20 Apr 2021 19:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pfzUNJ9Xe3kBkHotomD20pE9J/vQndMm0MOpwkVZmq4=; b=XBJkJeXKivLgClVnr3thrCIe0+
 1e6GihMp2+ftTBywyX4UTMDgA34eZ26AnN4Wpf//EvQKlTLzaR5g8/L0voU0QfheRqSlAWz2uAzn4
 XD2b8uEl3OY02TvJurYzHX5b1iiEfgYQAyktW9xlMrK1Zu2L7ZLSIaz2JCXyxPaw6YUGBukOQnfXq
 46ZXJKvkyhx7EeHhY5K2CyKyxgdkeBUn514YAGhASgXsgcgBu9Jg1BWbYmJqlLm50JECl1QEcE/lu
 tD0tF5tPavNbxeR7v4Ul3yQfh+rNeS1M5n+XAAWTJinuECG7h6oTJTEPfLzDUNbRcrgwkLNA9ZU2j
 WrV1ySqUDVyK0YjBQJNMIzfRRKEE7ksjIc1Ee8ujj8I6AEaTSxU7/7XP4vUydHbcTNT4ase1VyP2p
 EEWaldtg316bjDhAk3bf4wLeCEa4DdVOEELczoRoD7ja3nuFcE6S9eN8bqw4gAqYSKuALXr6rJOKn
 2q9nrZ8G0Bao7OMMCksq7UIn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYwTS-0006fN-8Y; Tue, 20 Apr 2021 19:55:54 +0000
Date: Tue, 20 Apr 2021 12:55:50 -0700
To: Gordon Ross <gordon.w.ross@gmail.com>
Subject: Re: [PATCH] Fix sigsegv in check_stream in smbtorture smb2.streams.io
Message-ID: <20210420195550.GA1140396@jeremy-acer>
References: <CAD0Ztp1y=WFbe3k=JxxbTC55O9YOhmJL2GAatHc8denZ+15h=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAD0Ztp1y=WFbe3k=JxxbTC55O9YOhmJL2GAatHc8denZ+15h=Q@mail.gmail.com>
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

On Tue, Apr 20, 2021 at 03:36:28PM -0400, Gordon Ross via samba-technical wrote:
>Not 100% sure this is still a defect on master, but it was fairly recently.
>
>If any stream create fails during smb2.streams.io
>the test dies with a sigsegv in torture_comment
>
>torture_comment calls need a struct torture_context arg,
>not its mem_ctx child.  Use talloc_parent().  Also
>need to call torture_result somewhere on failure.

Thanks Gordon ! Probably better to pass down
an extra struct torture_context *tctx parameter
to check_stream() rather than relying on talloc_parent()
to assume it's a tctx.

If I make those changes are you OK with your
"Signed-off-by: Gordon Ross <gordon.ross@tintri.com>"
being added ?

Cheers,

Jeremy.

