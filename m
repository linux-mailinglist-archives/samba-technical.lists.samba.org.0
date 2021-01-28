Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FE30747A
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 12:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=khhQXpDZevJq4MNXlLasO2TR6L4IfAXjGA8EZtUS4Rg=; b=PTB6Br1WR87pRdjHxjnWXzD8K1
	pOmciitlpqTogI68sLOUgBvNR5oDFGqtbqL5/UXdNMWl1s6LZS1SFY0et7eGedQZjyYP7ZCEH2gYa
	NkhGO3VutgjQ5VhZA9BwAaTJzqHmCqoZSXNzhIOD6uu9QRt3CxWe1tNxhDNfSV+XOxDqDaeE/amdS
	UHlIr57QFXrE8GHVP1jbnzcvFAbGzeWoHZXIwcind5PLIfnXUmsAEuD3Fe+QaRKW8+lVqlY2lGRO+
	RY1KoXBqs3ogSsJ8JZ+ugb3DEYNwxETlixHCO2rQgPjPtuFqz23bQM9gDnTA2vdQpKsRPwEkntvru
	LAmLuQzQ==;
Received: from ip6-localhost ([::1]:31686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l55Ev-007WXC-OM; Thu, 28 Jan 2021 11:13:29 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:39362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l55Eo-007WX5-2d
 for samba-technical@lists.samba.org; Thu, 28 Jan 2021 11:13:26 +0000
Received: by mail-io1-xd31.google.com with SMTP id e22so5129743iog.6
 for <samba-technical@lists.samba.org>; Thu, 28 Jan 2021 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=khhQXpDZevJq4MNXlLasO2TR6L4IfAXjGA8EZtUS4Rg=;
 b=ZPGUIwBCehajzCUMQTCmZhKTWgWLtpDs6copCZBdLaZUa/8QFWnTBhU6c9oZOfqLcv
 203Rzig67qagtnpNQgSoFCUJSlFXWQ7abw3FQawkgEtt/RLSNyoZ/KduUN2Hy1RyY1/h
 z5jgNBASXyi9+1/FJ2p2tmuRuddSSS3wt4dJ/+LxonXS8K3LPvhCpW9sxrm2QIgngyxH
 mKHo83xFlVtDXrLM0OYN0CcLyPRACaVaUJikUl7EGUbMUKw/y+QdUFFyj+98C1w5Z9eA
 GLKCIqbBOi+Z6r/Hj4P/ducBNxOshZYYQJSOZp/AhGCelu8NQ2jjDDNdz3PUQ9DDhJip
 QXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=khhQXpDZevJq4MNXlLasO2TR6L4IfAXjGA8EZtUS4Rg=;
 b=ujDaTgE7m59e/R+X+Df+umKCDogFaLU5E98y8PKkEvsjGxFhAhxEHxOz58/uHGYzsl
 ei1zujLRzoJdypoGxLXVI6qGE9KGrWau/zV3lHLlhkie6GBMH00zZPADal5j50vcNPyv
 b5WcOcm2Y2lLNqZJEs69UQSGJWdW+yb8QMemLnfCks94UdBu9csd07u1lQyaqHAp4VGD
 73wUi0j7zBZJbm/oaAg2SBJOED5SglXGSKtCBKsPKa6vjXmMRoDOjQi4q7NnJelJa+rr
 XW5ETpu9+GRi3Wygl1x+bTle4lbAHL2ZSfrhx0L1iVpcZLOmtBW/w4M20PA/ya7OFyLP
 ajCA==
X-Gm-Message-State: AOAM532oybHZT3PmBmUwDgyjljovhYlVrHO01NlbgDWLNf4wkspELnz8
 y38k6Mko52zvcShuC4fKLeGLWsvwkVGZRnMvk6M=
X-Google-Smtp-Source: ABdhPJxzVWjy/5wuKb1NsLZESZgJDD9348uqr7XnfQ/QSjnsbZrhwxS4+7UTUmj4lTKf9A3O1tzbRguBgtnQ8tPd8AM=
X-Received: by 2002:a6b:f107:: with SMTP id e7mr10991826iog.191.1611832394111; 
 Thu, 28 Jan 2021 03:13:14 -0800 (PST)
MIME-Version: 1.0
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
 <20210127204613.5735addd@martins.ozlabs.org>
 <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
 <20210128202516.40677c83@martins.ozlabs.org>
 <3cabb185.5677.177486f8025.Coremail.wuming_81@163.com>
In-Reply-To: <3cabb185.5677.177486f8025.Coremail.wuming_81@163.com>
Date: Thu, 28 Jan 2021 21:13:02 +1000
Message-ID: <CAN05THR4WtBJoPt9FRMs3zYmargQ0Y8VFQiL-LvW+1g5RVDcQA@mail.gmail.com>
Subject: Re: Re: about active/active clustered nfs with ctdb
To: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I havent worked on ctdb in ages, but the iscsi scripts in ctdb is
probably not suitable for your use case.
It is aimed at when you want to export an LUN via a specific
targetname from the ctdb cluster to external iscsi clients
and basically have a active/passive failover mode for the target/lun
pairs across nodes.

What you try to do is have iscsi used internally for storage and then
have a file system ontop these luns and export then as NFS shares to
to nfs clients.
That could be done, I guess, but is not what I think the current
scripts do so you might have to write a bunch of new eventscripts to
do what you want.

The nfs support in the eventscripts also might be problematic. When I
worked on them they were only aimed at nfsv3.
As nfsv4 is displacing v3 quite rapidly, these scripts may or may not
work for you.
But they also were aimed at an active/active configuration where all
the data is shared from a common cluster backend and is available
active/active through each node.
I am not sure how well the current scripts will work with nfsv4 since
there are so much more state involved.


Since you basically want each share to be handled in a active/passive
failover mode I think pacemaker will be a much better
fit an easier solution than trying to push a acrive/passive failover
model into ctdb.

Pacemaker as you said does need a shared resource to handle safe
failover. In ctdb this is mostly handled by the shared backend cluster
filesystem that ctdb is designed to sit ontop of.
In a pacemaker solution, as you don not have a backend filesystem with
coherent locking, you will need a different solution to avoid
split-brain.
I am no longer familiar at all with current best practice for
pacemaker but I think having a shared, high-available SCSI resource
that supports PersistentReservation could be a solution.
Using PR to ensure that only one node at a time is active.
But, this is all very old and possibly obsolete understanding of pacemaker.


TL;DR
Still, I think as you want active/passive failover for your shares
pacemaker is likely what you want and not ctdb.
The pacemaker folks will know much better how you would set these
systems up than I do.

regards
ronnie s


On Thu, Jan 28, 2021 at 8:01 via a spPM =E9=A3=8E=E6=97=A0=E5=90=8D <wuming=
_81@163.com> wrote:
>
> "In your scenario, is the filesystem on each LUN associated with a partic=
ular public IP address?"
> yes
>
> "It would be good if you could do this without modifying 10.interface. It=
 would be better if you could do it by adding a new event script."
> thanks.
> I am sorry that I have another question.
> redhat provides another solution:
> https://www.linuxtechi.com/configure-nfs-server-clustering-pacemaker-cent=
os-7-rhel-7/
> they use pacemaker to make an active/passive  nfs cluster. its goal is ve=
ry similar to mine.
>
> if the cluster consists of just two nodes, we know that there does not ex=
ist a correct algorithm for the consensus problem. The pacemaker solution o=
f redhat uses a fence device (we can use a shared disk. for example iscsi l=
un, as a fencing device),  so it may be correct.
> But I have not found any doc about fence device and ctdb, so in theory my=
 solution may be not correct for two-nodes cluster.
> I am very curious how does ctdb tackle the problem or the problem is not =
tackled.
>
> if any how-tos or implementation/principle of ctdb is provided I will be =
glad.
> sorry to bother.
> thanks for your reply.
>
> At 2021-01-28 17:25:16, "Martin Schwenke" <martin@meltin.net> wrote:
> >Hmmm.  Sorry, I might have read too quickly and misunderstood.  70.iscsi
> >is only designed to run tgtd on nodes and export LUNs from public IP
> >addresses. In your example the nodes are iSCSI clients, mounting a
> >filesystem on the LUN and exporting it via NFS.  That is very different.
> >
> >Sorry for the confusion.
> >
> >In your scenario, is the filesystem on each LUN associated with a
> >particular public IP address?
> >
> >It would be good if you could do this without modifying 10.interface.
> >It would be better if you could do it by adding a new event script.
> >
> >peace & happiness,
> >martin
> >
> >On Thu, 28 Jan 2021 09:55:29 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D <w=
uming_81@163.com>
> >wrote:
> >
> >> martin, thanks for your reply.
> >> No, I did not modify 70.iscsi. Maybe I need to make full understanding=
 of it.
> >>
> >>
> >> after many days reading/debuging the source code of ctdb and its shell=
 scripts, I found the key point in the script 10.interface.
> >> my modification  is:
> >> 1 create nfs share(mount fs, modify /etc/exports, restart nfs service =
..) before any public ip is added to some interface
> >> 2 delete the corresponding nfs share after any public ip is removed fr=
om some interface
> >>
> >>
> >> I tested many shutdown-reboot cycles (of node in a ctdb cluster), and =
the results are the same as my expectation.
> >> I think I need more tests and more scenario tests.
>
>
>
>

