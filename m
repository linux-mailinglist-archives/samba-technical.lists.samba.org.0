Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E417A1E5D1
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 01:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qHY9ligcHhKDpD6rFLv45quydY1BNAF175q3T4mklLA=; b=JJ5L1WknjxG/MuIpXN3f8IRUN9
	2Cl5zUbQ2R8kWQQ+Hm8Jy8ZfeZyTsh93rPRFXjPZJ5UKYKzUd207qhJ64flV+2Hecis9lOQZ3uryO
	dk9sxptddXGafy1KXvUmFHNrUvz+jAGEDGxisJ1hKas6+rzlrX2DS4Zbe3yuTNstOohBIYKc9kZL0
	FkHVIeA7fV3L6U7w3QdTaeymwJb9c9gxFYK2ZZh+mP0LA32CXXtSKO+aaZofzOorv0e5D39uJydCf
	3dYswd+s7QukqKuiY58mX0JqDBrTdyTqoHfS3miWz94D+7/mILtEY0IoPzgta4BbVjpby5kmzsefd
	+QxTpV5w==;
Received: from localhost ([::1]:58804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQhD1-003fbf-0v; Tue, 14 May 2019 23:51:47 +0000
Received: from mx2.suse.de ([195.135.220.15]:43020 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQhCw-003fbY-RM
 for samba-technical@lists.samba.org; Tue, 14 May 2019 23:51:44 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43DF8AE3C;
 Tue, 14 May 2019 23:51:34 +0000 (UTC)
Date: Wed, 15 May 2019 01:51:32 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] Samba: CephFS Snapshots VFS module
Message-ID: <20190515015132.71466b98@suse.de>
In-Reply-To: <20190514210030.GE210466@jra4>
References: <20190329184531.0c78e06b@echidna.suse.de>
 <20190508224740.GA21367@jra4> <20190510151601.798bee61@suse.de>
 <20190510185841.GA54524@jra4> <20190513122738.78b2b566@suse.de>
 <20190514210030.GE210466@jra4>
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
Reply-To: David Disseldorp <ddiss@suse.de>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 14 May 2019 14:00:30 -0700, Jeremy Allison wrote:

> If you're happy, please push ! Thanks for your patience
> with the review, sorry it's been a bit of a struggle (but
> as I said I *really* want this change :-).

Pushed - thanks a lot for your thorough review Jeremy!

Cheers, David

