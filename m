Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D227134A7
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 23:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VNspjs9VC9guH+qsODYRCpoC5byx9t2O+ooU/CXSptM=; b=yVw6ObrsbaEtX5LNjHU7+Za5Wi
	BUallK8NmXXqmrQfeJceZSr7hONd9Zw0yge60eEhbv9ZM0FYqJn54WLqWgR1Z009pcy+W1KoOgxJb
	xEju8iXtWhFO1atL05eUU6oWc1uO0F5F5mFeAif6mVuF8gs9eeu2jbXaNUD5UswjJCEAI69zuTa1o
	KWwHdzhMzoYo8eA4SjmtE+2vfC8P/MScVFlBoom6l+Tdgr086WggIK8zFMV/NRpNrZsbFjhNpDWES
	E45oEklGUVIb6YR3OJIxMSW7P/8m0dCqZmw/C8bvsoU5DgD9zOp/kXMc91ch368aRERO3aU86q4gz
	6WOghMLA==;
Received: from localhost ([::1]:34228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMfPh-002K1u-MF; Fri, 03 May 2019 21:08:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:53380) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMfPd-002K1n-4W
 for samba-technical@lists.samba.org; Fri, 03 May 2019 21:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=VNspjs9VC9guH+qsODYRCpoC5byx9t2O+ooU/CXSptM=; b=npcDww1zWon1xqm5QuhvxcjztN
 1E9N5PmxNp3GvYAF88f4QdMeMfMJNugx7JEGsh7XXjmvyWo5pPtCrEe8RdMnhHrbCc+4TGpm9J3F7
 VX56CSd+HOk3VdVuGFt6cwJc7OWLmKtI/L9A0dFpAB1ClpNLzaurxzAUM2bJVuTe+97o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMfPb-0006fU-Q1; Fri, 03 May 2019 21:08:08 +0000
Date: Fri, 3 May 2019 23:08:03 +0200
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: SMB2 SET_ZERO_DATA and PUNCH_HOLE
Message-ID: <20190503230803.58266ae2@samba.org>
In-Reply-To: <CAN05THSthhyGctyByj5eun6C_KK58xWgNYer+7TKBrqyObNZsw@mail.gmail.com>
References: <CAN05THSthhyGctyByj5eun6C_KK58xWgNYer+7TKBrqyObNZsw@mail.gmail.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 25 Apr 2019 17:23:56 +1000, ronnie sahlberg wrote:

> Folks.
> 
> In the cifs client  we use FSCTL_SET_ZERO_DATA when userspace wants to
> punch a hole in a file. SET_ZERO_DATA maps quite well to the
> PUNCH_HOLE semantics in that it will deallocate what it can and
> overwrite what it can not with 0.

Cool, I'd be interested to hear how things go when testing against
a Samba SMB2+ server - it similarly maps FSCTL_SET_ZERO_DATA to
PUNCH_HOLE.

> On windows 16/ntfs the deallocate blocksize is 64k.
> 
> Does anyone know if this is always 64k or if there is a way to query
> the server for this?

smbtorture4 includes a sparse_hole_dealloc test for checking this via
incremental ZERO_DATA + QAR requests:
https://git.samba.org/?p=samba.git;a=blob;f=source4/torture/smb2/ioctl.c#l3981

I don't recall seeing anything non-64k at the time, but I didn't check
that thoroughly.

Cheers, David

