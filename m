Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3A490B0E
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 16:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2esVUcXLAyHEb1h6JUo7sb8Ybk/MXtREIRuldfiBRew=; b=mmlOfZzAbGJ9wKWQL8nfC6P8B/
	ssG3Q+Wy/YAz+i/FohBI+VJfo3MDUiFklpIXm/gJuXHrF4pg3Xs4N3sXEPQpeBghkHaTPkdEsi9oj
	MuPSD1gbvhVW+dTzynls35ckRqd663YmAVH5F4pMIiBby4JsrWlwx3P0Zs8pr9SJhOkUypOSB9/ad
	O/hSPV5OTryfaRsZtXVtnMVOiQM5v6bJmrahZuUxxi3Llts8UuGMB3OIzSuePg9v64DYr5gJFPYRe
	0D+caX/seNThxAV/ihQd+KLfPLNGcrtCFT/Kwabhvn73rH8BWsNOuyoS/AkjPnlthRdc4K09IhNHY
	LS++sY0w==;
Received: from ip6-localhost ([::1]:54808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9TYC-009Cj0-Gb; Mon, 17 Jan 2022 15:04:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9TY7-009Cir-FX
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 15:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=2esVUcXLAyHEb1h6JUo7sb8Ybk/MXtREIRuldfiBRew=; b=JfwqHO4jTHxdTAgWlmta2yeOHz
 mHIiECpMFNyN+xoO5WLTEmQj4PQK8JH1OWXdrFsQ3/5KlGkLCE8s1yW7+FBZy6FC/QDv4g8rWbwz1
 81baVWGNGI9cy5Lnyk5DbY7/aneJB7I+MLL3oHRx82vFRtv96j0TMlTG5XY1ySQQ7X0wWPtESnk/i
 vQW5XSEn87qJ9SQLRQEwvZHcUT99BzqJoTtM9rGrrVlHSGDHtkRYbyWuROqqCQHGhq15jzPwFQ7yp
 Ecl7qnBwljR7L/ByNCf5Bk0nLP0aN1c9VwLLFrsdltBAKjZWGgcCtD4g9zd8Oea+vKNokYKWJw3jz
 7OypcxN6kZ4pgpq1cHehlgUq421RUOdY86XXpzpqladpS7Im7fcAY3geHcna7P3lYAcwIVyUAhJcf
 sD53rDfGS16fo3L0xAM4QpCbB6ASDIhgW209QvCVlKv8OknvTEFHUKTcb2ZHlsGtL3vG5y4YxbQ6x
 X8/iXJ9aQPXZ/2zX0qF2/4wz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n9TY3-007gSl-Hv; Mon, 17 Jan 2022 15:03:55 +0000
To: samba-technical@lists.samba.org, David Disseldorp <ddiss@samba.org>,
 Andreas Schneider <asn@samba.org>
References: <E1n9RtZ-001bnc-LI@hrx0.samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <06661a89-4284-9bbe-ac6d-59e21d813b10@samba.org>
Date: Mon, 17 Jan 2022 16:03:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <E1n9RtZ-001bnc-LI@hrx0.samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi David,

where's the related merge request for this push?

metze

Am 17.01.22 um 14:18 schrieb David Disseldorp:
> The branch, master has been updated
>        via  493fe1a4315 build: reduce printf() calls in generated build_options.c
>        via  7a8c6c362e0 build: reduce fp.write calls for build_options.c generation
>        via  6a463c40d75 s3:smbd: handle --build-options without parsing smb.conf
>       from  da2e1047f1f WHATSNEW: Document CTDB leader and cluster lock changes

