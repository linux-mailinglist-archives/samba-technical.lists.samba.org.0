Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA9A32A8B
	for <lists+samba-technical@lfdr.de>; Wed, 12 Feb 2025 16:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kF21zVj7Uzknj9Y5xZTuCLbWTB4AvYjrLybh5BqiGx0=; b=N+7RXcHapynRzcuyomOC7ZEtcx
	ycKlXnlc+32hdc/I6ZbdA0ciz8Z2ecimDNLoUbaqxTJ1NynFdlKvsawCO2lACoSMCruDnHTwVTe+X
	uize7MElghKKAMcMUhGN9eWbkG8B2xaEsn5nT7S7XfUtR4dBTCd2sU4ypdrriWQZ9KNa2LAtCuwuj
	bwSelA8ZPiy3/iTnbAGKXk5XGw99FTs6lNfKgn30Tcc5KBjqQOHg+mlJyvAUl5Z4XTTSCKz1I1nZ3
	vw2uBjj3oNmmyzdkNaSlz80HsT87fkhZSWF7c7dCPUf3fD2WuMCRBh5dshZM2lSyrikIQgRPfuIDb
	un5zX8lg==;
Received: from ip6-localhost ([::1]:54622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiEz2-00CGwJ-9Y; Wed, 12 Feb 2025 15:49:04 +0000
Received: from zucker.schokokeks.org ([2a01:4f8:121:1ffe:1::2]:37105) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiEyy-00CGwC-Bm
 for samba-technical@lists.samba.org; Wed, 12 Feb 2025 15:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arkthis.com; s=key1;
 t=1739374721; bh=kF21zVj7Uzknj9Y5xZTuCLbWTB4AvYjrLybh5BqiGx0=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=iLdSdVlgZfQa99cFqEjWwXh0ic4yZKhXIfWnwHY+jBMGPaF7xU+w7OmY5pueqM5Az
 xxioOnq2tTEnWRz3Q8B5nhApkZbpfJVNNslvGPVJUss1+LzgmNoV0M7nM1Y/FJaUfa
 5rcP6nAeDkxrVfcqkxJhaIoPF3Nvckc63ygthp+ATNaJxvzY+Tw0M1+GYU6uDBhbPu
 DU7AO0xsSOnxE7i/qOELilkS5ylJA99HfF2dAbARhIdRwlctJjhX9y++rWdZAsPu6E
 BX/JKUR8KyKe/GS9jyCs5043HgNQYYIiYKPnfUVQxs6LdwQIQ9VIAH8RXSARVnX/FP
 yDGL6ASmQGiRg==
Original-Content-Transfer-Encoding: 7bit
Original-Subject: Reading >4kB xattrs (from ZFS) = input/output error
Author: pb+samba@Arkthis.com
Authentication-Results: zucker.schokokeks.org;
 dnswl=pass dns.zone=list.dnswl.org
 policy.ip=127.0.0.255
Message-ID: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
Date: Wed, 12 Feb 2025 16:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: Reading >4kB xattrs (from ZFS) = input/output error
Organization: ArkThis AV-RD (AudioVisual Research & Development)
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

Hi everyone :)

I've recently set a >40kB binary metadata as xattrs on ZFS, using 
`setfattr` locally.
Works fine, and I can read/write data like that without issues.

But when I try to access such "larger" xattrs over Samba using 
`getfattr`, I get the following error:

`getfattr: bigdata.test: Input/output error`

I've tried increasing the log-level on the server's smb.conf, but I 
couldn't make out relevant information telling me more about this.


The server's running Samba packed from Ubuntu (18.04): 
2:4.7.6+dfsg~ubuntu-0ubuntu2.29

I know that version's ancient, but it's a stable (in-house) production 
server.
What is the limit of Samba's support for xattrs, and is there anything I 
can do about this? (I've read all I could find on xattrs and smb.conf)


Thank you very much in advance for any insights :)
Peter

