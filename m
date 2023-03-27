Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE96CA7DD
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 16:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Z5PbJL7OMdmN690qAtv/Di/hHz40X6PKlnUpfDgPBKE=; b=jPzIN+mrWP00KPY9LOSusZ2I5T
	JucEcjHv+FZrwr/9s3VPJQMwmmSrTCthuH1p7hrflWrlsf4Alrr3nCR8cpGDUtsbMi22War8jCYNz
	ppqK6xYLrya3kDYQQv8I1de0LhTGdzDeL+SK/FSNsz8laEbs0ymSjhZeAR+6XzP9pD20Kdjvkudcc
	KyiDt8TQLvOWHmvdkRRYqXuZYt5WtiRaTZ5EvbmQoE9jMf0YkoFQmYxqPbF7QLi7oOQrq7+yo4m+9
	2pNS/kLHnrfmYt+T4ZAjL4fRQIGCJIUfKHmTO4JAQgpjXFqI/xZZiSnoLw3IBDykmpkseL/v+FCHf
	HVnoq5Nw==;
Received: from ip6-localhost ([::1]:49722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgo0H-004eJh-TD; Mon, 27 Mar 2023 14:39:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgo0B-004eJN-4V
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 14:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Z5PbJL7OMdmN690qAtv/Di/hHz40X6PKlnUpfDgPBKE=; b=crEOp9Dwhlh9FMxsc9ncI7PUTz
 6UiD8oWyWD8zpLgpZeQLjS/usd2AqVrfzLr+OFIDFfXv2wXlfAwsDqVt7M9VsSg6ovJOXyj8wAgDw
 UueeayrSYwJ+6JhWdOBI+ZWLj8lLt1xODO9OJUXeYCj3EWaOzBf9UhPzzw+4swzGOgZ9W5EdqKqcv
 rnAs4am20iZ6JkMigPgUX+mqIlQwQvy3lWsuSdtjCJ9hhMYDNNVytieaRr9KUK088kD2EfqQDnV55
 3/VG9F2+pxnmEBpuWWMDDHojY7wskZdiBG9MaQUZAt/aeh30fC5xnRmI6fd1QMyYKrIcDSz6LY1oa
 /AVKABjrR7R1PrGwPjDWwUTKc0ECwduUpn+XLSkPQh/q8mNb5yXSAVyg7rHfGiKeEIK0weGWHPrO9
 iEEjuUCxYxEPnCyjllZnD0YgQUpOGRB2HAiPJ5uXxnigNBt6AIF4+xhJ2IefM42uTNUHUxf12lw9D
 qwc1tAicToqakxDPdir4NO3O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgo0A-005fLL-6p
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 14:39:14 +0000
Message-ID: <4682ba67-7598-e424-4761-624cc962b4a5@samba.org>
Date: Mon, 27 Mar 2023 15:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Joining a Windows DC to a Samba AD Domain
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
In-Reply-To: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 27/03/2023 14:45, Ralph Boehme via samba-technical wrote:
> Hi folks!
> 
>  From all I know it is generally not recommended to join Windows DCs to 
> to a Samba AD domain, is it?
> 
> I've just came across the following two pages on our wiki:
> 
> <https://wiki.samba.org/index.php/Joining_a_Windows_Server_2008_/_2008_R2_DC_to_a_Samba_AD>
> <https://wiki.samba.org/index.php/Joining_a_Windows_Server_2012_/_2012_R2_DC_to_a_Samba_AD>
> 
> To avoid giving bad guidance I've added two prominent warnings at the 
> top of the pages. Is this sensible? Is this correct? Thoughts?
> 
> Thanks!
> -slow
> 

I didn't think things were that bad, I thought you could join a 2008R2 
as a DC, though with the usual caveats(no sysvol replication etc) and 
that Samba was now halfway there on the 2012R2 DC, new Heimdal, 'claims' 
being actively worked on etc, so I think 'There be dragons' might be a 
bit dramatic.

Rowland

