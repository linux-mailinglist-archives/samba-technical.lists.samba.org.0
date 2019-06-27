Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF358460
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 16:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=L0/+xCKnxm0VeJ6Ru67yfKTt0aZq6NJbf4MuzLoKDoA=; b=1enrEcLJcOPgtQiePLbtTZKEOd
	n3Cl5iuFl0991VbbWAva6TBHmZ13cMauR887CQVZd/WZTvNCVwdPqQS0KyGkF7n1/PE5foNGbqF0H
	Y5T/b2OFJJz4DfnqxWpRW1dCgAeABYOnXksh7Emcq2Gr4OEGYruKxrBQ326Q96nTF+tzE8Mb+Yj1a
	5VD1kUPTjVze//U+jcPwFYaoZ8CSczFqQao0ACB1RTk6aCiWQlfPMx+KBHJpuBrpopunHWwfrXTjK
	jytj8zXc5CKQTms9z/KRBCyYRo9Q1i+IZ2S2Uof+dNdI1TD7EVLt3eD/nsuWBwQwVCpPvGuoTPUvg
	zMCnlA5g==;
Received: from localhost ([::1]:41872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgVHU-002CFZ-1M; Thu, 27 Jun 2019 14:21:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20236) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgVHQ-002CFS-GC
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 14:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=L0/+xCKnxm0VeJ6Ru67yfKTt0aZq6NJbf4MuzLoKDoA=; b=mk9Ogqjsm/KIVsAg3o87wJVkVm
 KcnS0Kig6L/g3GRioEjHCawMF4IiCQswxFScyEP7xkj58Sa6NBU3xzmgMArHqOpfJAbzQzm+LgPT/
 JqMvwerMhkXGX85l1LoFXNTndKoHQNgj9I47FrNRoiYdOYTkWEGbilkGGktZnd50bQcg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgVHP-00066M-C4; Thu, 27 Jun 2019 14:21:39 +0000
Date: Thu, 27 Jun 2019 16:21:37 +0200
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190627162137.1077fdc4@samba.org>
In-Reply-To: <20190626135745.lk7757wmy26pgy26@inti>
References: <20190626135745.lk7757wmy26pgy26@inti>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

Another follow-up here, after looking at your patchset...

On Wed, 26 Jun 2019 15:57:46 +0200, Ralph Boehme via samba-technical wrote:

> As a file's creation time (or btime for birth-time) may be set by clients, this 
> would result in changed File-IDs every time a client sets the btime. So we need 
> to store an additional copy of a file's original btime. We store the btime as 
> part of the DOS attributes xattr, we need an additional field in there, making 
> for a new level 4 of the xattr info struct.

IIUC, Btrfs, XFS, ext4 and f2fs already expose an *immutable* btime via
statx. See the discussion in https://patchwork.kernel.org/cover/10812257

I'd also imagine that there are FSes out there that can offer their own
immutable never-recycled File-ID.

Ideally your patchset could cater to both cases by allowing for
make_file_index_from_btime() / update_stat_ex_file_index() calls in the
VFS stat handler and avoiding the extra dosmode games if the
st_ex_file_index is already set.

As a minor nit, I think it'd make sense to combine the new stat_ex bools
into a single flags entry which includes calculated[_original]_birthtime
etc.

Cheers, David

