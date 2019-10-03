Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DFCA599
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 18:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FSzMGGmP+PNLEJXy7UcukWdCdTUpa1XUUbAF81tZPqg=; b=sWNKkw7DtxG63D8NfpL0X1RuJc
	uHNSCBc9WV6LVzFM72ovuyCpuX7ht4dx212+JUuCTcfnv/vSdAqJl47Ty1ux/1o4e3JtKAVqSwxGv
	XE7CNhMZkWA736sNV/uf2eHXibMFCMpaoqIbRwRMXmbGXh5MmE64YZ5EKbKF2M/VHfUHFQMrzJp2g
	mhAd94zO1VkUwOb8LAemYnMNHn3kxBrEbGrKBUzuBH3ODGhtx6tAMwJ48Qe6k3GOkVbBoY2hHvR3O
	PEgfWaGQao7vyUyXFS5Eq284Jz4cD9JZt4queuCpFssOtWVKJrJhWm7nwcbOYBNxBIK7gm3adzwjk
	OSaS4haA==;
Received: from localhost ([::1]:44138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iG47E-000oRq-Ek; Thu, 03 Oct 2019 16:38:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23714) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG47A-000oRX-5A
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 16:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=FSzMGGmP+PNLEJXy7UcukWdCdTUpa1XUUbAF81tZPqg=; b=Af5TwoJVLgj0QvphRK9upeiOf9
 27B3x6uWSf9881SVZ/BfVCw2fuI7zn0tNpO1LSfs3mSfh1IviVT8G93LB8CfvVYf9b3KWOqEDcXms
 XGjVSqDKvsc1X0HEP/3OmFfdgUZvcgpZk1s5cDxv8Ao8vL2x/ZDq27oaaLB09TOsmO6Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG478-000858-S5; Thu, 03 Oct 2019 16:38:03 +0000
Date: Thu, 3 Oct 2019 18:37:58 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: About adding a new 'winbind:allow domains' parameter
Message-ID: <20191003163758.xsetow666fudtkxc@aneto>
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
User-Agent: NeoMutt/20180716
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
From: Samuel Cabrero via samba-technical <samba-technical@lists.samba.org>
Reply-To: Samuel Cabrero <scabrero@samba.org>
Cc: asn@samba.org, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 02, 2019 at 05:57:52PM +0200, Stefan Metzmacher via samba-technical wrote:
> What is the reason have just a manual specified subset of the trusted
> domains?
> 
> I'd actually like to get rid of all this hacks and just trust our dc.

Because some users are currently using the documented parameter
'winbind:ignore domains', and when new domains are added to AD they have
to be added to this setting too. It is just a usability improvement.

But let me ask, why the 'ignore domains' option exists in first place?
The documentation says it "can avoid the overhead of resources from
attempting to login to DCs that should not be communicated with" but
from your reply I am not sure if this is still a valid assertion.

-- 
Samuel Cabrero                       scabrero@samba.org
Samba Team                                www.samba.org
GPG:  D7D6 E259 F91C F0B3 2E61 1239 3655 6EC9 7051 0856

