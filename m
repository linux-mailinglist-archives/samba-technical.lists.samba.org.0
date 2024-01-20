Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E38378331F9
	for <lists+samba-technical@lfdr.de>; Sat, 20 Jan 2024 01:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RNbR+Mg8ea6t86tdcm+iYF0PK728l1O32FUCYmrYTbQ=; b=khc/iwAJNNhXEU1odSJ3pGuoe2
	HGINhc4ZQU27xVt6j+5RpMkfGsb2WsJWryvdsQFmyhYVGNzEEysvk/lfxoe/18moR4YhZMUCFZWx/
	DBcEOUcoYoOqZXqUXrMlsOpkMb5ePqDUDPvT8ye/WJS0FUe8dEG1w/mGgorhEQWQ02qeptTQAM+qX
	cxpJco1NKM5CX++AJDvAyrATngnosWkm5kg/A03bdymRw+r5Uz5mZ+Ijvo05/iGoWMOfEuTfdfEG8
	vgq6Ys/3uZ2pG7EL59OhMoVqAKlubZf4ztE7kvyyrs/CRN2Fv+VlfG/l8OOAItz30hMTSUlK0FTcT
	e1UDBECw==;
Received: from ip6-localhost ([::1]:64206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rQzar-0040ta-Fi; Sat, 20 Jan 2024 00:52:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15568) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQzam-0040tS-8r
 for samba-technical@lists.samba.org; Sat, 20 Jan 2024 00:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RNbR+Mg8ea6t86tdcm+iYF0PK728l1O32FUCYmrYTbQ=; b=o5WU7yQC2zjYlRgsD6+mMs2tLB
 yF0fXQm96kN6qGJa6wTE+UdXxRstrVftPWUQTD+2mnrHJprh/2fBu6Yrw9ve8TB/ogJsuWVsmNWKY
 KI1Kiv2sYs96Ue6986NADv7v7qf50nyH/fqpf+RvPFZgupI2Kg7FtD9lDu0i9iPCzqIfhNEHoKBER
 yl6wSX23UqM2a4p0xxQNKnCnYo96vaSfj8U9VfstuNFUWvf5Didmc5M9MWTlk+CJidZEAwnq82AF2
 Y9D/ddAWc/ZDDACcihqFGZSFqOrtb+q3yBE2Rp9WP4Ei2s1G74eVQOWmTjxhJ/Rj+IVF/cyE7Zr/p
 Sv+nTxyc7uaF9S/5lSBbZUrGz9HdKVUGDRiyQ/q5E31IwPk3QwGkTeUKqPnJQ5jjeTEN8I46P1U8u
 bK4iZegz23jXfOqYvHtZE2sNFcoFOeMVGirmElkE5jt4/dBAJyVANgfU3oUxL1DLpUTix9C04W+Gc
 JG6QtKKgyDDeJlTFELOqJxhu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQzal-008oUF-09; Sat, 20 Jan 2024 00:52:11 +0000
Date: Fri, 19 Jan 2024 16:52:08 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: Leak Sanitizer in Samba
Message-ID: <ZasZOEEanBukpq5e@jeremy-HP-Z840-Workstation>
References: <2330326.ElGaqSPkdT@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2330326.ElGaqSPkdT@magrathea>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 26, 2023 at 09:58:56AM +0200, Andreas Schneider via samba-technical wrote:
>Hi,
>
>you might already know AddressSanitizer. AddressSanitizer also has a
>LeakSanitizer built it, however it is disabled in Samba. I'm trying to get it
>working as we have memory leaks probably in Winbind and rpcd-lsa. So the last
>days I fixed issues which prevented to actually run 'make testenv'. In case
>you want to help fixing memory leaks you can use this branch:
>
>https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lsan
>
>I'm currently stuck with memcache and smbpasswd.
>
>The AD DC testenv already starts. It finds tfork leaks on shutdown. It would
>be great if someone could fix those ...

This looks like a fun hobby :-). Any more leaks to look at ?

Can you maybe post ones you find here ?

