Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8689673F
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 19:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z9UoqZC0tyzePiWgN4FKy8NMVgVt3R90isHho04fPmU=; b=2gCXq3erThYzpodrJC5HHbgo0C
	u8CiBWsZn0GYbfSuTvbziPzUJxT1fpieSfQHVhNSeUKTV7X/aTx7GXLrH3MDgVW3VBqGXOIV1PweX
	SEHDvvhP05Wk/7R62B3p9d4CZL9uRFbjqyNIJu36KokCoRR2BqZrWCkGOOQZ+BVm+ufH4xCkyfNIR
	7YSPjYsdc3/Jg2e19Z3FqzMWqKB0vDQfhXkwnHje97Ye/8DzCdRK/3lP1gGRLt+GRGDcMraD7zh5R
	8fciaSXyBfrJXqy/JBdP7DsI92H6n0mgDZEO4lwzn2StF6/2H7w4z5sOK1zj87YeFeZKWJcNZDa0c
	H8toY4PQ==;
Received: from localhost ([::1]:26772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i07lS-007Gxd-D3; Tue, 20 Aug 2019 17:17:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i07lN-007GxW-Uw
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 17:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=z9UoqZC0tyzePiWgN4FKy8NMVgVt3R90isHho04fPmU=; b=lHSQF406z5Q7HjjBhW+qkK0rPg
 dRF7YCQhmBcBmYUCAr/uztBbCK3iF8yhT8lphlO3cEPQuzmntg3DZuNOqRLV0u7ZA1NnsOvefmJf0
 FIuJ+qg9GjAWOQrA8VWOGMh1PGKlqGmuOJ2tVxYwXKTWGTFqSvOjgIFl3wDXd/K+RgNE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i07lM-0000ic-Oq; Tue, 20 Aug 2019 17:17:41 +0000
Date: Tue, 20 Aug 2019 10:17:36 -0700
To: =?iso-8859-1?Q?G=FCnther?= Deschner <gd@samba.org>
Subject: Re: [PATCH] Add profiling to vfs_glusterfs
Message-ID: <20190820171736.GB222339@jra4>
References: <8d9bfc615b93514eeb14f9f5c028ee54f05b37d0.camel@cryptolab.net>
 <157d477c-295f-985b-eadd-06b8df3abaa4@samba.org>
 <b706dbd2-391d-9e5f-ee62-84d0db01ed64@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b706dbd2-391d-9e5f-ee62-84d0db01ed64@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>, obnox@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 20, 2019 at 04:48:21PM +0200, Günther Deschner via samba-technical wrote:
> Attached a new version of that patch, slightly modified and BZ added.
> A 2nd review anyone?

Sigh, yeah this is good - pushed to autobuild.

Conflicts with my linkat() patchset at:

https://gitlab.com/samba-team/samba/merge_requests/735

though. I'll rebase and resubmit once this goes
in.

Don't suppose you could review 735 could you ?

I'm going to pushing through a lot of these
as I mordernize our VFS interface to the XXXat()
syscal style.

