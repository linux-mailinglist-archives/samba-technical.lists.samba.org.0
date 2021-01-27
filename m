Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5D305748
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 10:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JwgwhXisXQYYVYYgvWKbU61rnUE/MAXLOXyjkOpcHcU=; b=T5AEiTOq1h+2lAc6d4FSIGXMbZ
	3iCNWd9iGvDBYTBoaTPCNNMhMbp+uHzuw/w3YSS7m9icrnw45f/Og6QmDeDX4SkFKShSuGhVy6Kuy
	9S4l2ACKyeiU/M8DKKAlkLqPdLaoFWNuHzO3QSsxiXywvwFuPx9rHdG26VfcGuR9MjXYNmCeC59Ux
	Cowllx4PY8Dy2Th+vNIIK26RfLFYDQKQrdLX9/dmE1jWdSBQNjcJec3rhgD+OkIwwsm8qr42gpU+V
	N1xfLcloz5H5le7bMN6NJqjQcSUx/DSd5O+C9nAYJWOMK6VJPQH17/JVZSYZGPbI1ZoRMLgABbx0O
	7FA36HTg==;
Received: from ip6-localhost ([::1]:24590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4hPY-007MOx-2H; Wed, 27 Jan 2021 09:46:52 +0000
Received: from ozlabs.org ([203.11.71.1]:42339) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4hPO-007MOp-9j
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 09:46:48 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQdyv12HVz9sVX;
 Wed, 27 Jan 2021 20:46:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1611740775; bh=uV7FdODCoe0DXRH0cWXj+2vHYAxUUwuXyMFuBpP4SUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YjqkauNsERD2iSVepWv6eNwaFseQc3KfiGeYBUFZVVzB2Cweebn97KmJdPW6uebtC
 JyjJpcHdkTKh6zf4wFlX+HyqIHRSsn5jPoPzdNBcP1XYKpnphawA8wHdFcidgrqPoC
 KV8qrKdgHDE3Xyuqd0W+oD4AY0OjmqZG/+30OHvJEfVyX4ouH8BgDwKHs2Qx0hhx9T
 +OzMmIqRQTAU51Xo65KyJExXykiPsF4fvajFlnhWdP5x7Wlfz7vlRUH5TBLiAuoeut
 mr4N50oLY+8uomNkZwOPsPaGN0ddaYPXul22euaSavYIFOhS2u8J9dVlbz6A0j0jEY
 ahSdKiZvtR1Hw==
Date: Wed, 27 Jan 2021 20:46:13 +1100
To: =?UTF-8?B?6aOO5peg5ZCN?= via samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: about active/active clustered nfs with ctdb
Message-ID: <20210127204613.5735addd@martins.ozlabs.org>
In-Reply-To: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Fri, 22 Jan 2021 15:55:54 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D via s=
amba-technical
<samba-technical@lists.samba.org> wrote:

> I want to build a nfs cluster:
>=20
> 1) the nfs cluster  consists of three nodes(linux servers)
>=20
> 2) each node has  logined an iscsi lun, i.e.
>=20
> node_1 -> lun_1
>=20
> node_2 -> lun_2
>=20
> node_3 -> lun_3
>=20
> 3) make xfs file system on each lun
>=20
> 4) export each xfs file system via NFS
>=20
> node_1 -> lun_1-> /share-1
>=20
> node_2 -> lun_2-> /share-2
>=20
> node_3 -> lun_3-> /share-3
>=20
> 5) ctdb distributes public ips to the nodes
>=20
>=20
>=20
>=20
> if one node is failed, ctdb redistributes its public ip to another living=
 node.
>=20
> and the shell scripts executed by ctdb on the node, will mount the file s=
ystem, restart nfs service etc.
>=20
> if the failed node restarts, similar steps execute.
>=20
>=20
>=20
>=20
> I have written some shell scripts to implement the above process.
>=20
> I hope that during the lun/service moving process,=20
>=20
> the file io on the mount points of the corresponding lun is blocked for o=
ne or two minutes and succeeds after the moving process completed.=20
>=20
>=20
>=20
>=20
> My test result is:
>=20
> scenario 1: one node failed, another takes over its service
>=20
> the file io on the mount point will be blocked almost everytime
>=20
>=20
>=20
>=20
> scenario 2: failed node restarts
>=20
> the file io on the mount point sometimes is blocked, sometimes the io(ope=
n, write)  will encounter some error.
>=20
>=20
>=20
>=20
> could I achieve my goal just through modifying/rewriting the shell script=
?=20
>=20
> or must I modify the kernel nfs or ctdb?=20

Are you using CTDB's 70.iscsi event script for this and adding the
extra scripts that it suggests?

Unfortunately, although I am one of the CTDB developers, I don't think
I have ever tested this script so I am not sure how reliable it is.  :-(

I'm CC:ing Ronnie, who originally wrote this event script, to see if he
has any advice for you... if he can remember this at all...  :-)

peace & happiness,
martin

