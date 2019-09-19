Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE8B73E5
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 09:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Bo5HhUkm3XTU4KH/u61ZIS73pTtp46Kmtl9tg4piQwY=; b=RhGhxVSjBz8h/h9gs2YgQ0Lh3a
	Om23t+k/dYVqkCwnbTmps4VXQzxW1zs1DJtOWRQxahK0FA7jUngFUhEQnhrYdSKkm9qzQR5b7O2Cj
	8kYlO5yRy/4Ks4MtklW9vBPNU5UsRqSmciy1x6l271xxXJ32tIPe/kITxjeCS1lNLQmzPXfj0a281
	6D4CI+0d9ynyIPn+ZbYoa4evhC/rL75epvxpuH0iVh3RhI0JGoSEg45nJuk3LxjxAeaOC1/ju/IXL
	Na9zXxkVotJHzUiCZqbh51QOiA0svO0VgieYiujwp+R1l1Byg0P8lNGxymVelG5laPEDAVxv2mMGb
	Z1XUktZw==;
Received: from localhost ([::1]:62412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAqhQ-006nqW-3J; Thu, 19 Sep 2019 07:17:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25134) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAqhH-006npk-B0
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 07:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=Bo5HhUkm3XTU4KH/u61ZIS73pTtp46Kmtl9tg4piQwY=; b=PIApPZFkl9EFEvEgTRpaUH0Xu0
 BTn9b7+EWzPAAu32rAEpZJ6pdsjy6cEGOPbKL9tfdLeYeLmlvtHW5MHLw9aL7lJj2r9uaCR8jSVbv
 oTt1T7CD+lmH1HK48lQDU6G8B4L0h3XjEGuDdcsA2cz06lnfFEYGp4S6YJvaO8crlgpw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAqhF-0000b4-Kw; Thu, 19 Sep 2019 07:17:45 +0000
Subject: Re: [typo] vfs_ceph_snapshots.8.xml (4.11.0rc3)
To: Samba-JP oota <ribbon@samba.gr.jp>,
 Samba Technical <samba-technical@lists.samba.org>
References: <20190918230000.GA58117@ns.ribbon.or.jp>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <050052b5-5998-d274-d04a-c7b24f6d3e34@samba.org>
Date: Thu, 19 Sep 2019 09:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918230000.GA58117@ns.ribbon.or.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 19.09.19 um 01:00 schrieb Samba-JP oota via samba-technical:
>         <para>
>                 The <command>vfs_ceph_snapshots</command> VFS module exposes
>                 CephFS snapshots for use by Samba. When enabled, SMB clients
>                 such as Windows Explorer's Previous Versions dialog, can
>                 enumerate snaphots and access them via "timewarp" tokens.
>                           snapshots
>         </para>

thanks for reporting, it's much appreciated! :-)
Preparing a patch now.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

