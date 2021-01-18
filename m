Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F201A2FA679
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 17:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6UjIZrqoNLoTIDTm+sesMwS+1OsnoxMTVxqqPlr/FVU=; b=nTJCj6Bao+0clt1pbqh7dKHPIv
	JzA5+FGGfpiz9uMN4kfIu4I1w5x2Z01ZkCfrZe4IPbmVUpY8pQWBBiqrgbVfFvKbTR/hwEXY+lNki
	lAzIkPKsUctNkSXlv/AUeH9J0u+Phwf99EJAjHTJIEMJWjH+c01bb1wgQFDnbwubCsr42kq6ryk5Q
	Ujf8H1mTYlkDgNmHNnd2ok9bBq4q3l+51wXFk+h+Ft+odRDh7N9oLISAYze6K03c1bsVGlk8hfSAy
	dWUnCrlohOdWqDJ4rJ8JFkZ1TyWQUuqqBJZ5dJ5wdY6JVcrgYrCrc4xxq54qPj2DgFNrNI0fge2Vk
	IperG12A==;
Received: from ip6-localhost ([::1]:52826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1XZr-0064j6-1q; Mon, 18 Jan 2021 16:40:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1XZa-0064iz-01
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 16:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6UjIZrqoNLoTIDTm+sesMwS+1OsnoxMTVxqqPlr/FVU=; b=QrRsIZHUbj/FNQnkjbKSlU5CpO
 62kaCQpIAZpdxWv4SyUXgsDj4M/WV5UMopExhrW06Vk8cKcE6Okd4BXAVm86G6kNfiKzCBGEWUIQn
 96HRxX67ujxIFRpgPnMc90x1tYBmuWfSbwfEyl3trVLDHbLH3ugvQw+cJakQifJp6m1JuhO7KJpzh
 t3Jdyclm6XlegY1TZ5X3gFL2BGCLNbx+bzHMxj+AE4QjPIFpKx43ZiL5zzuV1PDeXpcd5Y8f3GX7H
 BDEYFW+a+xtLpfOSQERfe4na+v4als2iWF/QK/ZbeRKMaSdB8FukeHxLCz7X068ps5SU5ZdLVKSrs
 RKeNsppvjt5ItN8jCLWNkYZoJxn9p/980evcPM7TqTjBQ7aq1gmPU8yQTGwFfxL5lF7LpS4qa5AD0
 cDyInyJ9i0Q/gOlTLg2fjoJg6gRXkpc+iWraNu6c2AmGwW5je5KOmf692yBPPVWZU6tfS9uK7Y+Oi
 7OXukl7e3miBmS1cXwQzeVaU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1XZG-00049x-1B; Mon, 18 Jan 2021 16:39:50 +0000
To: samba-technical@lists.samba.org
Subject: Re: printer driver type 4
Date: Mon, 18 Jan 2021 17:39:49 +0100
Message-ID: <16983374.jckQO7Hm9i@magrathea>
In-Reply-To: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
References: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
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
Cc: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 18 January 2021 16:15:07 CET Stefan Kania via samba-technical 
wrote:
> Hello,

Hi Stefan,
 
> I'm wondering when will Samba support printer driver type 4? For many
> printers it's not possible any more to get older drivers.
> Is there some development going on?

there is currently nobody working on this. The work in progress branch has 
been rebased but nobody worked on it since 2017

https://git.samba.org/?p=gd/samba/.git;a=shortlog;h=refs/heads/master-par-ok


Cheers

	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



