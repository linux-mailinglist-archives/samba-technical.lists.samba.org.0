Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A04AD077
	for <lists+samba-technical@lfdr.de>; Tue,  8 Feb 2022 06:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=BF/VZm1mCwJzALDg1SmRzbCaBfWAYz0m2Rthq0MP/PI=; b=gNqTNeCC3DKAgjzFVs1L2/lurQ
	OEK8uO/j4HrIsEyU6mGtBxYj+moUB3KNIALULwsqisbh0DNdyOiofjaqDqe1rIxAp161geqBYSEGs
	77Kwr8rNdMPula2f5BHd+hVc4vwnt0IGUG8xJMItVZ39xIfHF6QT/6KUhqnonEte2G+nnVGLDuS1P
	ke1u3+1wg+g+UznPP/DQ+aojYHf/d4T+hv1xoy+lPnCVKIl8zHGtQAUk0VXHn6+nzdf021Stq7ORc
	pge2SRbkOMjhTqwPsXb9k0q5naKV09jOF/rp8XzmzVeStduaWbKVpT1Vly4+6zcCQKRHU2sjNErZn
	KnMYM5jw==;
Received: from ip6-localhost ([::1]:61546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHIfk-005bTr-6Z; Tue, 08 Feb 2022 05:04:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHIfe-005bS1-Rd; Tue, 08 Feb 2022 05:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=BF/VZm1mCwJzALDg1SmRzbCaBfWAYz0m2Rthq0MP/PI=; b=adgPQwCsPRnUf10FszQMsHqdC4
 fhumWq5/zQTO3zu00X7LHN4NiQdvjHkfx8ZKwd2BrDD9fpGhBXodOCcDpWo1ydBt6EtXuvQ9+Do1t
 hc/l4bi4m5RDeRCzuxxLuMKw7V1T6sLquFemvuKA8aI43FEsthiQnN9oet84zVTEEAknkNf/3b2mC
 L4nv5EPN2L1Crl0X7/K/uhRG9yxOEPtzGv6YVzChTZNsodLRP7wQGjdkvnXmFcUgrys/IvhXwXCXr
 URQ4NoZuIcJqhm/ez+Q6VroGdGG1YVdDJ4VfTCLipHYr+vmHb6CNYYuLkh1bXO+ABolhUjPJ/YH+E
 pbsF12ZvIJG8LW4pTH3tpNOZCjxCdEfoI5A9bf1F3n19AWmhPXpCpk+h9QYrJfqnYHsLRwQJNd82k
 74UeTXeaeMoCtdzFT/fe79fOLwvdayWhYPV/RoPnFvscK2hiFdwyn/jf63Xa06FblFcZbPheiVoBs
 YBDFKsWK6L/yrk6VpsR6oc30;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nHIfd-002dnM-IY; Tue, 08 Feb 2022 05:04:06 +0000
Message-ID: <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
To: Ralph Boehme <slow@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Tue, 08 Feb 2022 18:04:01 +1300
In-Reply-To: <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-02-07 at 18:38 +0100, Ralph Boehme via samba wrote:
> On 1/26/22 04:50, Andrew Bartlett via samba wrote:
> > What do folks think?
> 
> I would vote for removing it and if people still require it to work
> with 
> old shit they can just continue using the latest Samba version that 
> supports it.

Thanks!

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


