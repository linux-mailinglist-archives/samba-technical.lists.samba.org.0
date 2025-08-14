Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A3B25B90
	for <lists+samba-technical@lfdr.de>; Thu, 14 Aug 2025 08:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UCqxe0uzseqBxHLGblJCIGELxP8hCKamequ19psRu/g=; b=FXB/BWBqYrFuIAB3+yn0Lje/WS
	1D6NfthVxmuEjArOtIGcxOY94Hc+io7fVSg7azXASi/SBA30E7s+N1XmwQVKpzDNYRXH4jzb+M/bR
	/CSo9TFq9hjjcW12GGPat4ToNdIHkPO2fIgP8HEI6zY6og/PaIVKCsAnUy4b4LAyYBkZPrIMWjyk6
	eKxyEVjmR5zVQjbtVq3ERn7Cwh1QcXZ2n0kz7DhU+ib6pAbsDGtPNxnibMvhkR0iDbso4Qjj7isut
	pTHKbrQIvme8HNGIc5dNEgYbAmWRtBrcNqnu2Vx0n086jZKNt/Q2rESwSQGJVSjiOiJD4Krv59f1j
	cynRzsCQ==;
Received: from ip6-localhost ([::1]:53592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umR5K-00EzsU-Pm; Thu, 14 Aug 2025 06:05:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31900) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umR5E-00EzsK-1z
 for samba-technical@lists.samba.org; Thu, 14 Aug 2025 06:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=UCqxe0uzseqBxHLGblJCIGELxP8hCKamequ19psRu/g=; b=PQRz6dH4r3du8xffqmEgpZCIo1
 zKlOEiiBKd1c0GveDBsE/Wsl8x1Ca1UYUSr4Qyi8ZfRXZLHVY9Hv8L7oJHxzbDGEXCUoxGy7ueS7R
 jYyN5xjhRFTlBk6FpKsMcydrB0vNwGI/aJEMx2LV9dQM5rBteWWH5bTCybFwxJZ1bphQ5ZI1WhOXO
 21C9cNSpjuszlGHRKwLAze6w6iFnrbKvLaBL/0nRYlNehnX9v0XcK7r3bTbGDUi/6xAL1ViO7Hf24
 hJKFXuhbxn7UcYTY0fz1+6h6+jo+QeYEff+ZOt8uo00rwAbuLqAjDLeUcG/WaOIc839osGBfbxfW/
 5TjdCcn2nleqoYYdFX2oBqWvR47RSpMLsCDU4SLee4rS6tD57rysUtJ0hkngePBbc69ymRrqg5Y2O
 smIB7w/gUyNhOUWxQmM/jrov6dLfO4vTYxqV8fqOAtZ61cAvyvxPSum/0xSftAdrxRYHALeaTGRMy
 SRSKlcb0+CKkrJ7TsuR/fjtH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umR5D-002kTt-06; Thu, 14 Aug 2025 06:05:03 +0000
Message-ID: <9d5d9f41-019e-4339-81c9-62211feeb1f2@samba.org>
Date: Thu, 14 Aug 2025 08:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: third_party/quic_ko_wrapper/quic_ko_wrapper.c uses vla in struct
To: Gary Lockyer <gary@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <c8670964-a318-429e-a73d-da6cf132f32f@catalyst.net.nz>
Content-Language: en-US
In-Reply-To: <c8670964-a318-429e-a73d-da6cf132f32f@catalyst.net.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Gary,

> When I try and build current master with clang-20 I get the following error.
> 
> ../../third_party/quic_ko_wrapper/quic_ko_wrapper.c:3523:11: error: fields must have a constant size: 'variable length
> array in structure' extension will never be supported
>   3523 |                 uint8_t cmbuf[cmspace];
>        |                         ^
> 1 error generated.
> 
> I believe this is a non-standard extension that GCC supports, is this something we should try to get fixed upstream?

Maybe we can just remove the union and alignment thing and match what we have in
swrap_msghdr_add_cmsghdr().

metze

