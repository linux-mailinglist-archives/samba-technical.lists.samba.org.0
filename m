Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A58757D9
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 21:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ituurbuQmoJMMua+fVC20Oq5hM9xBEtiPXLrNr0Fdxc=; b=3DIar65JYH5tlbRz91YPX4QZCW
	FWv/yWpw2/ouMOiMp7SEKQiGupEpBUgBUQgD2CXgrfdr2lEApc/p1xZGF7NnOCKbM6PXl5PZ5kFi0
	Jski4DWfYt1en+t3XSufbxns1ehgvPanNFnv4YXzOAyt2dxQwZ9PY6PFHS7nVVBBm9/o1J5ueFn+l
	vqrRTCP+lECnPX694Yj/IeHnZ9ispjhdzpguh7kCdMgeX72MnpFED2Gd/aoJXFbWM2/SArogW3/Yf
	1Ta9xmgTtY3pWiH6a7KlllDulbJeP+9KqvhE09p5DDtmRwk9RqdAJlhDWOoTLuSVYEgaodYGHoqUO
	oAb6d7bg==;
Received: from localhost ([::1]:22058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqjP4-000KYD-2Q; Thu, 25 Jul 2019 19:27:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjP0-000KY6-3A
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 19:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=ituurbuQmoJMMua+fVC20Oq5hM9xBEtiPXLrNr0Fdxc=; b=saJV5H9/pHmpKIZuOTgmZNaQUP
 kdxChL9/TDX6+A7Pd13W8/0+a0tLWJEmVnO9Lg0W2MZvS/x+oaeA1od6oJJEnAHQktVAgy1sPvJfB
 nbOV8ZYnC0BzYW0GoYey9g5e29Gzg5a/y2um6mKRbTxtDBMzBMxLWxMVxFOp6aZM9jh0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjOy-0002lb-Uf; Thu, 25 Jul 2019 19:27:45 +0000
Message-ID: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Fri, 26 Jul 2019 07:27:41 +1200
In-Reply-To: <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-07-25 at 20:18 +0100, Rowland penny via samba-technical
wrote:
> On 25/07/2019 19:59, Andrew Bartlett via samba-technical wrote:
> > We can't do that until we provide a reasonable way for SMB1 clients
> > to
> > connect, probably via a SMB1 -> SMB2 proxy based on the NTVFS file
> > server (where we had such a prototype until very recently).
> > 
> > It won't be perfect SMB1, but needs to be enough for basic
> > operation.
> > 
> > I'm quite convinced Samba and SMB1 are critical infrastructure in
> > many
> > places and while we may dislike SMB1 for good reasons the
> > alternative
> > is to force such installations to rely on what will in 2 years be
> > an
> > unsupported and therefore soon an insecure version.
> > 
> > I'm not comfortable with that as an outcome, so we need to provide
> > them
> > a way forward.
> > 
> > Andrew Bartlett
> > 
> 
> Andrew, why do we need to keep anything like SMBv1 around in the long
> term ?
> 
> If you do an internet search, you will find blogs from Microsoft 
> employees nearly begging people not to use SMBv1 and the fact that
> new 
> Windows 10 installs have SMBv1 turned off by default, leads me to
> think 
> that it wont be long before it is totally removed from windows.
> 
> If SMBv1 is removed from windows, then the major user base will 
> disappear, so are you saying Samba should keep SMBv1 around just for 
> Unix users ?

I'm more thinking about the DOS users, the OS/2 users and the Windows
3.11 users. 

> If you are considering the Network Browsing problem, then there are 
> other ways to do this.

It isn't browsing.  Samba is the glue that holds a lot of things
together.  

I'm sure we will find out a little of this in a year or so, when 4.11
starts to be seriously used in production.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




