Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD710E87
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 23:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TUvP3U9D3xP8/hA4ygzkf0HILOD2yyMF8RJpPlpQpCc=; b=b6vaGoqh3BEU/waw38mrORK0I/
	tBr9XYLF1Gh4Kw0V44QvU9rcjoFAFNFxmUgKQmpWY4NSrTifD/r+u+o6i62CssUd+4eIKSnC0LJcQ
	Wj6y86W+c8wmWJY3B5awfPhrdygfhjZcXy7ZfO1E8nr6/NxRrKUvNOrw3OanlYBn9hAgsjM9hpp53
	zBIA1Imxm+6799W4SM/x+s/KjjmdFmnKd7vAbcggaKTdI5AvfVlg0Ywq1cEhg5+fVO+f8feK+nzOG
	pzM/Ni/71kr4UZE84sxMUsrRthzmOZH6lBSjsR3l4Axy2wN+TO+luGSQzNcilLcSjTedscHHLcq0G
	blpW3wgQ==;
Received: from localhost ([::1]:48758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLweu-001tWy-I6; Wed, 01 May 2019 21:20:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:38472) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLwep-001tWX-Jk
 for samba-technical@lists.samba.org; Wed, 01 May 2019 21:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=TUvP3U9D3xP8/hA4ygzkf0HILOD2yyMF8RJpPlpQpCc=; b=paaWUOcMJKy8PJg+/ptYEZ4/1r
 g1JP+FpzN8OBtaStPBMfeuKEI6bfYdp02jw0dtB6SAfOmusGAzpPSq3WmqtJjpaCGfCezukPZ2Z1D
 fJaM9y6qtffFaq79dwUnPfSFtjDdgeI9bK0dTnNuGJdOVFLxD5sOPLX8S9dvA0ApXD1I=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLweo-0007oX-RQ
 for samba-technical@lists.samba.org; Wed, 01 May 2019 21:20:51 +0000
Date: Wed, 1 May 2019 23:20:47 +0200
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] Samba: CephFS Snapshots VFS module
Message-ID: <20190501232047.57ba6ffc@samba.org>
In-Reply-To: <20190329184531.0c78e06b@echidna.suse.de>
References: <20190329184531.0c78e06b@echidna.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 29 Mar 2019 18:45:31 +0100, David Disseldorp via samba-technical wrote:

> The attached patchset adds a new ceph_snapshots Samba VFS module which
> handles snapshot enumeration and timewarp/@GMT token mapping.
> 
> This patchset depends on a new CephFS virtual xattr to obtain the
> snapshot creation time, which is pending merge:
> https://tracker.ceph.com/issues/38838

The Ceph changes have been merged upstream, so I'd like to proceed with
this patchset in it's current state.

Review/push appreciated.

Cheers, David

