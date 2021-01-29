Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5407308721
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 09:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yLNTqvKHgV1LBoM/koCwPdormpFVjV4lEG/zjIMDggE=; b=5OTt7UkzY6s+pLKhSUb9whmsvY
	vRIh/au2fQa+Vf2kIHY0l0jOHEUzg0QM7G6DEOGdiwx+Jcdz6lk+wDAAFjYcs/tYnwxM6daTy0lXB
	qyYkK7E8kCZ53jqRkdVEZCzA97m9hd0CGzgD2xVrobw7ew+T4GecG4PcxjdkzxOFRO3Wv5Yy2Aql1
	NOgUU6Ec6g0jfzmRmO/bXVh7VIWeVUF9M3hcGKF+t/CyvirVpV3aijWo6PHiXLZa5tYC3JE7cgf9m
	0I9UTHRtYQhdN+1eJbunbbJ6NGyR19EkW0MPLgtu+ggp2a8H0MFKASb2sqOBd+G+XH/ZJR7/HyaqS
	gYCLYYYA==;
Received: from ip6-localhost ([::1]:50492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5PSd-007hse-Qw; Fri, 29 Jan 2021 08:48:59 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:43219) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5PSY-007hsX-05
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 08:48:56 +0000
Received: by mail-il1-x133.google.com with SMTP id q5so7857803ilc.10
 for <samba-technical@lists.samba.org>; Fri, 29 Jan 2021 00:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yLNTqvKHgV1LBoM/koCwPdormpFVjV4lEG/zjIMDggE=;
 b=MDqNp4/KDqig40FuXyBL3STdtxhCEcupNa/+RC++CLHumjOngBtGgHo5YVrwTWUiyD
 4bHJ7dCKy5iLIlsp8sxNX7Yae242qxM5NQAszMkC26lGw+bql0y6OwSsDO653lj9Ccp8
 D1Ivbhji77YDFlNCTS88Qoy3M4F+xi8FwpDg876T/BMx/Chejee0NTL0Q+secozHR+Nn
 GhuQWIZ0TXLoCDUVYv4XnqDwbAaHbrWt0A0km3uX7Ogog4BVp/EmGGCWwSQ6BdTYHYrI
 uYv9anHC0EA8AEFCxWOeY2bLSRMUk+IBxj4UmgiBMjH/fdpBfx1Yycyg0vBpj4G8EwOV
 4U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yLNTqvKHgV1LBoM/koCwPdormpFVjV4lEG/zjIMDggE=;
 b=kTmxWXoRuT27DHBdInm8xTBrwshULUH1L94jpCxYctlKg4HUevHi0ukVaa3v0HGMm5
 zcv0aTwNf7PcSH51wN5Cod4hT8W/WyESc8H1er+KUXDRBq22IY/du87RXZhZyk1t+Mbb
 EiRe+LnPSp7GsOmR8sX3ydstyMn4wOxLVHGYZkKjolthg3BFz2UDI3/8y4UM+Qt8bK9I
 U7Q6go5GkD4Je4zTLqmtkuENb9VlmvWoPSsvkvjQV7YatCYZHw+c6MCglaPcnWn/Ya2Z
 qQkyS219bFLw/bwXzeW18ji5p5cpLb0SAj0UvPo/i8swhIUrVTGGEC8awyTfXNdkvnw7
 MGDA==
X-Gm-Message-State: AOAM530Jh2OouOsHMEp1fdOhcw2pQA6b5t01yFoy/CwdawK8Nutvkrrq
 rtcCcKdKck5PE+R97aTop8fXqPmKgNRO9VeaEn8=
X-Google-Smtp-Source: ABdhPJx3Bx++9IBNZK93BvU67vjjGMTQF1eIEvxAcQbGa6lL7yrP0pjvMx9vAHysue6m48QH+EGj/IWFejRcpyuYhvo=
X-Received: by 2002:a92:d785:: with SMTP id d5mr2807814iln.219.1611910127183; 
 Fri, 29 Jan 2021 00:48:47 -0800 (PST)
MIME-Version: 1.0
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
 <20210127204613.5735addd@martins.ozlabs.org>
 <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
 <20210128202516.40677c83@martins.ozlabs.org>
 <3cabb185.5677.177486f8025.Coremail.wuming_81@163.com>
 <CAN05THR4WtBJoPt9FRMs3zYmargQ0Y8VFQiL-LvW+1g5RVDcQA@mail.gmail.com>
 <102c2bdd.3624.1774d42f980.Coremail.wuming_81@163.com>
In-Reply-To: <102c2bdd.3624.1774d42f980.Coremail.wuming_81@163.com>
Date: Fri, 29 Jan 2021 18:48:35 +1000
Message-ID: <CAN05THT7OJJxFKRiQJHHHh3Gv15VCfn+bU=LN8eO9x4+n1eu5g@mail.gmail.com>
Subject: Re: Re: Re: about active/active clustered nfs with ctdb
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

On Fri, Jan 29, 2021 at 6:30 PM =E9=A3=8E=E6=97=A0=E5=90=8D <wuming_81@163.=
com> wrote:
>
> everyone,I am sorry that when writing the email I mistakenly pressed some=
 key and the email client sended a reply email.
>
>
>
> there is  a still problem:
>
> 1) the user of nfs mounts an nfs share using TCP
>
> 2) the user cp a large file for example 20GB file
>
> 4) (the cp does not complete) the corresponding server node fails
>
>
> then I find that the cp is blocked as my expectation.
>
> but after iscsi lun/server/share/public ip transfer to other server node,
>
> the cp is still blocked and stops writing.
>
>
> is it because that the smnotify tool uses UDP to notify nfs ?
>
> ref: ctdb/utils/smnotify/smnotify.c

No it has nothing to do with smnotify. That tool is ONLY used to
trigger re-negotiate of byte range locks for nfsv3.
Byte range locks are rare in unix/linux applications and they are not
used at all with the 'cp' command.
What is likely happening is imho (without any data to go on) that a
failover does happen but state needed by knfsd for fs is either
missing
or something is wrong with your scripts and the failover does not
happen properly.


Have you tried to force the client to use nfsv3?  I have strong
suspicions that nfsv4 will absolutely not work with the ctdb
eventscripts
unless Martin have rewritten them to be be nfsv4 capable.
If nfsv3 also does not works, well, then I am out of ideas. Maybe your
eventscripts are not working?

Still, since you are working to build a active/passive failover
solution. ctdb is the wrong tool to do this.
You really should look at pacemaker or similar for active/passive.



>
>
> by the way, is there any doc about the internal of ctdb ?
>
>
> thanks for any advice.
>
>
>
>
>
>
>
>
> At 2021-01-28 19:13:02, "ronnie sahlberg via samba-technical" <samba-tech=
nical@lists.samba.org> wrote:
> >Hi,
> >
> >I havent worked on ctdb in ages, but the iscsi scripts in ctdb is
> >probably not suitable for your use case.
> >It is aimed at when you want to export an LUN via a specific
> >targetname from the ctdb cluster to external iscsi clients
> >and basically have a active/passive failover mode for the target/lun
> >pairs across nodes.
> >
> >What you try to do is have iscsi used internally for storage and then
> >have a file system ontop these luns and export then as NFS shares to
> >to nfs clients.
> >That could be done, I guess, but is not what I think the current
> >scripts do so you might have to write a bunch of new eventscripts to
> >do what you want.
> >
> >The nfs support in the eventscripts also might be problematic. When I
> >worked on them they were only aimed at nfsv3.
> >As nfsv4 is displacing v3 quite rapidly, these scripts may or may not
> >work for you.
> >But they also were aimed at an active/active configuration where all
> >the data is shared from a common cluster backend and is available
> >active/active through each node.
> >I am not sure how well the current scripts will work with nfsv4 since
> >there are so much more state involved.
> >
> >
> >Since you basically want each share to be handled in a active/passive
> >failover mode I think pacemaker will be a much better
> >fit an easier solution than trying to push a acrive/passive failover
> >model into ctdb.
> >
> >Pacemaker as you said does need a shared resource to handle safe
> >failover. In ctdb this is mostly handled by the shared backend cluster
> >filesystem that ctdb is designed to sit ontop of.
> >In a pacemaker solution, as you don not have a backend filesystem with
> >coherent locking, you will need a different solution to avoid
> >split-brain.
> >I am no longer familiar at all with current best practice for
> >pacemaker but I think having a shared, high-available SCSI resource
> >that supports PersistentReservation could be a solution.
> >Using PR to ensure that only one node at a time is active.
> >But, this is all very old and possibly obsolete understanding of pacemak=
er.
> >
> >
> >TL;DR
> >Still, I think as you want active/passive failover for your shares
> >pacemaker is likely what you want and not ctdb.
> >The pacemaker folks will know much better how you would set these
> >systems up than I do.
> >
> >regards
> >ronnie s
> >
> >
> >On Thu, Jan 28, 2021 at 8:01 via a spPM =E9=A3=8E=E6=97=A0=E5=90=8D <wum=
ing_81@163.com> wrote:
> >>
> >> "In your scenario, is the filesystem on each LUN associated with a par=
ticular public IP address?"
> >> yes
> >>
> >> "It would be good if you could do this without modifying 10.interface.=
 It would be better if you could do it by adding a new event script."
> >> thanks.
> >> I am sorry that I have another question.
> >> redhat provides another solution:
> >> https://www.linuxtechi.com/configure-nfs-server-clustering-pacemaker-c=
entos-7-rhel-7/
> >> they use pacemaker to make an active/passive  nfs cluster. its goal is=
 very similar to mine.
> >>
> >> if the cluster consists of just two nodes, we know that there does not=
 exist a correct algorithm for the consensus problem. The pacemaker solutio=
n of redhat uses a fence device (we can use a shared disk. for example iscs=
i lun, as a fencing device),  so it may be correct.
> >> But I have not found any doc about fence device and ctdb, so in theory=
 my solution may be not correct for two-nodes cluster.
> >> I am very curious how does ctdb tackle the problem or the problem is n=
ot tackled.
> >>
> >> if any how-tos or implementation/principle of ctdb is provided I will =
be glad.
> >> sorry to bother.
> >> thanks for your reply.
> >>
> >> At 2021-01-28 17:25:16, "Martin Schwenke" <martin@meltin.net> wrote:
> >> >Hmmm.  Sorry, I might have read too quickly and misunderstood.  70.is=
csi
> >> >is only designed to run tgtd on nodes and export LUNs from public IP
> >> >addresses. In your example the nodes are iSCSI clients, mounting a
> >> >filesystem on the LUN and exporting it via NFS.  That is very differe=
nt.
> >> >
> >> >Sorry for the confusion.
> >> >
> >> >In your scenario, is the filesystem on each LUN associated with a
> >> >particular public IP address?
> >> >
> >> >It would be good if you could do this without modifying 10.interface.
> >> >It would be better if you could do it by adding a new event script.
> >> >
> >> >peace & happiness,
> >> >martin
> >> >
> >> >On Thu, 28 Jan 2021 09:55:29 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D=
 <wuming_81@163.com>
> >> >wrote:
> >> >
> >> >> martin, thanks for your reply.
> >> >> No, I did not modify 70.iscsi. Maybe I need to make full understand=
ing of it.
> >> >>
> >> >>
> >> >> after many days reading/debuging the source code of ctdb and its sh=
ell scripts, I found the key point in the script 10.interface.
> >> >> my modification  is:
> >> >> 1 create nfs share(mount fs, modify /etc/exports, restart nfs servi=
ce ..) before any public ip is added to some interface
> >> >> 2 delete the corresponding nfs share after any public ip is removed=
 from some interface
> >> >>
> >> >>
> >> >> I tested many shutdown-reboot cycles (of node in a ctdb cluster), a=
nd the results are the same as my expectation.
> >> >> I think I need more tests and more scenario tests.
> >>
> >>
> >>
> >>
>
>
>
>

