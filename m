Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 791EC5FDE34
	for <lists+samba-technical@lfdr.de>; Thu, 13 Oct 2022 18:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OKqznt8G+pltmfEaqEk08k0oUNBQHD7/CUTYp2kr6wE=; b=yYyqMfIEiJ9360Rlemk/kV5xWt
	X0mKnnxczy5uJB9uW3tH9iZZmIrNuN2dIL0yQbyMEpd2GGr7/bNA7DuErJSWdBTBo8fkcN3R22Yfw
	HzpLke7cMy7hpdRHSS+x1jzrjt8Ij4z+C75NXNDXUrkvq8JZhD3caFf5TGdqvElfJEpv94J3wFnJz
	Um9mtF8tsC8RTImvksO6WzZqWjkUWamQw+12i3ylzKdMA7G+N7Kokjt5Qw3u8d1q99EcZJuoR+AXE
	ExiDjSeLUpIPr+yPWEWlo6j07vKIhgGx+F6y7x/c8OV/Owqh6XJ10wYxQWEB8chOlMGMqbBeOdbMY
	N+m0YcpQ==;
Received: from ip6-localhost ([::1]:18928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oj0y4-001yGj-1o; Thu, 13 Oct 2022 16:21:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oj0xy-001yEO-5o
 for samba-technical@lists.samba.org; Thu, 13 Oct 2022 16:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=OKqznt8G+pltmfEaqEk08k0oUNBQHD7/CUTYp2kr6wE=; b=kZ/SBMAbf3uv7nXrpgzSP3Qcwl
 ebRE+YwNhMDa7sVNEE2WiD0YKSUCm8HQx47WAuhHb/xJ5S8KQvxaPfTPuQ9RcZZx9sJhx3DdcHxAJ
 9aYms6spo1MRrJGJIBCW90sc7oxNxSLD7V65c25iS05KhckZvS9Tdqwvn5oVUQcy+n3wjWC+35fSZ
 FYhTiIJz3htB9JlbiPaw9ygxjcvZpeP19kp+SLYxY/sb67GC5gzQVTBlXBBK8mzz8cBjgavboYeDF
 t6HAIkS1xJubvz19/5IeBkCaYqSwdeh+Gbh5xooAi3mkKlwOShp8M4cC5CAiQ/A4Gm7NdEFPdrBNY
 jG9FGWk+9/NuIcK8uQrC9/K2IwydxG7PvC6VGq9/e3O4P84RohmohN/jyRK40kM1C6H/PkUTcMirr
 Yc4feMFCrc+Xq0QVnctNiZzHKiMZGH0w0sVOQUpQZQqP+gfJQWswGlBBycBXH8GtkeM1eeaBudVI4
 jSA4J+R+9ToL61eS8aWs8lUT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oj0xx-0047po-0i; Thu, 13 Oct 2022 16:21:49 +0000
Message-ID: <a76a08ff-a621-90de-dc2f-89474b1d42ce@samba.org>
Date: Thu, 13 Oct 2022 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
Content-Language: en-US, de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Isaac Boukris <iboukris@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
 <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
 <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
 <7afae9df-4750-3d83-ead9-f63b049bb372@samba.org>
In-Reply-To: <7afae9df-4750-3d83-ead9-f63b049bb372@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

>> I created https://bugzilla.samba.org/show_bug.cgi?id=15202 for the problem.
> 
> And here's a merge request that tries to fix it

https://gitlab.com/samba-team/samba/-/merge_requests/2749

...

