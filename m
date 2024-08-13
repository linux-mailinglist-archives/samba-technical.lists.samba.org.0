Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B139594FB08
	for <lists+samba-technical@lfdr.de>; Tue, 13 Aug 2024 03:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OCj+8dcyCL3NAs0bwG/cQFR1ODQ9g63kys/XeNFAvZs=; b=wTHZIG0KayN4guv6zFhdsDAZfF
	AlubGk/J9jFVAg5HF8y14pi59Ox3fyDDlvgfDV5tFJboxfFfiia78jOCbg/yScdVjR+e1FicXbmZC
	AFQKWMJk/gQeW15IXt1DJOV1Sy3uV70Pv75J6hk7CYhAuuHAc0OBvXS4Tvxft5Dl+r78qE7eSIz2C
	mtqIqMz/fxOxucUPTyK9BzSD74DJpuO4WnldLGhYfqBteoj9GMVEK7+0S/I5ScOqeBAYdWOisyPOK
	3zFhwKHoQWTCbR1xiT9Y2k9Y0By990Uv3ncQ/yYtZXOkU5dxaOdaUYeLXuoH1KrQIiuVOUFkhQIo2
	V68bHgWw==;
Received: from ip6-localhost ([::1]:41718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sdgFj-004Ud6-Pi; Tue, 13 Aug 2024 01:23:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30086) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdgFf-004Ucz-Dy
 for samba-technical@lists.samba.org; Tue, 13 Aug 2024 01:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=OCj+8dcyCL3NAs0bwG/cQFR1ODQ9g63kys/XeNFAvZs=; b=ck7XT7KFjAxRRb5NBTvTiXvuwh
 wj/GKlJi/LtRKU76oLLEjSaPSiVWMkz6rYs0YnLaMoKnVP6poDV2c8ngMXgoZEWX3RqVx7sLk8LJm
 xyHJTkXH56izN4CVRt+i/SLtYtz10EzHg7LRQ//atftGrJmY+PgUfc6eeQtozI+I+PBdF3fZaTugY
 yQOoY+J1dxqhusRNHNKuMNYUuxU9iXOUDCpos3iDc9vhK1uiS2QGtZuTa67XnBpBfl45+TGPrBrcg
 w6z3bXewLa3Po1gY74iiVASQhyDV/bnUgNtBmoR9qRAODFk0sNSz8unUUu3rYK1wuJxXCYYBaFDbG
 40AaLz8MvPxteSEtXPsWAQN6ikQVk2KBPhrSyFdSuo0PFd64OMkVbTDWBZN7utjThUmuGVMzYH0CG
 tDxWBGOBYbdd3R71s1YxkBaNu/sPu2+t8R2TaR/QWgbQvkBYbBPZlCW90cRmq4zeGP0jY/aHGrjhq
 O+0sME09Njfo1MZij2GO7moO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdgFd-0068lk-3B; Tue, 13 Aug 2024 01:23:06 +0000
Date: Tue, 13 Aug 2024 01:22:57 +0000
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>,
 David Mulder <dmulder@samba.org>
Subject: Re: CI can't reach internet to fetch rust packages
Message-ID: <20240813012257.4efbe77b.ddiss@samba.org>
In-Reply-To: <0ef42b0d9fda725ae617220b19abdfbcc416ee55.camel@samba.org>
References: <37323893-503b-455c-beb6-fede11a44eb9@samba.org>
 <0ef42b0d9fda725ae617220b19abdfbcc416ee55.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 13 Aug 2024 09:37:59 +1200, Andrew Bartlett via samba-technical wrote:
...
> If you want access to the real internet, remove the socket wrapper
> environment variables or otherwise disable it. 
> But also, don't do that.

Indeed.

> At least in the past, the autobuild host does
> not permit outbound access, so you will need to work with the
> sysadmins. 
> The preferred pattern from our C model of software development is to
> encode dependencies at image generation time, and manually install on
> the autobuild host.

"cargo vendor" should allow you to dump your (hopefully audited and
trusted) dependencies in a directory somewhere and build from that.
Would that be an option here, David?

Cheers, Dave

