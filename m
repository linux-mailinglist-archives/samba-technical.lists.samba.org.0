Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6D53FAD9
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jun 2022 12:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Lob1Vg6k6murOLX+7Iq+i2/Ao2BEN9WR8HvewWicoHg=; b=hHPZfoaw/Eu44v275RRFEMETx/
	iNNT8rUykX1ehT6mcLWtZF9E6nvJRDm4LqokxgRidL8Zgn1KqVzX9vCsCFDigD87CVkIO0SzRP4Dp
	E25TXD3gYFrGisF8hho5UCTYXrU5xtZm5BitUkJQBIoWXcd6NKp7/Ui5OB0szQ8GpNIK0PY2SGd8k
	SufWylx33xbGPNHeXBBPq+dzRfr52Qa8IXBZz8TJbJChygoGk6trKrFSORF1WCHBcY9f9fXmhChgk
	jpY31+GK7Jktf9jdZcHc1GIoz5uC/86lB/lXD3TPu2DZwfPGLsZ+5U/02HUy24mu3J58cfS4CdIxv
	Ix8tlbdw==;
Received: from ip6-localhost ([::1]:56732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyW96-007gQq-S4; Tue, 07 Jun 2022 10:09:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyW91-007gQh-Vf
 for samba-technical@lists.samba.org; Tue, 07 Jun 2022 10:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Lob1Vg6k6murOLX+7Iq+i2/Ao2BEN9WR8HvewWicoHg=; b=ASWzdXwaTZpHpnaqZe3ZfYxpRM
 0eBsqk/EoFwoWmahYFf0sRyDYyvJ/CsdF219Je19h/d5HGh1fID7OYgNCovPARwg8Rr+NpAFjohnC
 s5PPnOeEdIXLFoToXa9/xS1qX8iFxmH9NDVK39OcJekkZR63xCvk4/TMuVC0Ko16FwRedEfXOcMKK
 kHt/yX2ZXCRw7LbYfhZoVdlrzzM+qDPP9cxWZ0XQdHqO7nBtagZNkNWaoZsYQ6YKuZ47QyAbdEF7H
 1X0TjXX2n8gyPawCu75M8lMKJtRP3JJtAeqyg1GFsdxuNcjjC/d87Gsc5kzTtCjeXxH7vJ2OKG4/R
 KjfvtJVdT72UVGKufoVdeiG/5dyQSmB3j/DjQG4xt4HLQeQLBfnTo+lqpLUADuGUu3oRCTv2LI69o
 xRcGwgGIFAvH/DSeQSAQ3zwqQwdNY4FwbYcc9DKDct9++8jbG/THNxs6/OObhVCbfXPMv1DXTI6N1
 s+0ZhxkgsPoa4o1u6rwAG7kg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nyW8z-004NXn-VE; Tue, 07 Jun 2022 10:09:02 +0000
Message-ID: <73fce0f07e74d97fb7cf78569448591162dea1c4.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: Jeremy Allison <jra@samba.org>, scabrero@samba.org
Date: Tue, 07 Jun 2022 22:08:58 +1200
In-Reply-To: <Ypo8dcAnXWqnhBye@jeremy-acer>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <Ypo8dcAnXWqnhBye@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-06-03 at 09:53 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, Jun 03, 2022 at 12:00:16PM +0200, Samuel Cabrero via samba-
> technical wrote:
> > Hi,
> > 
> > I have received some complains after we dropped netgroups support
> > in
> > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > netgroups went with it.
> > 
> > Some people still use netgroups without NIS, stored in LDAP and
> > made
> > available to the system through nss_sss, but it is also possible to
> > use
> > /etc/netgroups.
> > 
> > I had a look to the removed code and I think it is possible to
> > reintroduce netgroups support independently from NIS, using the
> > getdomainname() function from glibc instead of
> > yp_get_default_domain()
> > from libnsl.
> > 
> > Should we bring back netgroups support?
> 
> If you can do it to help a customer without an extra
> support burdon, then go for it !
> 
> I will help review the code.

I agree.  It is a hard line to find but I'm sorry we got too aggressive
pulling stuff that folks were using.

There is still a real use case for Samba that isn't all AD domains, no
matter how much I love them, and a set of administrators who have been
with us for decades now that have Samba working just how they want it.

We removed it because the supporting libraries were going away, but
looking over the code I see how netgroups could be quite handy, exactly
because they are not unix groups. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


