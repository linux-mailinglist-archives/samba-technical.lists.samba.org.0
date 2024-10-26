Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499F9B1584
	for <lists+samba-technical@lfdr.de>; Sat, 26 Oct 2024 08:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=5/ePc/TnNvikv/irOwHKL3lioJk82cnre1BFo9rNgEg=; b=JyAkvhi08lOFuITeCs0PKJ4NQE
	gfyuoKvakkHPaukNlNnj1jnq+bS6M0d1Gl7GAGzxbn1m+0p8mMYp2SfE/qWrQvi60SJlg5K8z4Yj1
	bQQPI8+t8BcSq/oaj9kCFp3vj1FOU3i6CBt7wIey1PRQvoSc0g8Vde8vEgHkQ7z++UcbSsZvIxwpG
	AbyW+WsnHJu3cNWQXywdov0Atu+bUD8ye6bSEthGZrptfdRC7yqzamTfKeRiWAXi9xUHXwpUH7xMV
	Q1ag/uEYN3Vzf/fZgYwlRFADXMJWdRnRP4E7AMb4eiWGuL8Lbj8Q+icBxWspBTQmoTLadZaYgZbtL
	vRgpC3Kw==;
Received: from ip6-localhost ([::1]:50364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t4aaX-0052al-Ki; Sat, 26 Oct 2024 06:47:53 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:48289) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t4aaP-0052ad-SH
 for samba-technical@lists.samba.org; Sat, 26 Oct 2024 06:47:49 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 17A8F9C522
 for <samba-technical@lists.samba.org>; Sat, 26 Oct 2024 09:31:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0869915D899
 for <samba-technical@lists.samba.org>; Sat, 26 Oct 2024 09:32:17 +0300 (MSK)
Message-ID: <4911a1d9-346c-4099-ba02-a0f5e70ed3d1@tls.msk.ru>
Date: Sat, 26 Oct 2024 09:32:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical <samba-technical@lists.samba.org>
Subject: python crypt library in python/samba/tests/password_hash.py
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Samba password tests uses python crypt library.  However, this library has
been removed in python 3.13, so these tests don't work anymore - see
https://docs.python.org/3/whatsnew/3.13.html#whatsnew313-pep594 for
details.  There are several alternatives listed there as possible
replacements.

Can we get rid of this module usage?

Thanks,

/mjt

