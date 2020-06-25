Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD202099B0
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 08:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZdZwXxlwctaXjk5/jSN+CCLS2GiXQmtDgRSTyGu0Pac=; b=xF2UBkYDJHDYgqOrWTxcroWLKt
	f+N2+arKk2ayi2VQybXARXbj4bItROfDqeCz0KLXkI55nRWhK/6pQhCNUoFns3flEyUJ1JzS9GcDs
	hEAalKHIKT/G4sq4EXpRREew2/N99pkzxB1AlOhDcNA82VZ6z/ROet18uhW/355JTZXKoPhmhY5pB
	r+Dpb5HsNbyRq6AXlGQnNH8lpnfoIxmmwT6r3Fxq2U7WG9ZdfuQBEeTzNHBEn0D+wenpbGPWzlzGS
	3saP4VykzJIsl9sohmiR9USE+dqxLUsVcFkUVdojdFu0SVjGLYq6aOvGklYiLCY8P3SuIq+fDHHR4
	XbURKpDw==;
Received: from localhost ([::1]:62664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joL0g-002FFO-TN; Thu, 25 Jun 2020 06:05:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL0a-002FF9-Ag
 for samba-technical@lists.samba.org; Thu, 25 Jun 2020 06:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZdZwXxlwctaXjk5/jSN+CCLS2GiXQmtDgRSTyGu0Pac=; b=Zq3mCJYhPjwshEa2W/3dGJHsXy
 uFu2n1sIAlHcAZD5pJgdmvSMbnGbyX8XNT+Dc1ZHU4oJsmJPErxlSNAAi9uwglRVhrr5bREN6L6L5
 iKCDLS/aU2sYgjMScXHodoCKZkfJW8R4v+Qh76UiuocsZYt4V+sdY050pMwiwLG9aUVhiS8HFJMBs
 rr2ugSYbBQbzQCicoNc5welJhdg32k8gNUQf3ElMCzB2fnEiGhHLSFZcIagZ1TzAkNd5kLFVP3OSP
 wDX6al6MJk11ltMEW/MgGY4bJT6Iu3zIyvuSKicRAnhCv/9y335j4gokVq+FoLS+kTmvMIItsKrI8
 FU3H9wlKavqXWMhuvqIvJu2t8pFIVjlYNbBJRxPYi4rclSegImOmdtQ33m4MzQuTb0aMeRvNNKlOr
 kGNAC/fgmjV+CPsAVMLyOI2JEAjo4n1F2e7s1ofTpBmJTRnkJx0206VwnJgNEvLGcSh/e3GnBx661
 3N6xe4//GugWUAJqwsHg+Wer;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL0V-0006Fr-I1; Thu, 25 Jun 2020 06:05:07 +0000
To: Stefan Metzmacher <metze@samba.org>, Anoop C S <anoopcs@redhat.com>,
 samba-technical@lists.samba.org
Subject: Re: network namespace support in selftest (was: Re: socket-wrapper
 fd-passing)
Date: Thu, 25 Jun 2020 08:05:07 +0200
Message-ID: <6063074.KqS85teMZm@magrathea>
In-Reply-To: <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 24 June 2020 23:26:55 CEST Andrew Bartlett via samba-technical 
wrote:
> On Wed, 2020-06-24 at 23:14 +0200, Stefan Metzmacher via samba-
> 
> technical wrote:
> > Hi Anoop,
> > 
> > I rebased your fd-passing patches on top of socket_wrapper master.
> > 
> > See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/
> > 
> > Please also notice my commit on top where I added some more hints
> 
> > on a better design:
> I've not looked into this in any detail at all, and I'm sure you are
> aware that with the network namespace mode for selftest we can avoid
> socket_wrapper and so base ourselves directly on kernel sockets.
> 
> This of course requires privileges so has other implications, but I
> wanted to mention this more broadly in case this helps us get out of a
> tight spot here.
> 
> This is the work Tim Beale did a year or so ago.

And namespaces work inside of containers (namespaces)? Just asking because 
gitlab-ci is a container ...

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



