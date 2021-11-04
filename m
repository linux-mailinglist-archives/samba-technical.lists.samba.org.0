Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B178044584A
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 18:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AZ/yIjZfPRQmyIKaVeRabLFwVaSa9RML+rkXRFcpAiw=; b=XFO4/tAJlgB27tIpEzzWUwDxbO
	WuDcQ3/6X7HCzKRT1SfRRF5PBzWiHsrOeBUjmQIvCQmkzociznmZ9V9R4GS7il+D2WTi98sirq8bX
	ozrptbrv7zECFzg8b3QIYp/cQqeMkOH3YNU+AlVVRXWeY1v+KhX4Uc1XHXPF97Uyls7QCIuHsLdB9
	cVmbw0DmPBhLCNz8pjLQfHkbtU5+8czoGYw9JBIp9eVZorTiww4AaApx491lhdOIQ7BgyJX9bizkI
	j12Sp/t+PlPCNYFV4tA8g11Pq1U7pscoNtkoeOjtSxy8QBCOc7V17uPvu8S25o3azEwPrGUUKSXGh
	cuUEBOpg==;
Received: from ip6-localhost ([::1]:22232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1migVk-007fvm-IX; Thu, 04 Nov 2021 17:26:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1migVe-007fvd-Gj
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=AZ/yIjZfPRQmyIKaVeRabLFwVaSa9RML+rkXRFcpAiw=; b=RTS3KBqFxpzqUKpwOfraz2Xv3E
 7qEJyf33B84BeuDzsNb72MJ/RWZh5nrlG8vhPUuCvk0erbeebRF7nG3WoBb2GcZmphqx7Ew8ttSwW
 qT/Qshn8qL8QGfaPZf9Q5hCaWIVpAOtmm4PjqucN9hxt7V7hmbe3h2TPYF3HhHclRQDUtYSLN+7cT
 NB9JFoQeA+dE//P7PLYqp7grS71gF50NeNU269Dl0WI+VrzVJg9O9i4ydhZoea1EWjuHYrQwQaI2+
 WU8tN/FZzCoJXvNZ+90xLVfc0a+cP4pCcKXIsqNR1tm4KHW3BsVGUr9AZugl6m134e2LKYdB7cxQ5
 HObVD+7R3cpSVmaxkXTGS7HGzWYme0H2QwUqRZaKs6FoEUd3UKBH8E5U6r5Sln6twM/P7KyWqmCyC
 X58NYxCIpj4IFRkQFHwyrazREICEXwr9QdD+JO8wosg0LducAPEW/5ijSJ58mgLYA5cEkOE48vzR9
 TfPDuisnySF5H2QYFnwZMlbe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1migVd-005CIj-TK
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:26:42 +0000
Message-ID: <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
Subject: Re: Multiple idmap servers for failover
To: samba-technical@lists.samba.org
Date: Thu, 04 Nov 2021 17:26:40 +0000
In-Reply-To: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-technical 
wrote:
> Hello.
> 
> I would like to specify multiple OpenLDAP server backends for the
> ldap_url option. Is this possible as I don't see any examples showing
> the format?
> 

That could be because they rely on SMBv1 and Samba is trying to remove
it.

Can I ask why you are not considering upgrading to Samba AD, it is
extremely easy to have multiple DC's

Rowland



