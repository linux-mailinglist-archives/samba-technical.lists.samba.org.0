Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850B156E85
	for <lists+samba-technical@lfdr.de>; Mon, 10 Feb 2020 05:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3+J3zfSrNmpqIR/nKvcZCPdhlLjmJtosEZDm/16okgo=; b=4dytMwB9jkXz18s8sbS2e7Kxif
	S6fkENLBvG0FFOCNYuekmwEcpI+kVe6g51Hzpea8OCnGIYgsNJczqLlVuJ/1KyYo9VVJ2wSbZpIfy
	sCAaxT00hNbDjkpH4LpfNT8UpcYO3HJmXzSv/MgazvbwpdNoQj27QTIKQ8BH1w0BtUw0ABgKekVZX
	Mqcs9Nt1dpS/0q9GR+YhzVi6IEWuk68LH5zvogC3GsT9wVw2LdjqPuaPsSOhUh1CkKaYtlwMh9BAW
	xHGPxwP3q3WcKj5n25U1yw305VkjvZaVaxR4xSzsZlz73G351+LqrKWrdxfQEEhRhT8elKxsOLmVu
	Hh1gG2nA==;
Received: from localhost ([::1]:46364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j114A-0094H2-Lo; Mon, 10 Feb 2020 04:53:02 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:46915) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1145-0094Gv-AY
 for samba-technical@lists.samba.org; Mon, 10 Feb 2020 04:53:00 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48GD6X1hvYz9sRQ;
 Mon, 10 Feb 2020 15:52:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1581310356; bh=gtx2HS2ca9QZG9TDGesIOtXzBf2YjK4hLLdc1dvQn+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FyTNujCF2amHekv8nIdIadgKLZrHeRMVUziG/uqqDcWOp573V89zyeW/2N2Q6f6IV
 MzNVP9S0QYfRtzbf4OqTbdzLDoEGF4ro4+umSX8OZV2ri+w69gSPkKFhzm6fnzEERV
 BQ7+JCP/QY+xdQzsVkqi0CZzhqqi8zbPR3rxJFC3rclF2OgXit2FqOm5J9BFb8jKt1
 xkRl9u83GsIFBsYgS9sUyj01SEm7U4yr8Ci5tRV3htMLKGCoQ+Jq5RyLakqhpNMYPd
 1ZX3D8+wdi4srUuC23Ebx1Uq1KqKp16Ih1LW6r6q2teiXDMgZkb+sNZd25y0Gnkpik
 KpvAMTfQLYKDQ==
Date: Mon, 10 Feb 2020 15:52:33 +1100
To: =?UTF-8?B?6IC/57qq6LaF?= <gengjichao@jd.com>
Subject: Re: ctdb 4.11.2 version failed to recover
Message-ID: <20200210155233.1fbee1e4@martins.ozlabs.org>
In-Reply-To: <514ee7328ed64e62bda7f2ab5fcc70fa@jd.com>
References: <07289a1fd0a740db8e1f0abad2b7a49c@jd.com>
 <20191203142321.29eb01a3@martins.ozlabs.org>
 <514ee7328ed64e62bda7f2ab5fcc70fa@jd.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/KNs03M/6/sX/gaAx4v+ec57"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/KNs03M/6/sX/gaAx4v+ec57
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

On Tue, 3 Dec 2019 11:40:30 +0000, =E8=80=BF=E7=BA=AA=E8=B6=85 <gengjichao@=
jd.com> wrote:

> >  I am wondering if you are using: =20
>=20
> >  * ifdown <device> (which unassigned the IP address) =20
>=20
> >  * ip link set <device> down (or ifconfig <device> down) =20
>=20
> I used *ifdown <device> command. There are two purposes of my testing:
> The most important one is to simulate network card failure. The
> second is that admin accidentally takes down the wrong interface.

I have opened this bug to track the issue:

  https://bugzilla.samba.org/show_bug.cgi?id=3D14274

I am proposing the attached more general patch to fix this issue.

Will this work for you?

Thanks...

peace & happiness,
martin

--MP_/KNs03M/6/sX/gaAx4v+ec57
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=0001-ctdb-tcp-Make-error-handling-for-outbound-connection.patch

=46rom 6da9f25fc27cf93b0b107d53a4e242ab6c672615 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 28 Jan 2020 16:49:14 +1100
Subject: [PATCH] ctdb-tcp: Make error handling for outbound connection
 consistent
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

If we can't bind the local end of an outgoing connection then
something has gone wrong.  Retrying is better than failing into a
zombie state.  The interface might come back up and/or the address my
be reconfigured.

While here, do the same thing for the other (potentially transient)
failures.

The unknown address family failure is special but just handle it via a
retry.  Technically it can't happen because the node address parsing
can only return values with address family AF_INET or AF_INET6.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14274

Reported-by: =E8=80=BF=E7=BA=AA=E8=B6=85 <gengjichao@jd.com>
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index f54086fcd3c..559442f14bf 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -181,16 +181,14 @@ void ctdb_tcp_node_connect(struct tevent_context *ev,=
 struct tevent_timer *te,
 	tnode->out_fd =3D socket(sock_out.sa.sa_family, SOCK_STREAM, IPPROTO_TCP);
 	if (tnode->out_fd =3D=3D -1) {
 		DBG_ERR("Failed to create socket\n");
-		return;
+		goto failed;
 	}
=20
 	ret =3D set_blocking(tnode->out_fd, false);
 	if (ret !=3D 0) {
 		DBG_ERR("Failed to set socket non-blocking (%s)\n",
 			strerror(errno));
-		close(tnode->out_fd);
-		tnode->out_fd =3D -1;
-		return;
+		goto failed;
 	}
=20
 	set_close_on_exec(tnode->out_fd);
@@ -222,32 +220,22 @@ void ctdb_tcp_node_connect(struct tevent_context *ev,=
 struct tevent_timer *te,
 		sockout_size =3D sizeof(sock_out.ip6);
 		break;
 	default:
-		DEBUG(DEBUG_ERR, (__location__ " unknown family %u\n",
-			sock_in.sa.sa_family));
-		close(tnode->out_fd);
-		tnode->out_fd =3D -1;
-		return;
+		DBG_ERR("Unknown address family %u\n", sock_in.sa.sa_family);
+		/* Can't happen to due to address parsing restrictions */
+		goto failed;
 	}
=20
 	ret =3D bind(tnode->out_fd, (struct sockaddr *)&sock_in, sockin_size);
 	if (ret =3D=3D -1) {
 		DBG_ERR("Failed to bind socket (%s)\n", strerror(errno));
-		close(tnode->out_fd);
-		tnode->out_fd =3D -1;
-		return;
+		goto failed;
 	}
=20
 	ret =3D connect(tnode->out_fd,
 		      (struct sockaddr *)&sock_out,
 		      sockout_size);
 	if (ret !=3D 0 && errno !=3D EINPROGRESS) {
-		ctdb_tcp_stop_connection(node);
-		tnode->connect_te =3D tevent_add_timer(ctdb->ev,
-						     tnode,
-						     timeval_current_ofs(1, 0),
-						     ctdb_tcp_node_connect,
-						     node);
-		return;
+		goto failed;
 	}
=20
 	/* non-blocking connect - wait for write event */
@@ -266,6 +254,16 @@ void ctdb_tcp_node_connect(struct tevent_context *ev, =
struct tevent_timer *te,
 					     timeval_current_ofs(1, 0),
 					     ctdb_tcp_node_connect,
 					     node);
+
+	return;
+
+failed:
+	ctdb_tcp_stop_connection(node);
+	tnode->connect_te =3D tevent_add_timer(ctdb->ev,
+					     tnode,
+					     timeval_current_ofs(1, 0),
+					     ctdb_tcp_node_connect,
+					     node);
 }
=20
 /*
--=20
2.25.0


--MP_/KNs03M/6/sX/gaAx4v+ec57--

