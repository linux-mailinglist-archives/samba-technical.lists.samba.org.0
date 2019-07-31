Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AB7CC51
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 20:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=m94+MFIZdCjy97exsNAIRqYyJoF/qO8YtXk6Q4Ocq2s=; b=IHkDRNrsyUwLyCfRFgg4W5MW5y
	+JADqRLtWNXfLyEO7FXMuHvRtI8wE8x+TC2eEotAq2zigvrZdZVuAk6IqKx/mxMoX5vMSalnZWxKQ
	jlicS5g6XBdSoLlxxSsTIhu6k+XnSbgFeznBEEv/TrHD1nOPOldrVJroHUNyFYHgvc4P516DFllwm
	9gclf02I+2yLnL8JXSATbSYvSvbEY7B5WDbHc4pX6nT7lTva2mWOPWzZWkJIwu+bn4c2994sxtsOm
	5Xq1xB9/YoU8p1aq4Q0A3J9whMXH3n3XFhfPdlyIO7yMmJwOL8jTl9EEa6YXIG1Ao9uTUnuQ5apaq
	eBTDsYKg==;
Received: from localhost ([::1]:36372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsthj-001bJ4-Q7; Wed, 31 Jul 2019 18:52:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsthf-001bIx-Rb
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 18:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=m94+MFIZdCjy97exsNAIRqYyJoF/qO8YtXk6Q4Ocq2s=; b=Wq4klHgABmAAbSC+xgLZ+CFpr0
 9GsMScsn5mmtuZ3GF8ZtZgJbBxdfbajHKpYAIVAa64W4l8ILXipU0ykAW7BSgZcVBPYi5fTJOekzt
 v2iYvua2vzQLHSZff/f4eXv5477Jvhkqryun8pXj+66+eseg/0G4ox4fQl3Q5buv/z4Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsthf-0003qy-3E; Wed, 31 Jul 2019 18:51:59 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Date: Wed, 31 Jul 2019 20:51:58 +0200
Message-ID: <2437169.Go6ugyqXA4@magrathea.fritz.box>
In-Reply-To: <1564547155.4261.48.camel@samba.org>
References: <1564547155.4261.48.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, July 31, 2019 6:25:55 AM CEST Andrew Bartlett via samba-
technical wrote:
> [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> requires AES-CMAC-128, but the impact would be far more constrained.

And also AES-CFB8 ...

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



