Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA9377180
	for <lists+samba-technical@lfdr.de>; Sat,  8 May 2021 13:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=50mrV+Iurj6sVsxyGlOZZ/UM4ZNCvBnRgE+V4WfSETc=; b=t+AeetP1suVjwgJrq7BkGjTb9A
	v0UpqLJL7qSeHR0X6yMoVD8QjjPxfX+hMQy4A4HAhl7dvu7pwmRxRfJtlzOl/HonXFwjDS1ypMmkT
	PGNGoZu4jMFnVLy7F6YPMvDbwoXlAQvaX5MPBpIkZ/TUkKMXObhIwHl0ataNj/UJlHpuJDMn048eT
	COWoig6JCqBc+bzplNb3ALNuqkHoSwZjTL7Xqwyw7IT9crPjW7ENVw0u5uOC+bqFJzRqC7X1J5BlD
	uQvVLhfIRYdCBbPhVZiqIbOmWm6JwJ75Kk/tSWe4KBTCNsebEM+mtPsRqnIYYbQsW0EISmUIFjrZc
	RKvEuH8w==;
Received: from ip6-localhost ([::1]:58806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lfLQQ-00GTLI-Jj; Sat, 08 May 2021 11:47:14 +0000
Received: from ozlabs.org ([203.11.71.1]:44327) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lfLQK-00GTL9-Gt
 for samba-technical@lists.samba.org; Sat, 08 May 2021 11:47:11 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FclsY6rD0z9sT6;
 Sat,  8 May 2021 21:46:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1620474418; bh=wUpRxGBqxSIH/BotFarAJT8Ul7XwBdVLLZkNyAs6W8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UCYCRzlT1IETU8ptIHmijxZBmCto/iSAOR95OVqYwjD4UJwyTWd6oNuyy8rHnzgic
 BRZHsDJ62PHH8ZUvvT22eyrgAbAJpfj32g3uygPplR2bKIooxRJlC5lyX7GiSTiVyq
 gVSk1rgFoJFMi9jbE9CLPSA+oVjlvueBsahczuR+6qACckCmB9V659MNXQa3nguKll
 d+TwWDx3jihz2g2b2BhYNf5/J2705iuGqZyXydXZQhA5gvma4fE0W4L2zStcu1mtl/
 b8+NN41Kf8lNOJbLDbqQ4z/cWO0NzWWBRDdNYxxCBiuS6/sg5Hk7RaiKtba98Y5eR/
 5atWAxqH31vdg==
Date: Sat, 8 May 2021 21:46:57 +1000
To: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Subject: Re: ctdb cluster not healthy:"Unable to take recovery lock -
 contention"
Message-ID: <20210508214657.4fa85942@martins.ozlabs.org>
In-Reply-To: <748e035f.4f2c.1794b5d67b0.Coremail.wuming_81@163.com>
References: <3c8144f0.447c.1794b1d8b68.Coremail.wuming_81@163.com>
 <748e035f.4f2c.1794b5d67b0.Coremail.wuming_81@163.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 8 May 2021 17:44:43 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D via sa=
mba-technical
<samba-technical@lists.samba.org> wrote:

> sorry that my attachments are too large.
> and my ctdb version is 4.8.5

> At 2021-05-08 16:34:57, "=E9=A3=8E=E6=97=A0=E5=90=8D" <wuming_81@163.com>=
 wrote:
>=20
> hello, everyone.=20
> after I started my ctdb cluster many minutes , my cluter  are still not h=
ealthy.
> the logs are in the attachment.
> my cluster consists of three nodes. /etc/hosts file:
> 192.168.200.10 node1
> 192.168.200.20 node2
> 192.168.200.30 node3
>=20
>=20
> public address config file:
> 192.168.210.10/24 ens15f1
> 192.168.210.30/24 ens15f1
> 192.168.210.20/24 ens15f1
>=20
>=20
> nodes config file:
> 192.168.200.10
> 192.168.200.30
> 192.168.200.20
>=20
>=20
> the ctdb lock file is /opt/ctdb/ctdb.lock
> /opt/ctdb/ is a mount point of a glusterfs cluster
> the glusterfs volume :
> [root@node1 ctdb]# gluster v  status clusters_volume_ctdb
> Status of volume: clusters_volume_ctdb
> Gluster process                             TCP Port  RDMA Port  Online  =
Pid
> -------------------------------------------------------------------------=
-----
> Brick 192.168.200.10:/data/ctdb/192.168.200
> .10                                         49153     0          Y       =
6215=20
> Brick 192.168.200.30:/data/ctdb/192.168.200
> .30                                         49152     0          Y       =
17858
> Brick 192.168.200.20:/data/ctdb/192.168.200
> .20                                         49152     0          Y       =
9134=20
>=20
>=20
> I have examined the logs of gluster mount point and gluster server nodes =
and failed to found any anormaly.
>=20
>=20
> ctdb status of the node1:
> [root@node1 ctdb]# ctdb status
> Number of nodes:3
> pnn:0 192.168.200.10   UNHEALTHY (THIS NODE)
> pnn:1 192.168.200.30   DISCONNECTED|UNHEALTHY|INACTIVE
> pnn:2 192.168.200.20   DISCONNECTED|UNHEALTHY|INACTIVE
> Generation:INVALID
> Size:3
> hash:0 lmaster:0
> hash:1 lmaster:1
> hash:2 lmaster:2
> Recovery mode:RECOVERY (1)
> Recovery master:0
>=20
>=20
> ctdb status of the node2:
> [root@node2 ctdb]# ctdb status
> Number of nodes:3
> pnn:0 192.168.200.10   DISCONNECTED|UNHEALTHY|INACTIVE
> pnn:1 192.168.200.30   DISCONNECTED|UNHEALTHY|INACTIVE
> pnn:2 192.168.200.20   OK (THIS NODE)
> Generation:1475941203
> Size:1
> hash:0 lmaster:2
> Recovery mode:NORMAL (0)
> Recovery master:2
>=20
>=20
> ctdb status of node3:
> [root@node3 ~]# ctdb status
> Number of nodes:3
> pnn:0 192.168.200.10   DISCONNECTED|UNHEALTHY|INACTIVE
> pnn:1 192.168.200.30   UNHEALTHY (THIS NODE)
> pnn:2 192.168.200.20   DISCONNECTED|UNHEALTHY|INACTIVE
> Generation:INVALID
> Size:3
> hash:0 lmaster:0
> hash:1 lmaster:1
> hash:2 lmaster:2
> Recovery mode:RECOVERY (1)
> Recovery master:1

The above "ctdb status" output tells you that the CTDB nodes are not
connecting to each other. The logs also do not show the nodes
connecting.  I would look here:

  https://wiki.samba.org/index.php/Basic_CTDB_configuration#Troubleshooting

Is there a firewall blocking connections to TCP port 4379?

> the ping_pong test results:
> (the cluster is running)
> [root@node1 ~]# ping_pong -l  /opt/ctdb/ctdb.lock=20
> file already locked, calling check_lock to tell us who has it locked:
> check_lock failed: lock held: pid=3D'0', type=3D'1', start=3D'0', len=3D'=
1'
> Working POSIX byte range locks
>=20
>=20
> [root@node2 ~]#  ping_pong -l  /opt/ctdb/ctdb.lock
> file already locked, calling check_lock to tell us who has it locked:
> check_lock failed: lock held: pid=3D'19142', type=3D'1', start=3D'0', len=
=3D'1'
> Working POSIX byte range locks
>=20
>=20
> [root@node3 ~]#  ping_pong -l  /opt/ctdb/ctdb.lock
> file already locked, calling check_lock to tell us who has it locked:
> check_lock failed: lock held: pid=3D'0', type=3D'1', start=3D'0', len=3D'=
1'
> Working POSIX byte range locks
>=20
>=20
> I have searched many pages for a long time but failed to solve this probl=
em.
> thanks for any advice.

I'm not sure if there is actually a locking issue.  The logs show
contention for the recovery lock, so locking appears to be OK.

I suggest checking why the nodes can't connect to each other via TCP.
As mentioned above, this may be due to a firewall.

By the way, this question really belongs on the "samba" mailing list,
rather than on "samba-technical"...  ;-)

peace & happiness,
martin

