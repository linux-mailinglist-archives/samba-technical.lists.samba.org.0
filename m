Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A673226B
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jun 2023 00:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/m9j1qc2Qu/nyrQUEClnM+2tQutqZIoTfnJQDJSVVsM=; b=V0pxoFH8UiM3GebKqNs6INOkjw
	ffoSaEe+TPwB26DXfu9oESykQIHvZV01soXH3SM2eRp1qqN8ad1q0ERGYydY5Ve5tCu6eV2xI0Ssq
	xvT/Gkumsaippb304kki4ESdMMNopJJ9erdvt8yMrJa9Qda2O3iMLisEqD3ncgaK8UA8dbgaJKUmz
	mneX2phYNgG0HgsSco0JsovYWtkl3wlSEVplGqJBHbrMD3CdEv/GCCaNlDkakVqCy7sR8h9U+oX4u
	XGL3ZJiD/DtX/o81gtpEym2YAGCDWBE9X8crNybUwtuvBUByIfkcSEcSj+SoOdOM4URai5tZ0kwpo
	CaBZsqzQ==;
Received: from ip6-localhost ([::1]:31674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9v71-002fZ6-R9; Thu, 15 Jun 2023 22:06:39 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:38528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9v6u-002fYx-8T
 for samba-technical@lists.samba.org; Thu, 15 Jun 2023 22:06:36 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 61272817DC; 
 Fri, 16 Jun 2023 10:06:19 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1686866779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/m9j1qc2Qu/nyrQUEClnM+2tQutqZIoTfnJQDJSVVsM=;
 b=vkuR4mIm2sKPzqdE/R4ewW+9HtKciVmLrLQRA0QIdFmUVYKFam5WaSCYWrWecjIB6tL22p
 9JWQBfz4SkkrWqncraul3RrZQ1INaPYprS7dDWHTUsSGZ4mg1vott2CqC8rYzDhAtnAlE+
 aUymmTg+jeSXs/udG36Mdz3KXxNdMWB4TeovZ5ZwtOhQTZN9jWBXquutr0yeGAWz56H8rW
 BGhvYMTlnsG2W6+rQ0dQhe0Jih5otmWgeoNveSIOnmP8OIsQLDdBGdFI8HMQ1uKXxr2r8B
 GduWYcQuV4Et1KyGEd1UeGAX5bI125mV0G4iP2LjiMGkERTQXpKCOx6s9f4D5A==
Message-ID: <9d98b4c6-9838-9877-d657-b5cd0031fcd8@catalyst.net.nz>
Date: Fri, 16 Jun 2023 10:06:17 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: New option for samba-tool dns zonecreate
To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>,
 samba-technical@lists.samba.org
References: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
Content-Language: en-US
In-Reply-To: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Björn,

I appreciate the thought you are putting into this, as UI decisions are 
hard to change.

> The DNS GUI in Windows 11 lets the user choose the "Active Directory 
> Zone Replication Scope" with the options "To all DNS server running on 
> domain controller in this forest" or "... domain".
> 
> In the code there are two flags DNS_DP_FOREST_DEFAULT and 
> DNS_DP_DOMAIN_DEFAULT. So maybe something like 
> --dns-direcory-partition=domain|forest?

I think that is probably OK. Another option might be 
--dns-replication-scope, which might describe the effect more. It all 
depends on how AD administrators think, something which I have little 
insight into.

In any case, in https://gitlab.com/samba-team/samba/-/merge_requests/3129
you have the --help text as 'DNS Directory Partition', which does not 
add much information to --dns-directory-partition. Whichever formulation 
is used, the help should use other words.

cheers,
Douglas


