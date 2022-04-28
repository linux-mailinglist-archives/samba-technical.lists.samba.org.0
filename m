Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BEA512A4E
	for <lists+samba-technical@lfdr.de>; Thu, 28 Apr 2022 06:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WFgG7LOTdz1CeuCIeOxO6Fq2Im1yd8VS0o2YgHP7Ka8=; b=f/3+G2Jip7qw9nPSKNMdAoFdmm
	hRU8wdH53/nLNBoKDylznAIxo7pwIGzRhO/wHtW7khMcT6KEG4ZoTLalvuPAcVWhw4KFdc+Rxx86y
	eFjAONau8K/rNTCjp/geKIoxQl1uijUStcHi+3UG3+gnIpnRtwJlvZ56xeROI0BegSIsu3kuV2A77
	p9NenMxiQIYmE+AjO9eaXm+Ruoei/Dsoh6mwywNBTwJ4UpWZO2zTN9bnzJAPV76hmxw/UtTy5sQ9m
	Xq+4e23OztdqI4pdxRInSpnqC//dUoBWYLdlzgbUip7WWuf568Uyh9GDEqTWBZHrimRR5kg96BFUX
	TM1GKMAw==;
Received: from ip6-localhost ([::1]:20310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njvQR-002thP-JR; Thu, 28 Apr 2022 04:06:43 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:49574) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njvQK-002thG-Ru
 for samba-technical@lists.samba.org; Thu, 28 Apr 2022 04:06:41 +0000
Received: from [IPV6:2404:130:0:1000:dc3c:a4ba:cb0:f6dc] (unknown
 [IPv6:2404:130:0:1000:dc3c:a4ba:cb0:f6dc])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 2D0DD81738; 
 Thu, 28 Apr 2022 15:50:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1651117833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFgG7LOTdz1CeuCIeOxO6Fq2Im1yd8VS0o2YgHP7Ka8=;
 b=Gu3S4VOQpb5ihdE/VdsOgAiFg7DFAvQEC3JYCdEXLXQjKmi+xPo8sX47+Uti8a5xKk8QGA
 kXraE+UdLKv3+qyJhgPh3LMoWEAFZGpT5z5+yjAYtneiS3O+y48tk+RFEaUn1PO9fSctto
 0AVqlO08BpuRmQ9DMOYbYGE3VvW5yk1lHhftrQPMDpXxh7clGIkWbPq2/ElgCJ/7USrFeN
 ugaH7dNAI34vfbGZ4O5+ETLW2fp0cJJ4TfUKf8qSoJA7oZHYOGRFrVpvjlV/EmeDbuj+b9
 syp4OwPvvbXK0JrkpBzD9ddmW6EuVeYtlFvp1RXGnboUSMAu8WV/g4/BAgzxHw==
Message-ID: <ade4256f-9541-7da3-d3fe-78c47629aecd@catalyst.net.nz>
Date: Thu, 28 Apr 2022 15:50:32 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: ctdb client python bindings
Content-Language: en-GB
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
In-Reply-To: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
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

On 28/04/22 05:25, Andrew Walker via samba-technical wrote:
> Hey all,
> 
> I threw together some quick python bindings for a ctdb client. WIP, but any
> feedback would be appreciated (either in-list or direct email to this
> address).

> I've currently thrown together
> 
> https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-ctdb_python_bindings


It generally looks good from a Python bindings perspective. It's nicely 
arranged, and it looks like you have put some thought into making the 
interface python-user-friendly. Whether it makes sense from a ctdb point 
of view is beyond me.

I'd prefer a new CTDBError, rather than extending our use of 
RuntimeError. This is hard to fix later because the exceptions are part 
of the API.

Also I am not sure you have covered all the possible leaks, because a) I 
haven't properly looked, and b) it is hard to do and you have ~4000 lines.

If it had tests it would be ready for a MR.

thanks!
Douglas


