Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E492CB1D747
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 14:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dFDx6yy7czVU/66ZuNjuL1wJUoFm+qin5vis+fCZk4I=; b=2fzA4tvsKByUkqiNDg9St3ZmE7
	shKUv3hTRSBAvMUUQvVIZhyp9N8dwpl2VHp9NYya2+kRT+QBrKLz1+4gb5SaMSNhs0lU/8DdFVUt/
	JHl+Ll/o5scqythmkaE9d99p4/U0w0Y734byn9sdGbO6pDVY4I+z+kOq41Y5ZEC9NnXERbnTr6n3F
	bCtUBSCXaYH5aM+/eLM8gMP5iQeimNUS0MC8DO5ghmX8NV8+smImF0UQkjfBfCNh8/zr3kEIPHvBX
	i7CJT1+STyzFJHqG/EC/ER9xnus5bknvMQjd0VK3Ty/xuWA3ZWp72fq1estcWi25lkj5hBLjsNqfq
	N6TZZRBg==;
Received: from ip6-localhost ([::1]:56268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujzSQ-00EWGb-H4; Thu, 07 Aug 2025 12:10:54 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48915) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujzSL-00EWGP-GW
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 12:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202409; t=1754567499;
 bh=dFDx6yy7czVU/66ZuNjuL1wJUoFm+qin5vis+fCZk4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GV43E5KyInxX8t+Lft6dxO5NjxbWW73/Hsi2c9CCwUPsgK6OmhYy/ya9A0ukgjx56
 yBxZAyBg0Uxbpej9DBrm+SUE2Wa4dXVVCebB2LcpB73bcN6tVhOMfQzSgtnePjSXRr
 /zdjWvMXttuP1PBxiEaqElbKKzDLK1nVNvFOvFEQZEUO36WZ1+4jfe/oHPcXWjwsgN
 j6v/UT6oCG63Cx8CHD+laPxj6Wi2Et4WGLuqh2+SkJZ1YggBu1FMq6y0QkbxP0yOp3
 9UheD7T4UiAanA0wNDD4n8xGu7i9gx50BX0ChER5ztRQInFMbHln6S9YEySLWwCNUQ
 REY3qnMIFQIRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4byQVg4Rllz4w2Q;
 Thu,  7 Aug 2025 21:51:39 +1000 (AEST)
Date: Thu, 7 Aug 2025 21:51:38 +1000
To: Xavi Hernandez <xhernandez@gmail.com>
Subject: Re: CTDB performance issue
Message-ID: <20250807215138.300c6fd2@martins.ozlabs.org>
In-Reply-To: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
References: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: gd@samba.org, Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xavi,

On Wed, 21 May 2025 13:14:24 +0200, Xavi Hernandez
<xhernandez@gmail.com> wrote:

> This seems to cause a lot of context switches. CTDB needs to handle the
> termination of each process and starting a new one from the queue.
> Additionally, there are many smbd processes doing work. During this time,
> it looks like CTDB is not able to process the incoming queue fast enough,
> and even though the leader broadcast message is present in the socket's
> kernel buffer, CTDB doesn't see it for several seconds. This triggers the
> timeout and forces a reelection. The reelection itself also takes the
> global lock (TDBs are frozen), which could cause the problem to repeat.

In addition to your observations, Volker cleverly found a bug in the
CTDB leader broadcast code:

  https://bugzilla.samba.org/show_bug.cgi?id=15892

Anoop was clever enough to wonder if it could be related to your issue!

You're seeing an underlying performance problem that is causing issues.

Due to that, you're also seeing delayed leader broadcasts, so the
performance problem could be triggering this issue and that could be why
it doesn't recover.

Not sure... but worth pondering...

peace & happiness,
martin

