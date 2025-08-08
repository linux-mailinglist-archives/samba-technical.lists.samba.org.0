Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA9B1E828
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 14:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OYbbsBmlhhx67h41f47YK0gxQsek//YILertc8XlYPM=; b=38myfWmibRf6uvgmpIW4vOzFih
	Z/jvudRk0MTPmMvcSPD67InVWcSNJc7K4/wOtXNUhky8MxMOb31OQJFNRtQEBh01OlE/KGDjnhDWF
	y3VBi92s8bnbTmjJvcOE5dI3lQC5x4vcxsMbt7K/r8e7XvR8/VDXuZ+vIVD4OFSQGBSq95ykcnMcM
	5BoVtZy0GOJPYBAz0EF5WKq5F5ndj97K/r3Fit1SoX1KaBp0OYIR49h5i+PvDuxUSuVQp/wNhLAPy
	M2Gko05SRVQLgfY6143J9P6hfB0wAi8j7V2XmGpzBBjqWruZmalmPcxPnORnRQmroBKgNwrMxZzNY
	3yPuJNAQ==;
Received: from ip6-localhost ([::1]:40962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukM1c-00EftE-8g; Fri, 08 Aug 2025 12:16:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20566) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukM1X-00Eft7-Pm
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 12:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=OYbbsBmlhhx67h41f47YK0gxQsek//YILertc8XlYPM=; b=AsuPKSlt5dZMNxqgQUkvUu4NNu
 Hl5P+jJsWrO94DtcGfEMGF4q2Ufuh73gThBOReh4mhZPtPxp7RHFaNjLbIuXokuziEMZZl/vMYuJx
 jXUlUgbQLmbzIR+vMHsuirGzc5xrO47zzCPdw7qfaZ8fAqv95d+FPmovrqTJ82Bluj5Pa3t8fhqsF
 EYBffi4RmsWtkPbemMYbM+jtyl2z44NJLBEmpP4vLe/Bc/ePXAszHukWl5X6gl0+PhEd9Mkl24JQQ
 HVnfVByU+0wQhUkZ/65cEmlIuHaXAMHb3clXh+UgO0L1iTjhfqjh72ft3XfhX5KCb8kN6EmOfgpTh
 2gP8EIcb1MAMbEyT+G2pYIqTReu5oo4TihKTp2I4qh+nFJL7r2YvsV2bHW4E24VR2SFI9p+m8Ig6i
 JVUXfva6K4JFHIGhO6OgtKfEmAMSB7r5RS74wRkFTTLL5P/ip/5UrmEG9JIGiINxUvaHLYkRALpft
 XrLKbBW9D52Oqe4mCLqKoY4f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukM1X-001njP-01; Fri, 08 Aug 2025 12:16:39 +0000
Message-ID: <84154c26-ac76-4a2b-9662-b3c4f2df98dd@samba.org>
Date: Fri, 8 Aug 2025 14:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] smb: client: make use of smbdirect_socket.status_wait
To: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
References: <cover.1754582143.git.metze@samba.org>
 <c1dd7da5ea65b9867693eb9ecfedf9f35f71b5d3.1754582143.git.metze@samba.org>
 <CAFTVevXk40jHJqdHyt1gfKHC6wuGMTR49mZMjZ1W-e+t_+eNsw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFTVevXk40jHJqdHyt1gfKHC6wuGMTR49mZMjZ1W-e+t_+eNsw@mail.gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Meetakshi,

> &sc -> status_wait is initialized in _smbd_get_connection() in line
> 1691 but it is being used by smbd_ia_open() -> smbd_create_id() before
> that. This is giving an OOPS on RDMA mount (attached).
> Could you please check?

The problem comes with this patch:
[PATCH 7/9] smb: client: use status_wait and SMBDIRECT_SOCKET_RESOLVE_{ADDR, ROUTE}_RUNNING for completion

And yesterday I was thinking the whole day about in which patch
I move init_waitqueue_head(&info->status_wait); to the top and then forgot it.

The strange thing is that all tests I made yesterday evening worked just fine
something between 3-5 times.

And today I got the crash immediately and was about to debug it.

Thanks that you found it! And sorry for introducing the stupid problem.

I'll post v2 soon.

Thanks!
metze


