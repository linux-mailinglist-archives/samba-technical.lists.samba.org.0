Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 781934B446C
	for <lists+samba-technical@lfdr.de>; Mon, 14 Feb 2022 09:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7TVOygyYcO0DAODdOTksyc15MUcoDgQQWbLJh+NXUVQ=; b=HkbI913P/fLB8vVpY4asYt0QYc
	uYOSAtceOKs2G+JkIyiVVHDE9HIgpGOeNWksbJ8rNd6S2vZrxIUXcmSxvbc33QjCMnZD5g71NJEsv
	4QHEGowO3QzT/AL4d3uZxC2ANFldJmXgrNiM6NZnhCf+hhH9Ise7V1YwyacocCaXKEtK3FtFHdR/q
	YNuBFWqFR+1c4XBzMQsbUVJEp1q7ux4CCHM53blEgNWOwhFO34IdhVqQDURmQFZnHHiMbQEDDUdrI
	mJPx94x85HeUMIvaOfyOHw6nyKZJUyYhcUWaG+WFdNXPavToeXGNiLn7fTuv7hn6YuRWYu/f8rrge
	+lWy082Q==;
Received: from ip6-localhost ([::1]:45038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJWsn-007ofM-9O; Mon, 14 Feb 2022 08:38:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJWsh-007ofD-TO
 for samba-technical@lists.samba.org; Mon, 14 Feb 2022 08:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=7TVOygyYcO0DAODdOTksyc15MUcoDgQQWbLJh+NXUVQ=; b=LHVDCXTRcOPj6fer0DJ7J8QEPo
 U0TQIi2JgEnlByHSzTv6SgHqDhTZKZcknUIGF+rD7g6DYuuC5B5+Q/QfMojIDPkvX/fZM9/HVHFCW
 YqpRHTRtnHVqzRKVGy4EYg7XDXKpiDMpi0qpAVk4bd/SuO8AECxIbBzmvkLtB4cxlbIDqfJd8X/O5
 uyPpfq1xhgqTE3Mb35MIOv5iPP+cI/1UDGSUAYmnA9vpgLpTx3vzPp76sg3FozrSXYt7BmqkAECRN
 XZGE+49M/CXMhxC3oGSuNyOYbjFWBr8A+90g1T2Bbv1BPtG7/gt0B/JBCSj1RUXKz05B62ntp5OCu
 SHY6MwXjumWZ/1ugqkaIx0N5epki3+A24r62qoydHdhHB8IpyIiHP2krhalFtTdqOg9a6vs7pOTyA
 DiPrCAKNBw0gxkyO6EeH20KT/LpiGYW5wnvJNYjwD4qKadxB1Uff3rz6rusSkaSbbsesb8ea8g6Wr
 3kWM+sw4y9d1q7TUDDmNUIu+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nJWse-003eqN-Cb; Mon, 14 Feb 2022 08:38:44 +0000
Message-ID: <2ff08dd6-2939-d7af-42ee-ec3751768b8d@samba.org>
Date: Mon, 14 Feb 2022 09:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US
To: samba-technical@lists.samba.org,
 Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
References: <E1nChak-005HGw-7B@hrx0.samba.org>
In-Reply-To: <E1nChak-005HGw-7B@hrx0.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

> - Log -----------------------------------------------------------------
> commit 309f1982263677045d407463eb19a2444c165a63
> Author: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> Date:   Thu Dec 23 14:37:29 2021 +1300
> 
>      s4/auth/simple_bind: correctly report TLS state
>      
>      It went wrong in 366f8cf0903e3583fda42696df62a5337f22131f

Can you please file a bug and backport the related fixes?

Thanks!
metze

