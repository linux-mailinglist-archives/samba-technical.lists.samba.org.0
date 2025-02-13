Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D42A33CBD
	for <lists+samba-technical@lfdr.de>; Thu, 13 Feb 2025 11:29:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pXRgJSOdZgjY+qEWrQvDLf4AuTKDGtvXW8Jid1V1Ih4=; b=n2OLE8GdOai4Xk4fbCUeBOnwtu
	8s50+YFODPecXJIPs/J1Nyv+8P1EB3Fu6gd/qGziAHBoyz5XP0ypXH4173tw+YJM5RShjr1hAmwxg
	pEPreJnPj6prQEodPCqae+fSczffPxlsIE2cYh7ruAjGd032CX5HREHLLOuVSoaSc03xU9fS1P5+/
	I4UqcgkLl838e8tkOKyt5BKMguF7zEGpmwi879Sd7dwdV0vtvwZbbybzV68fJX8V49JOlgsRt+Kqg
	7gHFeTxHnEFa6ovpDRrwSA5/Ny5ToTwMpj290JOTQ+IlzGBJkzX77HY4BzkNUOQZjJBkmhW0HNZFc
	sgdXfkxQ==;
Received: from ip6-localhost ([::1]:51908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiWT7-00CIgO-Sv; Thu, 13 Feb 2025 10:29:17 +0000
Received: from zucker.schokokeks.org ([2a01:4f8:121:1ffe:1::2]:59571) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiWT4-00CIgF-0g
 for samba-technical@lists.samba.org; Thu, 13 Feb 2025 10:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arkthis.com; s=key1;
 t=1739442550; bh=pXRgJSOdZgjY+qEWrQvDLf4AuTKDGtvXW8Jid1V1Ih4=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=YqGd/BD+T5cveTFQlBnB6Rao1eRFAPJqndAne601ZxQ9hvB+bppQK66EltdJWgNo/
 B6966pmIW1xzwKNozCnvFnU7/HUXq8+XTXw87oB84zliuZ8dXa6Dom0+MFud8V0yjZ
 1Y2fw9jx34e89trUTpbuZG2oMBseZrT+5h1QmGezjE51tqukidZGBA8C/jn9exS/JV
 0HLZ40+Faz4BfOU1EJZNRGz3fcLWH+uOyWJpXvayk5MQ9rTnMp6Ya9/mqXZ5yDAIH/
 IYpagZrf3rCYEhntOGNWhDuTB2gCmobUJCjKV52/eoVZkH5bGPOiURK+ld3Rc40TOl
 v/PiepTqcf4Jg==
Original-Content-Transfer-Encoding: 7bit
Original-Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
Author: pb+samba@Arkthis.com
Authentication-Results: zucker.schokokeks.org;
 dnswl=pass dns.zone=list.dnswl.org
 policy.ip=127.0.0.255
Message-ID: <d57da603-b330-42ef-8eee-e1e6d01957f6@Arkthis.com>
Date: Thu, 13 Feb 2025 11:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
To: samba-technical@lists.samba.org
References: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
 <e2b5b40b-fc56-4ade-b264-0f84f33f44b0@samba.org>
Content-Language: en-US
Organization: ArkThis AV-RD (AudioVisual Research & Development)
In-Reply-To: <e2b5b40b-fc56-4ade-b264-0f84f33f44b0@samba.org>
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
From: "Peter B. via samba-technical" <samba-technical@lists.samba.org>
Reply-To: pb+samba@Arkthis.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you all so much for your replies!

On 12.02.25 18:15, Ralph Boehme via samba-technical wrote:
> in 2021 we added
> smbd max xattr size
> with a default of 64KB.

That's great news!
(And exactly what I was hoping/looking for)


> But 40KB should work regardless, but maybe not on that old version. 

Sure, but knowing that smb /is/ capable of xattrs that size is worth 
finding a way to upgrade to a more recent version. :D


Thanks again,
Peter

