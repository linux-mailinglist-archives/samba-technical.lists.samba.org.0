Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F110F58C
	for <lists+samba-technical@lfdr.de>; Tue,  3 Dec 2019 04:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uq8cBDvKR8MjOK6limgheyw6zDITJW8o7GoQ4UdNY78=; b=2ORiwDGATb6Krzae7J/PqDXajx
	9iAafClLfbcS//KOKedkMrfTuFVDbR/6MB28vYV3TogV9GBI6hIIPhFmJp5qZ7Hi5c+hsTJhMiquB
	BIf3MCX42MsdvpIsF5RFWrr6mI7KOY+e1BcezkEbHWm8QTKVmYDlXGdK86KfvKKXQoB9QdvBSpq5o
	VX+4Y+ISoVtdczsjmhMywTc/nT7nY/C7q8+gGGZxQ4De06YJzgELLUTaoUlqKj7i/exiftUKdLGn7
	ILZQZs/6tc40N080hvFvZXt8iJmLMPbZsd1e5ug2dl+hsVE0RYZXWuycmYOeElHXu9Ybx05AIs+pX
	MTifH4Fg==;
Received: from localhost ([::1]:65260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ibynE-005jf2-86; Tue, 03 Dec 2019 03:24:04 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59921 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ibyn5-005jel-Tz
 for samba-technical@lists.samba.org; Tue, 03 Dec 2019 03:24:01 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47RnPR1PRDz9sPc;
 Tue,  3 Dec 2019 14:23:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1575343403; bh=8oBJsxtSYD8UTdwMH3bULeOzAH+HMaqVoB7wG6C4Q5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bDjJfN7A6N/5iI2mpSJzh6ASuJtfJVGKxH6Figees9bouF1rB2DP/TtYH+MeDfLXY
 erG5ZoN1QBezUp87OjJOvloFAJQXBnCYAVWxzA9o1GuEveLk4Kh+l3ykyOxy+GKqbX
 c8rQGi1/4hGr8/m7eIWwm1dEQCZH32QG8VG4m+LPg/snKPxLnd+Yiq3CLiZKsSL7kV
 9JoLCsDHzPaJ34pzP3ozMLtwrrd4O9qjSx2HzEw5wzGBr+bAwR5msil122cLOtLLam
 mgvmL1axQqVI+m8tuMI/4QnQq8k1zfaFqCAKMLKFRBG9Lz737c42iI8cNLG5xh9V3m
 z+Z8Pdks7CrOw==
Date: Tue, 3 Dec 2019 14:23:21 +1100
To: =?UTF-8?B?6IC/57qq6LaF?= <gengjichao@jd.com>
Subject: Re: ctdb 4.11.2 version failed to recover
Message-ID: <20191203142321.29eb01a3@martins.ozlabs.org>
In-Reply-To: <07289a1fd0a740db8e1f0abad2b7a49c@jd.com>
References: <07289a1fd0a740db8e1f0abad2b7a49c@jd.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Fri, 29 Nov 2019 07:20:59 +0000, =E8=80=BF=E7=BA=AA=E8=B6=85 via samba-t=
echnical
<samba-technical@lists.samba.org> wrote:

>        I use the ctdb of 4.11.2 version, include the newest patch(https:/=
/bugzilla.samba.org/show_bug.cgi?id=3D14175). But,when I test the NIC excep=
tion, I encounter a problem, the ctdb cluster can not
> Recover Normal.
>        The test steps are as follows:
>=20
> 1=E3=80=81 ctdb cluster have two ndoes, nodeA and nodeB=EF=BC=8Cthe clust=
er status is OK=E3=80=82
>=20
> 2=E3=80=81 Ifdown the nodeA and nodeB=E2=80=99s NIC, which config private=
 IP.
>=20
> 3=E3=80=81 After 25 seconds, nodeA and nodeB detech each other dead=EF=BC=
=8Cthen call the functions: ctdb_tcp_restart->ctdb_tcp_node_connect,
> but bind failed, print the log:
>=20
> node 10.240.226.211:4379 is dead: 0 connected
>=20
> Tearing down connection to dead node :1
>=20
> Failed to bind socket (Cannot assign requested address)

It really depends what you are trying to test and how you are doing
it...

I am wondering if you are using:

* ifdown <device> (which unassigned the IP address)

* ip link set <device> down (or ifconfig <device> down)

The first of these definitely does not test anything like a
hardware/link failure.  Normally, if a link goes down the IP address
will stay on the interface.  This case is much more likely than the
case where an admin accidentally takes down the wrong interface.

> solution:
>        when bind failed, no one will reestablish connections, even the NI=
C is up. I think when bind failed, we should use the time to retry. The pat=
ch is follow, I test it work well=E3=80=82
> --- a/ctdb/tcp/tcp_connect.c
> +++ b/ctdb/tcp/tcp_connect.c
> @@ -236,6 +236,11 @@ void ctdb_tcp_node_connect(struct tevent_context *ev=
, struct tevent_timer *te,
>                 DBG_ERR("Failed to bind socket (%s)\n", strerror(errno));
>                 close(tnode->out_fd);
>                 tnode->out_fd =3D -1;
> +               tnode->connect_te =3D tevent_add_timer(ctdb->ev,
> +                                                       tnode,
> +                                                       timeval_current_o=
fs(5, 0),
> +                                                       ctdb_tcp_node_con=
nect,
> +                                                       node);
>                 return;
>         }

So, while you have identified a situation from which ctdbd does not
recover and provided a possible fix, I would like to understand what
you are trying to test before we agree on the best fix. ;-)

Thanks...

peace & happiness,
martin

