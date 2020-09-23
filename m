Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D12760C2
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 21:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hcND+FgeO1Q66iXfBCssqBcdm090gF9JUh22a9klGU8=; b=SDRdC3QCnyVkpczkpEbhSyfLo0
	Qxa37bYxJbwVPKgnYVKJGlLUJDz4W8d10NDDw+58FykW+8vIaEmX2VF44OhS/LmzrV8DOst0Cswi9
	sa0wDrggk5mZuSG2HNNWJtqnzsmjy4hEpB6SdUWiElAGdAxbc+3APH7JhpaNe+4OHeGznxJZrrAdU
	tJ6hh9BHtWucK+TiRn0TWVzRyeq0OOuPf9TYDSCSD/7XlAMke65xTGpEFn7jEY6s8JGGxE1Z7X6B0
	3zGn3j3sQKoPj8FFfCJZ7pVifWE0JIxDIBWnNATkqsp0OT4kDXDGxAVwpqp9tuxGSNLVfcSkvv3iz
	VEY22RSA==;
Received: from localhost ([::1]:40154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLA5U-006wFW-KE; Wed, 23 Sep 2020 19:05:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLA5P-006wFP-Na
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 19:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hcND+FgeO1Q66iXfBCssqBcdm090gF9JUh22a9klGU8=; b=Lv4NnFfRoOswYibu8C/hzIFNxu
 0sNzYKuSZoAc1IPDbfFrqoelNtCOpqvHQ2WFEIeJUYl0hj1Ly4qaJ4oGEsLG2bh6NL1yM5hkAEB8G
 kwa3BXKXISbx9vUaWrTRG7ZvKvWDRmazJdiSPnMP/4WjJE3IROK2qRBy/zkPvHi1XIlQ9G2RPAP8P
 qpEhgRuikqY5zt3DPPEs1SnrDZNkArkyC+9IUfWe8HsrV/bsR6kmdTD2JOh5z/O0sC961cHCKhScV
 ZJ1UHE85ib46WR1qduDUw8tnPIzJrXLvVSYP+pgHsrcnnX/pu3CUGYseAZA3zAyRlXHO2ZEgeQ40D
 77gldpfNO77NN3qY4/yoYV8zK8gSEIDj77AkFKzJ2nxdW4GI++FRq5VU81JSj/qHw5+EGh8KPJ5L+
 7Ss83iEHV+nkxpmJkaWv0c/GKKE/QLqyTUJiARvtLIDG0Sd00dHj2AGuG47dSIUQQ/Y1fDcNRxaRe
 HGT5n5wpbTgh+qlVTgET+vOb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLA5N-0004uh-OK; Wed, 23 Sep 2020 19:05:50 +0000
Date: Wed, 23 Sep 2020 12:05:44 -0700
To: Sudip Panda <psudip@vmware.com>
Subject: Re: Regd. per-share stats/profile support
Message-ID: <20200923190544.GB1338235@jeremy-acer>
References: <F750455B-1BA5-4E6F-86C2-C282A3A4FC1C@vmware.com>
 <ABE15E44-4F57-46AB-AC86-039B605145C3@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ABE15E44-4F57-46AB-AC86-039B605145C3@vmware.com>
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
Cc: "Christopher R. Hertel" <crh@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 23, 2020 at 08:52:25AM +0000, Sudip Panda via samba-technical wrote:
> Hello Everyone,
> 
> I am new to SAMBA codebase and going through the building blocks
> (tevent, tallocs, TDBs etc.) to address a feature request to provide
> per-share statistics/profile. As of now, I see with smbstatus command
> (with -P and profile option set), SAMBA provide global statistics.
> Also, while I am learning SAMBA, I came across SAMBA TA. Would like
> to understand whether similar request (supporting per-share statistics)
> came in the past and any analysis was done for supporting it using TDBs.
> If any analysis was done in the past, would like to understand the
> outcome of that from you folks. I understand that multiple connection
> can access and modify the per-share stats which actually is a case for global stats as well.

I haven't seen a request for per-share profile stats.

You'd have to add a 'per-share' field inside
the smbprofile_stats_bytes_async struct in
source3/include/smbprofile.h and ensure that
the profile setting macros also add in the
required info to identify a particular share.

