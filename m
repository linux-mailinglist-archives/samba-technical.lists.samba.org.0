Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869B823F6F
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jan 2024 11:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=GJtRVWqa1aPL8V3M2Ws57kvR7Lj8XCYw0RrpwWqh50o=; b=xA6SYuX63wAf4HU7q10YECXPAJ
	NwCsgLE/hMSahLR6CJmR6EvPnQLXqfihiw9YKU+bGBpyQzo8zX6ELG4RvkJmKneODJZkG8VJA0HMg
	8oHrrfEhbJpryDlAuUEfZIcaFZApLVCYdZstlEIoWQOM5aL6hjfQcnKCYy+KGa4ywh0CQfJl1As7C
	++EXhvs3Kb7nVA4Tmo9ZJKsLm0V6Pi7doRdPVfpR0YZl5oGSw+h77lGwToxftlQjjsboRX8g0I16B
	Jnz/F9csatz3LZqvB7xhhBwNLLAUaoN/pkC4K0wqCmtgCfhK8NVKMxo+ke9+3zAGMnzWut/AArikt
	V1fGRsTA==;
Received: from ip6-localhost ([::1]:34496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLKyb-002KKD-1F; Thu, 04 Jan 2024 10:29:23 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:38351) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLKyW-002KK5-7P
 for samba-technical@lists.samba.org; Thu, 04 Jan 2024 10:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1704364148;
 bh=GJtRVWqa1aPL8V3M2Ws57kvR7Lj8XCYw0RrpwWqh50o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UHBYyJoISTdym38l0MYBRznoDOWCIqKWpe6f+s97zUD/E5dKyof+BSfn/Dpvjl2Nr
 1Iyg4kTKXdBjFj7kAxKq8p6yvXaWvTiu86bx7sf2Cov7c0LBJqqHF3uls6viDCmQbf
 SGkJ1JGpoWx8sjGcIq43/nflf6UsBhLHUm3OkTAo0kB75Zl4G7jOCO4F+R/ci98S18
 uZa5esH5AQcQRCJmvSP/2Zf74as5Zn5W8lUSC6ljv9B9hLgREomwvKyXN1erlfVbiZ
 jKecvbx664AoflzQgDwLAHh2lC0WZ+R+e8L6We/KSI4R3KDihycWh1/8rQb8H34ydZ
 z1yuszFeM0IqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T5N9c66KXz4wny;
 Thu,  4 Jan 2024 21:29:08 +1100 (AEDT)
Date: Thu, 4 Jan 2024 21:29:07 +1100
To: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>
Subject: Re: =?UTF-8?B?5Zue5aSNOg==?= CTDB and per record persistency
Message-ID: <20240104212907.63a28f77@martins.ozlabs.org>
In-Reply-To: <DB9P192MB1684640CE6DB300D687CEED8FE60A@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
 <20240103175012.51d1d4bf@martins.ozlabs.org>
 <DB9P192MB1684640CE6DB300D687CEED8FE60A@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Wed, 3 Jan 2024 07:28:58 +0000, =E9=99=88 =E6=96=B9=E8=BF=9B <sharingfun=
520@outlook.com>
wrote:

> The file copying scenario  involves a cluster built using CTDB, with
> two machines sharing a common public IP. When you copy files to the
> shared directory and the node with the public IP experiences a
> failure with subsequent failover, the file copying process continues
> seamlessly without any error displayed on the Windows system. Do you
> have any means to ensure that file copying can proceed normally even
> during transparent failover events?

Now I understand that you were talking about copying data from the
cluster.  I thought you were talking about replicating data between
nodes in the cluster.  Thanks for clarifying!

Currently CTDB uses tickle ACKs and gratuitous ARPs to attempt
failover.  While this works "seamlessly" for some applications, it
doesn't work in some cases.

I wasn't disagreeing with you: with modern SMB, the best way of
achieving transparent failover would be to support persistent file
handles.  Unfortunately, until now, this hasn't reached the top of
anyone's priority queue, so it hasn't been implemented in clustered
Samba.

peace & happiness,
martin

