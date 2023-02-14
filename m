Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE2696A38
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 17:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XQJ2nTTPMX+kxU6y5t/QFxpXmNsr+7bvJlrhHAdoL2Q=; b=nzxtE2ZEZubFP+KPI31Mb/YwuQ
	9Kc8lc0cJ95dqof3ItGKiYlulQx5NQqzA5OMLwj6LaWsA+P6DfT0Pbbp34yufUWuFRzQhm2RV6TK8
	YT5jDUyTYL2Cvhhmsoqq2hQtrzEjzB8eoipzK37QDIJNUrpHUq8RQUlEVEr0X4pXvI6umFnayuhDK
	tPe3/MZpy7+pX5/38BrAimXp1bLFquO2v42HPgm4FDaWW0wskOmsoUIMXja2xLMe9oo6uuNcRPU4S
	iVHSYhu5RCA6vfQyklSuFagK9mGj2ufVOoFvSuB80aggnVBZqt1uaw/NeUcAIfbIvtLZ/WfF1ikt5
	rW3GPqsg==;
Received: from ip6-localhost ([::1]:38326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRyT0-00C888-13; Tue, 14 Feb 2023 16:47:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24970) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRySv-00C87z-5Y
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 16:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XQJ2nTTPMX+kxU6y5t/QFxpXmNsr+7bvJlrhHAdoL2Q=; b=C4YnwAhyml4tJXRCTxF5D5t94A
 ts+ss8wb/ucXns/hJPiFXLyqdx/GdBITxdlMRtHvL8+oEvLa1da6IhPONa9AYW3hfFDzMWNTFOfyc
 06XBpJnXGkCsbgDiOWqhlIpkRZ61KGZNOTvPcC5qhD9anKd9lTODkosyYpPb81cbRAZ2/2Vyq+hUx
 nbf0idIQSYvSp7DWG0sl2KWzHvDoR/OHf2yHWcqudTUtUwfIJy+thq+jShaMhPIs6DrXplOlkXUOU
 6Ku6jaPqsKvN0UXJg91kKIFzfbbrVRTeJpEuuQL1eMH1j4KyB82KgzL7sFd5QV3MG8djFG0fHwqjP
 I7+KlCX1XNwmZOpG7MZR4mtrC+SEgdxihEpHB0zF9K2ShzRoQ/tUXwtNE/RPP7wCtutjXu5HMnDMH
 aaG1sRFzhAnZAMR5YEqnSMugNNwgg/8Ztw3H2zb1OlOJYiY24pNllTKHVz7C7Ip1DBZi6ZTPXJeRx
 LFBezE1NErOghzgzoIeDLO3n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pRySt-00Dgxr-JV; Tue, 14 Feb 2023 16:47:35 +0000
Date: Tue, 14 Feb 2023 08:47:33 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Message-ID: <Y+u7JQbpIpQhvmwi@jeremy-acer>
References: <1944992.usQuhbGJ8B@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1944992.usQuhbGJ8B@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 14, 2023 at 04:39:59PM +0100, Andreas Schneider via samba-technical wrote:
>Hi,
>
>I've discovered on my Fedora 37 system that all tests related to domain backup
>fail. The strange thing is that I can't reliably reproduce it, I see reliably
>two different errors:
>
>lib/ldb/ldb_key_value/ldb_kv_search.c:162: Invalid data for index
>DN=@INDEXLIST
>
>or
>
>lib/ldb/ldb_mdb/ldb_mdb.c:419: MDB corrupted for key [ DN=@OPTIONS]
>
>ldb: Improve debug outout
>https://gitlab.com/samba-team/samba/-/merge_requests/2936
>
>It the tests worked just fine on my other system with openSUSE Tumbleweed. So
>I've tried to track it down. My home directory on openSUSE Tumbleweed is ext4
>and on Fedora 37 my home is btrfs.
>
>So I created a btrfs filesystem on Tumbleweed and could reproduce the issue.
>The next thing I did is replace the compression algorithm for the domain
>backup tarball to gzip and it also failed.
>
>Now the question is if lmdb or btrfs needs a fix and how to create a minimal
>reproducer. As I never worked on this codepath, pointers and ideas would be
>really helpful!

Andreas, can you try to reproduce on top of XFS or (possibly)
ZFS for comparison ? That might tell you if this is more of an lmdb
or a btrfs problem.

