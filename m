Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8B25ADCE
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 16:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gTNg7rVp32EL0rUL+9+Z+TcLffVBmVCvqtBj7gYYG7c=; b=SYJ9DlX4GnmXRGZAQ4fJmQBT9H
	3jHQ5fi0l36RZaaxJKYSNTb0QnNpcA6yFxr5OZlbCFLP17nhTBrGTI5BT69oQgkNDkq7YgvvXA/gh
	2mByUKuqVUPPBVraiYhOG0g40jPqIJXpMKvmVDHxHQpVucWminySpRz4/VjN13LTm7bDJYwEu4dgA
	QnSZeWFevzv3wB89UMQ43LjBUiz3cuHyTgF7w5U30B0FE496UdNKDPSmUoJlxozFHTBP+qMP2kBZa
	Yctn7jKzbUvZoaL04e3YEtqu6SKZzPl8hNMdZ+fWcfWu+8lZpTfrYF1OniTFYTYKq4aEg71ItsOPf
	p0gbIfFg==;
Received: from localhost ([::1]:65518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDU40-003Y1q-F7; Wed, 02 Sep 2020 14:48:40 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:35253) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDU3u-003Y1h-WA
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 14:48:37 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1kDU3u-0007d8-7D; Wed, 02 Sep 2020 16:48:34 +0200
Received: by intern.sernet.de
 id 1kDU3u-0000rd-1x; Wed, 02 Sep 2020 16:48:34 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1kDU3t-003Pec-TC; Wed, 02 Sep 2020 16:48:33 +0200
Date: Wed, 2 Sep 2020 16:48:33 +0200
To: David Disseldorp <ddiss@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902144833.GE800471@sernet.de>
Mail-Followup-To: David Disseldorp <ddiss@samba.org>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE via samba-technical
 <samba-technical@lists.samba.org>
References: <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
 <20200902095042.GA800820@sernet.de>
 <20200902123648.6d8aa3a9@samba.org>
 <20200902113415.GC800820@sernet.de>
 <20200902162807.1c814148@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902162807.1c814148@samba.org>
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
Cc: =?iso-8859-1?Q?Bj=F6rn?= JACKE via samba-technical
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,
On 2020-09-02 at 16:28 +0200 David Disseldorp via samba-technical sent off:
> Thanks for the feedback Björn :-)
> I had to make one further minor change to handle cases where all VFS
> modules are static: shared_list['vfs'] -> shared_list.get('vfs', [])
> 
> Please take a look and I'll push it following your ack.

it's not my favourite change but we wanted to split that discussion off. Please
push it this way for now.

Thanks :)
Björn

