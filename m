Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CFC14DAED
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 13:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cvwV/YlglHMOvPzY6YKfoeEbOoFoRryeG3lqYhagzXU=; b=kLka8nUraErGEit4Z5DubYx3un
	bGKFjcDBSV26CSe2wOUmA16vuBN1Vp9MPgJTjEE+/yJFBs59E9gbw1hDT9Fwrin437iMMZED6A2mi
	Bvbsi8s2Gare+PjpZzCeH1V2s39TkWFH6R4ST1TkNKZw27IJAgp0iYk1gc3+GdS6+Kc2v7ZRKZrzk
	W735F9EhauOJMaK3P/F7R7Un4kEPluBHny4DnUGmxKYcXCneFzsMMazKeWMDrXra9Vmgqot2tnBHM
	HTeYXcQD6PvaV4DiHblqWmUmK5PDqbpq+I2TkhE9IccY4zu03UaDyQ/0HjFsmXub0unxHneg7ohfT
	USQ1JC3g==;
Received: from localhost ([::1]:50120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ix9DU-005UEr-BZ; Thu, 30 Jan 2020 12:46:40 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44253) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ix9DQ-005UEj-7V
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 12:46:38 +0000
Received: by mail-lj1-x243.google.com with SMTP id q8so3150106ljj.11
 for <samba-technical@lists.samba.org>; Thu, 30 Jan 2020 04:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDk2f23WUxaKEuGlnQgPDA5B6jw31ao4pL6dtlsOhh4=;
 b=Zjof9q8LcKouwQv7qud2SQONwCXdW8QPnoBCOfFK6L36WIP0SeF4hnRWysg9ej+lUT
 Yr9+21nuCd6Qh3PI+RgDizgz63+Pw/Casthio4KlYlOyQyzKyDaj5tpEs8LZoHPpwoer
 1J1mTXpKEBgj6YtSndkwYIKYjjpywxnUm5mjbETlEdLOKLdYfibVflZRkpY2RWtCXcuy
 fhUWGcBedsUffYaNTKRtC/Y/X+3ARnKq29L34Yzq8/izOGRnDOByzf2g0aPBQEC/6bmu
 4Kv0vQZJszP0Cea3JxvDvKzoUHn18mjUvpOhYRjC/kcYeovGovrrRkH9sWzbEPW8j24p
 E+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDk2f23WUxaKEuGlnQgPDA5B6jw31ao4pL6dtlsOhh4=;
 b=JWuCwMMWqLF6eO27s/yyea43zsm+6Us0xc584O/eXYgu4BusKcKXhEBL7gaonPaDsx
 Pwl91cwJqlInOyoI3Rgez6Ev51Q0esFRJbUN8npmve4rnlNwPoISGsa5bHwNE02ZvCaV
 NED3TLWv9gcDAp2mhMznFVOhOwuAr6nRQORlHmPJjkSv5CLvwFqrBBaKyCRROU8ec8oy
 AMBwGrrK9WeUv5vxCEvtd+4S+qLdFvhhwFQCvMPWgR8PJJSnV4L/VYCT81LUGcIGJqmW
 oVml6V/hpI1UddP22k8vrHBZ5r8q16cOguLbFI+IOht7FFa6PfTn19Wq2SjOGWYZhaYG
 vupA==
X-Gm-Message-State: APjAAAXCsjXd2aeris6hqKTWGX5sHjaR9YSkV7NyOxzKbhlfg/UBixuM
 K07uGhazRQpNMiRlj2I9sk4sV1sow1Cml3MCN/RQSY6rj/Q=
X-Google-Smtp-Source: APXvYqx4NwaBEqGSj3e0z/2VH0p/JqsTs+BhcYd8RW5j2cewEgNiHy4tJ0oqtK57N1jGSxjUSfMeIip4RnvTWhRbtz8=
X-Received: by 2002:a2e:3e0d:: with SMTP id l13mr2846680lja.70.1580388394453; 
 Thu, 30 Jan 2020 04:46:34 -0800 (PST)
MIME-Version: 1.0
References: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
 <20200130161536.271df9ca@martins.ozlabs.org>
In-Reply-To: <20200130161536.271df9ca@martins.ozlabs.org>
Date: Thu, 30 Jan 2020 07:46:23 -0500
Message-ID: <CAGbvivJ4-ZPpz9iaqPT_BEuRX5qUm9E8yQ4ePYQYHydUg_vr4g@mail.gmail.com>
Subject: Re: ctdb, haproxy, and ip_nonlocal_bind
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Wyllys Ingersoll via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks, Ill try it and let you know.

-Wyllys

On Thu, Jan 30, 2020 at 12:15 AM Martin Schwenke <martin@meltin.net> wrote:

> On Wed, 29 Jan 2020 16:43:07 -0500, Wyllys Ingersoll via
> samba-technical <samba-technical@lists.samba.org> wrote:
>
> > I have a cluster in which I want to use both haproxy AND ctdb on the same
> > nodes - haproxy to manage NFSv4 (ganesha) and CTDB to manage SMB.  The
> > reason for doing this is that I've read several warnings about NOT using
> > NFSv4 with CTDB.
> >
> > haproxy + keepalived require that the net.ipv4.ip_nonlocal_bind flag be
> set
> > to 1 which breaks ctdb's ability to manage the virtual public IP
> addresses
> > (among other things).
> >
> > If I do not configure any public_addresses and just let haproxy configure
> > the virtual public IP addresses, CTDB is still unable to startup on both
> of
> > the nodes in my test cluster.  It will start on one or the other, but
> they
> > never sync up and come to an "OK" state on both nodes.
> >
> > I have the "node address" value set in the [cluster] section of ctdb.conf
> > on each node to be the private address of that node and both private
> > addresses are listed in the nodes configuration file and the nodes are
> > connecting to each other privately, but they don't stay connected and the
> > 2nd ctdb node never fully initializes and starts up.  At some point it
> just
> > begins flooding the logs with messages like this "node
> 192.168.113.14:4379
> > is already marked disconnected: 0 connected" and pegging the CPU at
> almost
> > 100% until the disk with the logging completely fills up (which sounds
> like
> > a bug, btw).
> >
> > Does anyone know of any way to make this sort of configuration work ?
> >
> > Currently running Samba 4.10.10, haproxy 1.6.3, and Linux Kernel 4.19.34
> on
> > Ubuntu 16.04.4
> >
> > Any help would be much appreciated.
>
> Using "node address" should make this work.
>
> However, you're being bitten this bug:
>
>   https://bugzilla.samba.org/show_bug.cgi?id=14175
>
> This is fixed in Samba 4.10.13.
>
> I hope that upgrading makes this work for you.  Please let us know if
> it doesn't...
>
> peace & happiness,
> martin
>
