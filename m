Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A55457AD
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jun 2022 00:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kiy10e/X7sta8+X0hwjO+iz+gOK3RBpuILNUVoEF9r0=; b=TnFMfm7ZEBarFKW5XWe2IMEkfG
	hvan/CEAz82epImWhiYE/V1ZZgaqKeGuFPMGBDK+qbdjUZlJQ9k7ABDz+NV43NBtusPsL7gk8XPwL
	GwC4Hsm3aTntbLSE43D0JCRriyWgIxjdK/zLp0gABktOMPJf9aBFkI0ajkvVFkG+dcItwsemUG5ZP
	lfYQHTYQCUIzTU0Adjqd4pLSh4drcrL8cf5OLlyCP2QxpigZvICWJwYR+gIlKKlVX+V8/l8+6waMJ
	SlH6oO6ITDXstjiEwG/kGwr4PqzKyOpW2iMqM3WhbNeXH5LbRR5xeZdl+EUGKaGt21q5js/B2PWod
	WoR/eUbg==;
Received: from ip6-localhost ([::1]:47596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzR3N-008yRg-Iv; Thu, 09 Jun 2022 22:55:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nzR3H-008yRW-P9
 for samba-technical@lists.samba.org; Thu, 09 Jun 2022 22:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=kiy10e/X7sta8+X0hwjO+iz+gOK3RBpuILNUVoEF9r0=; b=0z8dv7sxxuRf/56ARLnxlr9jWL
 FqTNu/rSj6HrkGZzrXGoRzdfCVXGx6rsfNi2hZX/j6Heq8X3zLXvfKnvUWCKVwTyqT9s/qrmMFs62
 sX03Lms/AAts/QQwfURqcMQ2IN/6BKZx5cH5d1aAXykRT0v/AtHJxBz0cFqg956KR6756TBzdt6+g
 ClML5BpYtfy+lLFyZIWv6VsmPPGdxfhxo/VjaxFIkIz2+0UXG82cEKogwYwJlaI8ia/+AeZ33TYCX
 7qS/gsxB23Y6vcs+xn5E9G3LBAVIdfW+eltndXni8iRN7st7zh34b7KOuyiXkx/QlX0CuDwwCDizT
 IA8RJjD8LnjuuqvjuEvLkr32o/4VOys2+THwW6H+FVeoEoP3jqosSk7C+MSsPE+ICZ8FkBSzBTy0r
 Y8mKJMU1vabPKWpMA6E95g3QO8F59yB0skIm9d6zcHyp1fzuqK5bJKYrK565i3DKwXlaoRfqlXRqu
 x0uikFqdoypmajUclsCdD1EB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nzR3G-004sdc-4W; Thu, 09 Jun 2022 22:54:54 +0000
Message-ID: <0803764a1436e3306cac0eb06d0fe0a8cdd047e5.camel@samba.org>
Subject: Re: More Podman work needed
To: Uri Simchoni <uri@samba.org>, Andreas Schneider <asn@samba.org>
Date: Fri, 10 Jun 2022 10:54:48 +1200
In-Reply-To: <f160ccd9-f0a2-7e1a-d04e-e35473917ae3@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
 <f160ccd9-f0a2-7e1a-d04e-e35473917ae3@samba.org>
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

On Wed, 2022-06-08 at 23:46 +0300, Uri Simchoni via samba-technical
wrote:
> 
> I'd argue that our requirements are "stock POSIX + diff + podman",
> *but* 
> podman installation is not a default one to make it runnable within
> a 
> Docker container.
> 
> I estimate that any future instability might come from the podman
> side 
> and not from the Fedora base OS side, and therefore we're better off
> not 
> maintaining special podman tricks and relying instead on the
> maintained 
> quay.io/podman/stable:latest image, even though it is based on
> Fedora. 
> We had some bad experience but hopefully it will not repeat itself.
> 
> I would not lock the quay.io/podman/stable to some tag we know is 
> working, because it prevents us from receiving security updates.

Thanks Uri for your investigation and analysis to get us out of this
pickle with the least long-term maintenance pain.  I've pushed your MR
now.  Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






