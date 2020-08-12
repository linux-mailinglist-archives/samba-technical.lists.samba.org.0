Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB672242820
	for <lists+samba-technical@lfdr.de>; Wed, 12 Aug 2020 12:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OJUVZvawShO3BIgXg/aCC1DfsMkNT8Hgl0q+bDToGz4=; b=Aejx4JC/eekfQmLKb/l6sC+TjG
	zN4f6IUMM2S213LRPyuuh2sALFeTW51X8JR2qK5kqIZLnrl19IWBE0EBmEIKIEvj2M2N8GGcS5on+
	zDqVA+w6tWzYWVkQ05dtZ27BlzFt3SfHNdZt+ZmimDcj0BCeyViZ9V80feTIegS3sNsqpZvPDLpGS
	0VLhLfVm8P4j7s5iKeYGvROcF6R4OsQ36PZWgLRcEsReTv3PQzSNJf994t3GovvO8rv9vw2t5FnyW
	sEpXmkcmFrR1bXOZcbvkbVz/LB1h8E7QjWs9wrViVFZlig7R5e1aZk4kgzxFm1iDyTpnkyETbxzrj
	5CjwPo/g==;
Received: from localhost ([::1]:35550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5nnm-00DLDm-QF; Wed, 12 Aug 2020 10:16:10 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:35717) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5nnf-00DLDf-Gh
 for samba-technical@lists.samba.org; Wed, 12 Aug 2020 10:16:07 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1k5nnY-0003GG-9S; Wed, 12 Aug 2020 12:15:56 +0200
Received: by intern.sernet.de
 id 1k5nnY-0007kw-5e; Wed, 12 Aug 2020 12:15:56 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1k5nnY-001APg-1I; Wed, 12 Aug 2020 12:15:56 +0200
Date: Wed, 12 Aug 2020 12:15:55 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: fallocate extending file behavior and Samba
Message-ID: <20200812101555.GB272474@sernet.de>
Mail-Followup-To: Steve French <smfrench@gmail.com>,
 Jeremy Allison <jra@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Xiaoli Feng <xifeng@redhat.com>
References: <CAH2r5mvRncMmG3H5gb--b-gf2j=gJAcqbN6V7LGR5=ywUuQbcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mvRncMmG3H5gb--b-gf2j=gJAcqbN6V7LGR5=ywUuQbcQ@mail.gmail.com>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-08-03 at 17:39 -0500 Steve French via samba-technical sent off:
> Perhaps more worrisome though was looking at what file_set_sparse does
> (or actually doesn't do).  See source3/smbd/dosmode.c   It doesn't
> appear to actually do anything (other than save the bit in an xattr) -
> ie it doesn't actually do what the user wants (which is to guarantee
> enough disk space is reserved by making the file's allocation size
> match the file size).

this is actually the correct and intended behaviour. A file on a Windows
machine is sparse only if it is set to sparse, this is that the dosmode flag is
used for in Samba. If the flag is set, the file is left sparse further on, even
if strict allocate is enabled. With extent based filesystems, enabling strict
allocate is recommended of course.

Björn

