Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5E36B669
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 18:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XhhJ9pKuz93p89oi51pi2za4fCQVGN6594H4OYZDPCA=; b=qiK2xir9h1c812JSS61CS4fFUQ
	0vOQez5KtEgQIQPGA/3RVgm902ieJpSZBoNHvZBjigW9zCZhcVK0LIBfxqnee1kYH/7wceJOCxh0G
	TF3g3J8xWYgSvQqWn4ys9v3+/Cb2NdIH88E6BEiuDcsGwroRtIe3MS6cqnq8vlKjyk+qbOUTdyZ0D
	ABYSkzC4Q7sS6B6skm/+dBLS5UdaltyDnx3TlZrRLXo+oU48CuRYSW67GE9Bz5+uevUCgnee0R/xu
	zRPp2CLnBVyfyoYeTHATC5eLDF+iDEV1PYKeBN1MWro3KDOsRhSe4dcdhPJKrbJoFEdjpDgqr2X7F
	oQ1J7SmQ==;
Received: from ip6-localhost ([::1]:63514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb3hv-00CVdi-Uj; Mon, 26 Apr 2021 16:03:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb3hm-00CVda-MZ
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 16:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=XhhJ9pKuz93p89oi51pi2za4fCQVGN6594H4OYZDPCA=; b=w6PcJmZYtFqPMMWz9WTLaaNznD
 u8i8y12Wj/7RFgXVkwuKFdOLPK9Y2NNo9QGkWfm8ZM7yFh6yTgy7J0oAwGK4pGfOAeJ5HBPv+ryys
 PAV7VIavoMLZZoTZRvrh3j4ZNSrspR17wrqaobafDalSjUtkSqewA9zRzdz9l5wLrVe13LMYKnGUR
 b7/Snxdjje1W86u+hR0I1bA0QHAajL5aOz3abeA+nqFTbrosJQS7YkvzVx6mWDefHJr5Dwms/9nj/
 K9KfIA4KkICYkh6ecN1jRzh/U6Z3niUrQY/tUxxp4FNLRwkD4ipOssp/1F4JV4uXdv6V7OWxQ80s8
 oiUEFryO/9JfDqjyHPvQDKZa/OkFSNUWgWwiC96l+K9WmXqng5Uhf0U+3oZoRHbcgnx+rOInlwFLI
 QwyxYArQyGkW/7hBfPX7JVrVVv8LuDgNnRlwNjhpP/inE5ZyAmOlbXnG4O8sKgjrR4OipUnVKMgZG
 YPC4JnnloSFSP6er+R4e/dr7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb3hb-0000X5-FB
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 16:03:15 +0000
Subject: Re: init script or systemd?
To: samba-technical@lists.samba.org
References: <568442653.399407.1619452357983.ref@mail.yahoo.com>
 <568442653.399407.1619452357983@mail.yahoo.com>
Message-ID: <01c0eb4f-a20c-4b6b-a237-375603fad8f0@samba.org>
Date: Mon, 26 Apr 2021 17:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <568442653.399407.1619452357983@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 26/04/2021 16:52, Jason Long via samba-technical wrote:
> Hello,
> I installed the last version of Samba on the Fedora Server from the Source Code. In https://wiki.samba.org/index.php/Build_Samba_from_Source address, two sections existed:
>
> 1- Using an init script to manage the Samba AD DC Service
>
> 2- Using systemd to manage the Samba AD DC Service
>
> I must do both of them or just one of them is needed? It depends on my preference?
>
> Thank you.
>

No, you only use one, which one you use will depend on your OS. Most 
OS's now use systemd, but others such as Devuan still use init scripts, 
so you need to find out what your OS uses.

Also, this isn't really the correct place to ask questions such as this, 
you should be posting to the samba mailing list.

Rowland



