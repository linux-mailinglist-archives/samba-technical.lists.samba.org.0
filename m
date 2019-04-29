Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE30EB5B
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 22:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=m1vMdgooSktBrQx6H9EAWRj+PQBVj34YNMKkOE2kQGI=; b=S4GpTZuucKm7d2K5N3hfcL/y4O
	puvCsgxafkrRLZYgQzgcOeIJK/tUPcn3yW5ITDUcLMpwGakHM4pxaKN1FWUK+heon/sCxkxc8Xq6L
	igOl7fSsZfS2XbpoxrUtaFuCqFu8kDupzsla6YtwMLLurSztiglYeJeSiXHKe3kfEK2XEMxrtkoDW
	3FchxzJBCck7D6OQfWvfe58M1YeunvQE1ynQD3c7RZeF9hADDKUA5owbCR5Dt8gkq2cIBz9zPxJS3
	7GAzDL6Y4RuBvMixxi7sE6c+FfSisWimVIWEDhhkhAzJUtRJVQba+OIEkq0gAKH92BC7LBs64kXWv
	/G34Vv0A==;
Received: from localhost ([::1]:53100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLCZW-003kPs-Pp; Mon, 29 Apr 2019 20:08:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:24456) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLCZS-003kPl-Tr
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 20:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=m1vMdgooSktBrQx6H9EAWRj+PQBVj34YNMKkOE2kQGI=; b=qQ7czXd7zYcpZ3TUdUJh/CIafW
 kijeKdJat2UiLhAN1h8HI2MGcgBWAJGBBgEyE47PXV0T+2BFN/6wMihQ8Gri1Z598Mzc8Z1knYitt
 X38kr6WuroX5etk4ijs4+KQ8piA6f49SPyptslAYsdOMP4khEf/F2kQeskwE5lNKuOP4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLCZS-0000EU-0Y; Mon, 29 Apr 2019 20:08:14 +0000
Date: Mon, 29 Apr 2019 13:08:09 -0700
To: Ralph =?iso-8859-1?Q?B=F6hme?= <slow@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Message-ID: <20190429200808.GA26142@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2019 at 09:51:53PM +0200, Ralph Böhme wrote:
> Hey Christof
> 
> > Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
> > 
> > Revert the patch adding the warnings since that causes problems when
> > compiling master on RHEL7. Many C99 initializers of nested structs
> > are flagged as problematic, so it seems easier to remove the
> > additional compiler checks.
> 
> sorry, didn't thought about older compilers...
> 
> Can we have a compiler check that ensures {0} works included with
> nested structs and then only enable the -Wmissing-field-initializers
> if it does?

That should be doable. Let met try adding the check.

Christof

